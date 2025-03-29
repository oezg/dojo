#! /bin/bash

jq -sRf main.jq input.txt >temp.txt

if cmp -s temp.txt output.txt; then
    echo -e "\033[0;32mPassed! :)"
else
    echo -e "\033[0;31mFailed! :("
fi
