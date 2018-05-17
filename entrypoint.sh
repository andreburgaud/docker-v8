#!/bin/bash
set -e

start_d8() {
    ./d8 $*
}

start_d8_shell() {
    OPTIONS=(--allow-natives-syntax --harmony-shipping
             --harmony-do-expressions --harmony-class-fields
             --harmony-static-fields --harmony-array-flatten)
    echo -e "\e[93mStarting d8 with the following parameters: ${OPTIONS[*]} $*\e[39m"
    echo -e "\e[93mUse quit() or Ctrl-D (i.e. EOF) to exit the d8 Shell\e[39m"
    bash -c "sleep 0.1; rlwrap --prompt-colour=green --multi-line ./d8 ${OPTIONS[*]} $*"
}

if [ "$1" = 'bash' ]; then
    echo -e "\e[93mUse ./d8 or ./entrypoint.sh to start the D8 Shell\e[39m"
    exec bash
elif [ "$1" = 'shell' ]; then
    shift
    start_d8_shell $@
else
    start_d8 $@
fi
