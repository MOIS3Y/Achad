--█▀█ █▀█ █▀▀ ▀█▀ ▀█▀ █ █▀▀ █▀█ ▀
--█▀▀ █▀▄ ██▄ ░█░ ░█░ █ ██▄ █▀▄ ▄

--[[
MIT License
Copyright (c) 2022 Jonas Strittmatter
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
--]]

--[[
  ! Origin:
  https://github.com/smjonas/snippet-converter.nvim/blob/main/lua/snippet_converter/utils/table.lua
  json_pretty_print.lua
  https://gist.github.com/smjonas/d5faacaa01cfe8d80075279e221efc83
  https://www.reddit.com/r/neovim/comments/tftryc/plugin_authors_i_created_a_lua_script_that_turns/

Utility function that turns a Lua table into a nicely formatted JSON string (pretty-printing).
! Note:
- uses the Neovim-specific function vim.tbl_count(replaced with a similar function from the source code)
- each item is indented by 2 spaces
By default, keys in tables are sorted alhabetically
--]]

local helpers = {}

--- Counts the number of non-nil values in table `t`.
---
--- ```lua
--- vim.tbl_count({ a=1, b=2 })  --> 2
--- vim.tbl_count({ 1, 2 })      --> 2
--- ```
---
---@see https://github.com/Tieske/Penlight/blob/master/lua/pl/tablex.lua
---@param t table Table
---@return integer Number of non-nil values in table
function helpers.tbl_count(t)
  -- TODO: find it vim.validate(): 
  -- vim.validate({ t = { t, 't' } })
  local count = 0
  for _ in pairs(t) do
    count = count + 1
  end
  return count
end

helpers.unpack = table.unpack  -- or unpack for lua 5.1

--- Appends all elements from the second array to the first one.
---@param a1 table the first array
---@param a2 table the second array
---@return table #the updated first array
helpers.concat_arrays = function(a1, a2)
  if #a2 == 0 then
    return a1
  end
  for i = 1, #a2 do
    a1[#a1 + 1] = a2[i]
  end
  return a1
end

helpers.make_default_table = function(tbl, key)
  if key == nil then
    error("table.make_default_table: key is nil for for the passed table")
  end
  return setmetatable(tbl, {
    __index = function(_, actual_key)
      if key == actual_key then
        tbl[key] = {}
      end
      return tbl[key]
    end,
  })[key]
end

-- Removes all gaps in the array (https://stackoverflow.com/a/53038524/10365305)
helpers.compact = function(arr, gaps)
  local j = 1
  local n = #arr

  for i = 1, n do
    if gaps[i] then
      arr[i] = nil
    else
      -- Move i's kept value to j's position, if it's not already there.
      if i ~= j then
        arr[j] = arr[i]
        arr[i] = nil
      end
      j = j + 1 -- Increment position of where we'll place the next kept value.
    end
  end
  return arr
end

-- Returns an iterator that yields all items in the table in the order specified by compare.
helpers.pairs_by_keys = function(tbl, compare)
  local keys = {}
  for key, _ in pairs(tbl) do
    table.insert(keys, key)
  end
  compare = compare or function(a, b)
    return a:lower() < b:lower()
  end
  table.sort(keys, compare)
  local i = 0
  -- Return an iterator function
  return function()
    i = i + 1
    if keys[i] then
      return keys[i], tbl[keys[i]]
    end
  end
end

local _M = {}

function _M:escape_chars(str)
  -- Escape escape sequences (see http://www.lua.org/manual/5.1/manual.html#2.1).
  return str:gsub('[\\"\a\b\f\n\r\t\v]', {
    ["\\"] = "\\\\",
    ['"'] = '\\"',
    ["\a"] = "\\a",
    ["\b"] = "\\b",
    ["\f"] = "\\f",
    ["\n"] = "\\n",
    ["\r"] = "\\r",
    ["\t"] = "\\t",
    ["\v"] = "\\v",
  })
end

function _M:format_string(value)
  local result = self.escape_special_chars and self:escape_chars(value) or value
  self:emit(([["%s"]]):format(result), true)
end

function _M:format_table(value, add_indent)
  local tbl_count = helpers.tbl_count(value)
  self:emit("{\n", add_indent)
  self.indent = self.indent + 2
  local prev_indent = self.indent
  local i = 1
  -- This might be incorrect for more than two levels because the
  -- table to iterate over is always the same
  for k, v in helpers.pairs_by_keys(value, self.compare[self.indent / 2] or self.default_compare) do
    self:emit(('"%s": '):format(self.escape_special_chars and self:escape_chars(k) or k), true)
    if type(v) == "string" then
      -- Reset indent temporarily
      self.indent = 0
    end
    self:format_value(v)
    self.indent = prev_indent
    if i == tbl_count then
      self:emit("\n")
    else
      self:emit(",\n")
    end
    i = i + 1
  end
  self.indent = self.indent - 2
  self:emit("}", true)
end

function _M:format_array(value)
  local array_count = #value
  self:emit("[\n")
  self.indent = self.indent + 2
  for i, item in ipairs(value) do
    -- Also indent the following items
    self:format_value(item, true)
    if i == array_count then
      self:emit("\n")
    else
      self:emit(",\n")
    end
  end
  self.indent = self.indent - 2
  self:emit("]", true)
end

function _M:emit(value, add_indent)
  if add_indent then
    self.out[#self.out + 1] = (" "):rep(self.indent)
  end
  self.out[#self.out + 1] = value
end

function _M:format_value(value, add_indent)
  if value == nil then
    self:emit("null")
  end
  local _type = type(value)
  if _type == "string" then
    self:format_string(value)
  elseif _type == "number" then
    self:emit(tostring(value), add_indent)
  elseif _type == "boolean" then
    self:emit(value == true and "true" or "false", add_indent)
  elseif _type == "table" then
    local count = helpers.tbl_count(value)
    if count == 0 then
      self:emit("{}")
    elseif #value > 0 then
      self:format_array(value)
    else
      self:format_table(value, add_indent)
    end
  end
end

--[[

Utility function that turns a Lua table into a nicely formatted JSON string (pretty-printing).

---

Basic usage:

prettier:pretty_print({
  key = {
    a_table = {
      A = "v1",
      B = "v2",
    },
    an_array = { "one", 2 },
  },
})

returns the string:

{
  "key": {
    "a_table": {
      "A": "v1",
      "B": "v2"
    },
    "an_array": [
      "one",
      2
    ]
  }
}
--]]
---@param data table the table to pretty-print
---@return string
function _M:pretty_print(data, keys_orders, escape_special_chars)
  self.compare = {}
  if keys_orders then
    for indentation_level, keys_order in pairs(keys_orders) do
      local order = {}
      for i, key in ipairs(keys_order) do
        order[key] = i
      end
      local max_pos = #keys_order + 1
      self.compare[indentation_level] = function(a, b)
        return (order[a] or max_pos) - (order[b] or max_pos) < 0
      end
    end
  end
  self.default_compare = function(a, b)
    return a:lower() < b:lower()
  end
  self.escape_special_chars = escape_special_chars
  self.indent = 0
  self.out = {}
  self:format_value(data, false)
  return table.concat(self.out)
end

return _M
