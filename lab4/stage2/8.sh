#!/bin/bash

cwd=$(cd `dirname $0` && /bin/pwd)

. $cwd/../asm_env

. $cwd/../util.sh

exec_as_sysasm "ALTER DISKGROUP sadtiger DROP DISK SADTIGER_0001;"
