#!/usr/bin/env bash
# Here we check whether the host listens given tcp port

grep -v "rem_address" /host/proc/net/tcp |
grep '0A' |
awk  '{x=strtonum("0x"substr($2,index($2,":")-2,2)); for (i=5; i>0; i-=2) x = x"."strtonum("0x"substr($2,i,2))}{print x":"strtonum("0x"substr($2,index($2,":")+1,4))}' |
cut -d':' -f2 |
grep -wq $1