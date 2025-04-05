#! /bin/bash

function main() {
    # jq -fsrR -L "../../lib" main.jq "data/$1" |
    #     tee "data/$2"

    # filter per line and join with tr
    jq -frR -L "../../lib" main.jq "data/$1" |
        tr '\n' ' ' |
        sed 's/[[:space:]]*$//' |
        tee "data/$2"
}

function compare() {
    if cmp -s "data/$1" "data/$2"; then
        echo -e "\033[0;32mPassed! :)"
    else
        echo -e "\033[0;31mFailed! :("
    fi
}

while getopts :bcd:ef:ot opt; do
    case "$opt" in
    b)
        jq -cfR -L "../../lib" main.jq data/input.txt
        ;;

    c)
        main "basic.txt" "check.txt"
        compare "check.txt" "answer.txt"
        ;;
    d)
        # Run the debug.jq file with the provided arguments.
        echo "${@:$OPTIND-1}" | jq -f -L "../../lib" debug.jq
        ;;
    e)
        # Run the debug.jq file with the input.txt
        jq -cfR -L "../../lib" debug.jq data/input.txt
        ;;
    f)
        # Run the function in the main given as the first argument
        sed -nr "/def $OPTARG:/,/^\s*$|^\s*;\s*$|def \w+:/p" main.jq |
            sed -n '2,$ p' |
            head -n -1 |
            sed '$s/;$//' |
            sed 's/^[[:space:]]*//' >debug_"$OPTARG".jq
        echo "${@:$OPTIND}" | jq -rf -L "../../lib" "debug_$OPTARG.jq"
        ;;
    o)
        main "input.txt" "output.txt"
        ../zlip.sh -o
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
