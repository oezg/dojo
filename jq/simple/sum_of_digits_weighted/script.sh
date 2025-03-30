#! /bin/bash

jq -fsj main.jq input.txt >output.txt

xclip -selection clipboard output.txt
