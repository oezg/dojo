#! /bin/bash

function main() {
    jq -fsrj main.jq "data/$1" \
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

while getopts :ot opt; do
    case "$opt" in
    o)
        main "input.txt" "output.txt"
        xclip -selection clipboard "data/output.txt"
        ;;
    t)
        main "input.txt" "test.txt"
        compare "test.txt" "output.txt"
        ;;
    ?)
        main "basic.txt" "result.txt"
        compare "result.txt" "answer.txt"
        ;;
    esac
done
