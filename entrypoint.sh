#!/bin/bash
set -e

start_d8() {
    d8 $*
}

start_d8_shell() {
    OPTIONS=(--allow-natives-syntax --harmony-shipping
             --harmony-do-expressions --harmony-class-fields
             --harmony-static-fields --harmony-array-flatten
             --harmony-numeric-separator)
    echo -e "\e[93mOptions\e[39m: ${OPTIONS[*]} $*"
    echo -e "\e[93mUse quit() or Ctrl-D (i.e. EOF) to exit the D8 Shell\e[39m"
    bash -c "sleep 0.5; rlwrap --prompt-colour=green --multi-line d8 ${OPTIONS[*]} $*"
}

if [ "$1" = 'bash' ]; then
    echo -e "\e[93mExecute d8 or /entrypoint.sh to start the D8 Shell\e[39m"
    exec bash
elif [ "$1" = 'shell' ]; then
    shift
    start_d8_shell $@
elif [ "$1" = 'version' ]; then
    echo -e "\e[92mV8 version ${V8_VERSION}\e[39m"
elif [ "$1" = 'help' ]; then
    echo -e "\e[92mV8 version ${V8_VERSION}\e[39m"
    echo -e "\e[93mUsage:\e[39m"
    echo -e "    \e[97mdocker run --rm -it d8 shell\e[39m     : starts enhanced d8 shell"
    echo -e "    \e[97mdocker run --rm -it d8\e[39m           : starts default d8 shell"
    echo -e "    \e[97mdocker run --rm -it d8 help\e[39m      : displays this help"
    echo -e "    \e[97mdocker run --rm -it d8 version\e[39m   : displays V8 version"
else
    start_d8 $@
fi
