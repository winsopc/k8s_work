#!/bin/bash
db=unix:/root/controller-sandbox/db-nb.sock
input=$PWD/ls-list.txt
ovn-nbctl --db=$db --data=bare --no-heading find Logical_Switch_Port |grep $1 >$input

echo $input
date
while IFS= read line
do
        # display $line or do something with $line
	echo "delete logical switch port" $line
	ovn-nbctl --wait=hv --db=$db lsp-del $line
done <"$input"
date

