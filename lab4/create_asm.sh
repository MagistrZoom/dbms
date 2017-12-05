#!/bin/bash

. ./asm_env

. ./util.sh

#===
# create files for disk groups
#===
create_disk bravefox 6 50m
create_disk carelesscat 6 50m
create_disk bravecrocodile 5 50m
create_disk excitingdeer 3 50m

#===
# copy init file
#===
cp init$ORACLE_SID.ora $ORACLE_HOME/dbs

#===
# Start Cluster Synchronization service
#===
crsctl start resource ora.cssd

#===
# Start ASM instance for diskgroup creation
#===
exec_as_sysasm "STARTUP" 

# Register diskgroups in ASM
#===
for i in bravefox carelesscat bravecrocodile excitingdeer; do
    list=$( get_disks $i )
    exec_as_sysasm "CREATE DISKGROUP $i EXTERNAL REDUNDANCY DISK $list ATTRIBUTE 'COMPATIBLE.ASM'='11.2.0.0.0';"
done

# Is really needed? ATTRIBUTE 'COMPATIBLE.ASM'='11.2.0.0.0'

#===
srvctl add asm -p '+EXCITINGDEER/asm/asm_spfile.ora' # do I really need this? -d ’+EXCITINGDEER’
#===

#===
# Create spfile
#===
exec_as_sysasm "CREATE SPFILE FROM MEMORY"

#===
# Fix warning about deprecated parameters
#===
exec_as_sysasm "alter system reset background_dump_dest;"
exec_as_sysasm "alter system reset user_dump_dest;"
exec_as_sysasm "alter system set diagnostic_dest='/u01/app/11.2.0/grid/log/diag/asm/+asm/ASM.191941/trace';"

#===
# Restart instance to pickup spfile
#===
exec_as_sysasm "SHUTDOWN IMMEDIATE"
exec_as_sysasm "STARTUP"
