#! /bin/bash

jq -fsj main.jq test/data.txt >test/temp.txt

if cmp -s test/temp.txt test/answer.txt; then
    echo -e "\033[0;32mPassed! :)"
else
    echo -e "\033[0;31mFailed! :("
fi
