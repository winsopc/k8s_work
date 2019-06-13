#!/bin/bash
db=unix:/root/controller-sandbox/db-nb.sock
input=$PWD/ls-list.txt
ovn-nbctl --db=$db ls-list |grep $1 |awk '{print $1}'t >$input

echo $input
date
while IFS= read line
do
        # display $line or do something with $line
	date
	echo "delete logical switch" $line
	ovn-nbctl --wait=hv --db=$db ls-del $line
done <"$input"
date

