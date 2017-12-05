#!/bin/bash

create_disk() {
	local groupname=$1; shift
	local number=$1; shift
	local size=$1; shift

	mkdir /u01/$groupname
	for ((i=0; i<number; i++)); do
		/usr/sbin/mkfile -n "$size" "/u01/$groupname/$groupname$i"	
	done;
}
