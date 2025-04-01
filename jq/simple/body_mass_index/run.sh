#! /bin/bash

function main() {
    jq -fsrR -L "../../lib" main.jq "data/$1" \
        >"data/$2"
    # tr '\n' ' ' |
    # sed 's/[[:space:]]*$//' \
}

function compare() {
    if cmp -s "data/$1" "data/$2"; then
        echo -e "\033[0;32mPassed! :)"
    else
        echo -e "\033[0;31mFailed! :("
    fi
}

while getopts :cot opt; do
    case "$opt" in
    c)
        main "basic.txt" "check.txt"
        compare "check.txt" "answer.txt"
        ;;
    o)
        main "input.txt" "output.txt"
        # xclip -selection clipboard "data/output.txt"
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
