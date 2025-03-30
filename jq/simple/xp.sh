#! /bin/bash

destination="../$1"

cp -r "$(pwd)" "$destination"

truncate -s 0 "$destination"/data/*
