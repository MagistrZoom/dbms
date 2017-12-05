#!/bin/bash

. ./env

if [ ! -e "$MP" ]; then
    mkdir -p "$MP"
    mkdir "$MP/node01"
    mkdir "$MP/node02"
    mkdir "$MP/node03"
    mkdir "$MP/node04"
fi

cp "init$ORACLE_SID.ora" "$ORACLE_HOME/dbs/"
orapwd file="$ORACLE_HOME/dbs/orapw$ORACLE_SID" force=y password=ssp entries=10
echo "SQLNET.AUTHENTICATION_SERVICES=none" > /u01/app/oracle/product/11.2.0/dbhome_1/network/admin/sqlnet.ora
sqlplus /nolog @create_db.sql
