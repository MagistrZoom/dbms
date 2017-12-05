#!/bin/bash

cwd=$(cd `dirname $0` && /bin/pwd)

. $cwd/../asm_env

. $cwd/../util.sh

exec_as_sysasm "DROP DISKGROUP youngseal;"
asmcmd dsset '/u01/bravefox/*,/u01/bravecrocodile/*,/u01/carelesscat/*,/u01/excitingdeer/*,/u01/sadtiger/*,/u01/poorsnake/*'

