#! /bin/bash

while getopts :abiom option; do
    case "$option" in
    a)
        xclip -o >data/answer.txt
        ;;
    b)
        xclip -o >data/basic.txt
        ;;
    i)
        xclip -o >data/input.txt
        sed -i 1d data/input.txt
        ;;
    o)
        xclip -selection clipboard data/output.txt
        ;;
    m)
        xclip -selection clipboard main.jq
        ;;
    ?)
        echo "Invalid option ${OPTARG}"
        exit 1
        ;;

    esac
done
