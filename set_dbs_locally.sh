#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: sh $0 [ path/to/app.yaml ]"
    exit
fi

sqlhost=$(cat $1 | grep LOCAL_SQL_HOST)
[[ $sqlhost =~ [A-Z_]+:[[:space:]](\')(.*)(\') ]]
sql_addr=${BASH_REMATCH[2]}
echo $sql_addr

sqldb=$(cat $1 | grep LOCAL_SQL_DBNAME)
echo $sqldb
[[ $sqldb =~ [A-Z_]+:[[:space:]](\')([a-z]+)(\') ]]
sqlname=${BASH_REMATCH[2]}
echo $sqlname

rdbhost=$(cat $1 | grep RDB_HOST)
[[ $rdbhost =~ [A-Z_]+:[[:space:]](\')(.*)(\') ]]
rdb_addr=${BASH_REMATCH[2]}
echo $rdb_addr

rdb=$(cat $1 | grep RDB_DBNAME)
[[ $rdb =~ [A-Z_]+:[[:space:]](\')(.*)(\') ]]
rdbname=${BASH_REMATCH[2]}
echo $rdbname

export LOCAL_SQL_HOST=$sql_addr
export LOCAL_SQL_DBNAME=$sqlname
export RDB_HOST=$rdb_addr
export RDB_DBNAME=$rdbname



