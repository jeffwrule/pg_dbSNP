#!/bin/bash 

DBNAME=dbsnp

psql postgres postgres -c "drop database $DBNAME"
if [ $? -ne 0 ]; then
    echo  "%%%-ERROR: Problem dropping orig database $DBNAME"
    exit 1
fi
    
psql postgres postgres -c "create database $DBNAME"
if [ $? -ne 0 ]; then
    echo  "%%%-ERROR: Problem creating database $DBNAME"
    exit 1
fi

fix_sql()
{
    sed  -E -e "s/\[//g" \
            -e "s/]//g" \
            -e "s/^GO/;/" \
            -e "s/int IDENTITY\(1,1\)/serial/" \
            -e "s/smalldatetime/timestamp with time zone/" \
            -e "s/tinyint/smallint/" \
            -e "s/datetime/timestamp with time zone/" \
            -e "s/CREATE NONCLUSTERED/CREATE/" \
            -e "s/CREATE CLUSTERED/CREATE/" \
            -e "s/INDEX ([a-zA-Z0-9_]+) ON ([a-zA-Z0-9_]+)/INDEX \1_\2 ON \2/" \
            -e "s/ALTER TABLE ([[:alnum:]_]+) ADD CONSTRAINT [[:alnum:]_]+ DEFAULT ([[:alnum:]_()']+) FOR ([[:alnum:]_]+)/alter table \1  alter \3 set default \2;/" \
            -e "s/default \(GETDATE\())/default now()/" \
            -e "s/PRIMARY KEY  (CLUSTERED|NONCLUSTERED)/PRIMARY KEY/" \
            -e "s/(PRIMARY KEY \(.*)(ASC|DESC)/\1/" \
            -e "s/(PRIMARY KEY \(.*)(ASC|DESC)/\1/" \
            -e "s/(PRIMARY KEY \(.*)(ASC|DESC)/\1/" \
            -e "s/UNIQUE  NONCLUSTERED/UNIQUE/" \
            -e "s/(ADD CONSTRAINT +[a-zA-Z0-9_]+ +UNIQUE +\(.+)( ASC| DESC)/\1/" \
            -e "s/(ADD CONSTRAINT +[a-zA-Z0-9_]+ +UNIQUE +\(.+)( ASC| DESC)/\1/" \
            -e "s/.*BatchAssertedPositionSourceId.*//" \
            $1
}

for f in dbSNP_main_table.sql 	dbSNP_main_index.sql dbSNP_main_constraint.sql
do
    echo "%%%-INFO: loading file $f..."
    (echo '\set ON_ERROR_STOP on'; fix_sql $f) | psql --echo-all dbsnp
    if [ $? -ne 0 ]; then
        echo "%%%-ERROR: problem loading file $f, exiting..."
        exit 1
    fi
done
exit

dbSNP_main_constraint.sql:ALTER TABLE [SNP_tax_id] ADD CONSTRAINT [DF__SNP_tax_i__statu__31583BA0] DEFAULT ('C') FOR [status]
