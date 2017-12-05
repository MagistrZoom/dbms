#!/bin/bash

cwd=$(cd `dirname $0` && /bin/pwd)

. $cwd/../asm_env

. $cwd/../util.sh

create_disk youngseal 5 50m

asmcmd dsset '/u01/bravefox/*,/u01/bravecrocodile/*,/u01/carelesscat/*,/u01/excitingdeer/*,/u01/youngseal/*'
list=$( get_disks youngseal )
exec_as_sysasm "CREATE DISKGROUP youngseal EXTERNAL REDUNDANCY DISK $list ATTRIBUTE 'AU_SIZE'='1M';"
