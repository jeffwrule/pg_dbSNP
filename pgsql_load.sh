#!/bin/bash

export PGDATABASE=dbsnp

PROG=$(basename $0)
usage()
{
    echo "USAGE: $PROG --help [--t table]"
    echo "  --table  table to load"
}

file_list=*/*.gz
table_name=

while [ $# -gt 0 ]
do
    case "$1" in
        --he*)   # help
            usage && exit 0
            ;;
        --t*able) #table
            if [ $# -lt 2 ]; then
                usage
                echo "%%%-ERROR: you must supply and argument for $1 option"
                exit1
            fi
            shift
            table_name=$1
            ;;            
        *)
            usage
            echo "%%%-ERROR: unknown option ($1)"
            exit 1
            ;;
    esac
    shift
done

if [ ! -z "$table_name" ]; then
    file_list=*/${table_name}.bcp.gz
fi

for f in $file_list
do
    echo
    echo "%%%-INFO: $(date) starting to load table $f -------------------------------------"
    md5_file=$f.md5
    if [ ! -f $md5_file ]; then
        echo "%%%-ERROR: can't find md5 file $md5_file, exiting..."
        exit 1
    fi
    md5=$(md5 $f | perl -pi -e 's/\s+/\t/g' | cut -f4)
    grep "$md5" $md5_file > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "%%%-ERROR: md5 stamp $md5 does not match $(cat $md5_file), exiting..."
        exit 1
    fi
    base_file=$(basename $f)
    table_name=${base_file%%.bcp.gz}
    
    echo "    %%%-INFO: starting load into table $table_name"
    gzcat $f | head -5
    psql --echo-all -c "truncate table $table_name"
    if [ $? -ne 0 ]; then
        echo "%%%-ERROR: could not truncate table $table_name, exiting"
        exit 1
    fi
    gzcat $f | psql --echo-all -c "copy $table_name from STDIN" 
    if [ $? -ne 0 ]; then
        echo "%%%-ERROR could not load table $table_name, exiting"
        exit 1
    fi
    psql --echo-all -c "select count(*) from $table_name"
    psql --echo-all -c "select * from $table_name limit 5"
done

    