#!/bin/bash 

DBNAME=dbsnp


fix_sql()
{
    cat $1 | perl -pi -e "s/\[binary]/bytea/;" \
            -e "s/\[//g;" \
            -e "s/]//g;" \
            -e "s/^GO/;/;" \
            -e "s/int IDENTITY\(1,1\)/serial/;" \
            -e "s/smalldatetime/timestamp with time zone/;" \
            -e "s/tinyint/smallint/;" \
            -e "s/datetime/timestamp with time zone/;" \
            -e "s/CREATE NONCLUSTERED/CREATE/;" \
            -e "s/CREATE CLUSTERED/CREATE/;" \
            -e "s/INDEX ([a-zA-Z0-9_]+) ON ([a-zA-Z0-9_]+)/INDEX \1_\2 ON \2/;" \
            -e "s/ALTER TABLE ([[:alnum:]_]+) ADD CONSTRAINT [[:alnum:]_]+ DEFAULT ([[:alnum:]_()']+) FOR ([[:alnum:]_]+)/alter table \1  alter \3 set default \2;/;" \
            -e "s/default [(]GETDATE[()]+/default now()/;" \
            -e "s/PRIMARY KEY  (CLUSTERED|NONCLUSTERED)/PRIMARY KEY/;" \
            -e "s/(PRIMARY KEY \(.*)(ASC|DESC)/\1/;" \
            -e "s/(PRIMARY KEY \(.*)(ASC|DESC)/\1/;" \
            -e "s/(PRIMARY KEY \(.*)(ASC|DESC)/\1/;" \
            -e "s/(PRIMARY KEY \(.*)(ASC|DESC)/\1/;" \
            -e "s/UNIQUE  NONCLUSTERED/UNIQUE/;" \
            -e "s/(ADD CONSTRAINT +[a-zA-Z0-9_]+ +UNIQUE +\(.+)( ASC| DESC)/\1/;" \
            -e "s/(ADD CONSTRAINT +[a-zA-Z0-9_]+ +UNIQUE +\(.+)( ASC| DESC)/\1/;" \
            -e "s/.*BatchAssertedPositionSourceId.*//;" \
            -e 's/^offset /"offset"/;' \
            -e 's/,offset/,"offset"/;' \
            -e 's/.*The statement has been terminated.*//;' \

}

for f in */*_index.sql */*_constraint.sql
do
    echo "%%%-INFO: loading file $f..."
    echo $f | grep -i 'constraint' > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        # make sure to execute all the primary key constraints first this 
        # dump file is broken in that some FK appear before all PK's
        (echo '\set ON_ERROR_STOP on'; fix_sql $f | grep -A1 'PRIMARY KEY') | psql --echo-all dbsnp
        if [ $? -ne 0 ]; then
            echo "%%%-ERROR: problem extracting primary keys from file $f, exiting..."
            exit 1
        fi
    fi
    (echo '\set ON_ERROR_STOP on'; fix_sql $f | grep -v 'PRIMARY KEY') | psql --echo-all dbsnp
    if [ $? -ne 0 ]; then
        echo "%%%-ERROR: problem loading file $f, exiting..."
        exit 1
    fi
done





