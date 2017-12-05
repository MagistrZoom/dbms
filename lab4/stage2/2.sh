#!/bin/bash

cwd=$(cd `dirname $0` && /bin/pwd)

. $cwd/../asm_env

. $cwd/../util.sh

create_disk sadtiger 3 100m

asmcmd dsset '/u01/bravefox/*,/u01/bravecrocodile/*,/u01/carelesscat/*,/u01/excitingdeer/*,/u01/youngseal/*,/u01/sadtiger/*'
list=$( get_disks sadtiger )
exec_as_sysasm "CREATE DISKGROUP sadtiger EXTERNAL REDUNDANCY DISK $list ATTRIBUTE 'AU_SIZE'='8M';"
