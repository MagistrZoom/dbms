#!/bin/bash

cwd=$(cd `dirname $0` && /bin/pwd)

. $cwd/../asm_env

. $cwd/../util.sh

exec_as_sysasm "DROP DISKGROUP poorsnake;"

create_disk poorsnake 8 100m

exec_as_sysasm "CREATE DISKGROUP poorsnake NORMAL REDUNDANCY FAILGROUP f1 DISK '/u01/poorsnake/poorsnake0','/u01/poorsnake/poorsnake1' FAILGROUP f2 DISK '/u01/poorsnake/poorsnake2','/u01/poorsnake/poorsnake3' FAILGROUP f3 DISK '/u01/poorsnake/poorsnake4','/u01/poorsnake/poorsnake5' FAILGROUP f4 DISK '/u01/poorsnake/poorsnake6','/u01/poorsnake/poorsnake7';"
