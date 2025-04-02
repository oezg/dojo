#! /bin/bash

function main() {
    jq -fsrR -L "../../lib" main.jq "data/$1" \
        >"data/$2"

    # filter per line and join with tr
    # jq -frR -L "../../lib" main.jq "data/$1" |
    #     tr '\n' ' ' |
    #     sed 's/[[:space:]]*$//' \
    #         >"data/$2"
}

function console() {
    echo "$@" | jq -fR -L "../../lib" main.jq
}

function compare() {
    if cmp -s "data/$1" "data/$2"; then
        echo -e "\033[0;32mPassed! :)"
    else
        echo -e "\033[0;31mFailed! :("
    fi
}

while getopts :cdf:ot opt; do
    case "$opt" in
    c)
        main "basic.txt" "check.txt"
        compare "check.txt" "answer.txt"
        ;;
    d)
        # Run the debug file with the provided arguments.
        echo "${@:$OPTIND}" | jq -L "../../lib" -f debug.jq
        ;;
    f)
        # Run the function in the main given as the first argument
        sed -nr "/def $OPTARG:/,/^\s*$|^\s*;\s*$|def \w+:/p" main.jq |
            sed -n '2,$ p' |
            head -n -1 |
            sed '$s/;$//' |
            sed 's/^[[:space:]]*//' >debug_"$OPTARG".jq
        echo "${@:$OPTIND}" | jq -r -L "../../lib" -f "debug_$OPTARG.jq"
        ;;
    o)
        main "input.txt" "output.txt"
        ./clip.sh -o
        ;;
    t)
        main "input.txt" "test.txt"
        compare "test.txt" "output.txt"
        ;;
    ?)
        echo "Invalid option ${OPTARG}"
        exit 1
        ;;
    esac
done
