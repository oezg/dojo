#! /bin/bash

function main() {
    jq -fR main.jq "data/$1" |
        tr '\n' ' ' |
        sed 's/[[:space:]]*$//' >"data/$2"
}

function compare() {
    if cmp -s "data/$1" "data/$2"; then
        echo -e "\033[0;32mPassed! :)"
    else
        echo -e "\033[0;31mFailed! :("
    fi
}

while getopts :at opt; do
    case "$opt" in
    a)
        main "basic.txt" "result.txt"
        compare "result.txt" "answer.txt"
        ;;
    t)
        main "input.txt" "test.txt"
        compare "test.txt" "output.txt"
        ;;
    ?)
        main "input.txt" "output.txt"
        xclip -selection clipboard "data/output.txt"
        ;;
    esac
done
