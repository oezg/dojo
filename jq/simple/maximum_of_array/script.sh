#! /bin/bash

jq -frs main.jq input.txt >output.txt

xclip -selection clipboard output.txt
