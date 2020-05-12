#!/usr/bin/env bash
find /host/proc/[0-9]*/exe -exec readlink -f {} \; | grep -wq $1
echo $?