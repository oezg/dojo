#! /bin/bash

jq -frsR main.jq input.txt >output.txt

xclip -selection clipboard output.txt
