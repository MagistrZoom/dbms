#!/bin/bash

cwd=$(cd `dirname $0` && /bin/pwd)

. $cwd/../asm_env

. $cwd/../util.sh

/usr/sbin/mkfile -n "100M" "/u01/bravefox/bravefox6"
exec_as_sysasm "ALTER DISKGROUP bravefox ADD DISK '/u01/bravefox/bravefox6';"
