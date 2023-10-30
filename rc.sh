run_xephyr() {
    Xephyr :5 -ac -br -noreset -screen 1366x768 -dpi 96 -zaphod -glamor &
}

run_awesome() {
    export DISPLAY=:5
    dbus-run-session awesome -c ./rc.lua
}

main() {
    run_xephyr
    sleep 1
    run_awesome
}

main $@
