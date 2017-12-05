#!/bin/bash

cwd=$(cd `dirname $0` && /bin/pwd)

. $cwd/../asm_env

. $cwd/../util.sh

create_disk poorsnake 6 100m

asmcmd dsset '/u01/bravefox/*,/u01/bravecrocodile/*,/u01/carelesscat/*,/u01/excitingdeer/*,/u01/youngseal/*,/u01/sadtiger/*,/u01/poorsnake/*'
list=$( get_disks poorsnake )
exec_as_sysasm "CREATE DISKGROUP poorsnake EXTERNAL REDUNDANCY DISK $list ATTRIBUTE 'AU_SIZE'='16M';"
