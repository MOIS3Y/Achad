#!/usr/bin/env bash

# run virt display
run_xephyr() {
    Xephyr :5 -ac -br -noreset -screen 1366x768 -dpi 96 -zaphod -glamor &
}

# run awesome wm
run_awesome() {
    # set env:
    export DISPLAY=:5
    export ACHAD_THEME="catppiccin_mocha"
    export ACHAD_DEVICE="computer"

    sleep 1  # require pause min 1 sec
    dbus-run-session awesome -c ./rc.lua
}

# entrypoint
main() {
    run_xephyr
    run_awesome
}

# RUN IT
main $@
