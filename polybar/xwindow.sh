#!/bin/bash

output="$(xprop -id $(xdotool getwindowfocus) WM_CLASS | awk -F'[,""]' '{print $2}')"

if [[ -n $output ]]
then
  printf -- "%s\n" "$output"
else 
  windowManagerName () {
    local window=$(
        xprop -root -notype
    )

    local identifier=$(
        echo "${window}" |
        awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}'
    )

    local attributes=$(
        xprop -id "${identifier}" -notype -f _NET_WM_NAME 8t
    )

    local name=$(
        echo "${attributes}" |
        grep "_NET_WM_NAME = " |
        cut --delimiter=' ' --fields=3 |
        cut --delimiter='"' --fields=2
    )

    echo "${name}"
}


windowManagerName
fi
