#!/bin/bash 

export PGDATABASE=dbsnp

uname -a | grep -i Linux > /dev/null 2>&1
if [ $? -eq 0 ]; then
    gzcat=zcat
else
    gzcat=gzcat
fi

PROG=$(basename $0)
usage()
{
    echo "USAGE: $PROG --help --local_path <local_path_to_date> [--db dbname ] [--user db_user] [--pass db_pass] [--host db_host] [--reset] [--file <compressed bcp file>]"
    echo "  --file          bcp.gz file to load (only loads a single table)"
    echo "  --local_path    path to local data file directory"
    echo "  --db            postgres database to load data into"
    echo "  --user          postgres database user"
    echo "  --pass          postgres database password"
    echo "  --host          postgres database user"
    echo "  --reset         clear the previously loaded flag for all files before loading"
    echo ""
    echo "  If no --table option is specified all tables in the specified --local_path"
    echo "      directory are loaded, if and only if they match the md5 checksum and"
    echo "      they have not been marked as loaded.   Each time a file is loaded a"
    echo "      marker file called <file>.loaded is created in the same directory."
    echo "      if this file exists, the table is not reloaded.   This allows for "
    echo "      convient restarts and completion of partial loads"
}

usage_error()
{
    usage
    echo "%%%-ERROR: you must supply a $1 parameter"
    exit 1
}

file_list=*.gz
num_error=0
num_success=0
num_total=0
num_previous=0
reset=
local_path=
db=
dbuser=
dbpass=
dbhost=

while [ $# -gt 0 ]
do
    case "$1" in
        --he*)   # help
            usage && exit 0
            ;;
        --f*) #file
            if [ $# -lt 2 ]; then
                usage
                echo "%%%-ERROR: you must supply an argument for $1 option"
                exit1
            fi
            shift
            file_list=$1
            ;;            
        --l*) #local_path
            if [ $# -lt 2 ]; then
                usage
                echo "%%%-ERROR: you must supply an argument for $1 option"
                exit1
            fi
            shift
            local_path=$1
            ;;  
        --d*) #db
            if [ $# -lt 2 ]; then
                usage
                echo "%%%-ERROR: you must supply an argument for $1 option"
                exit1
            fi
            shift
            db=$1
            ;;  
        --u*) #dbuser
            if [ $# -lt 2 ]; then
                usage
                echo "%%%-ERROR: you must supply an argument for $1 option"
                exit1
            fi
            shift
            dbuser=$1
            ;;  
        --p*) #dbpass
            if [ $# -lt 2 ]; then
                usage
                echo "%%%-ERROR: you must supply an argument for $1 option"
                exit1
            fi
            shift
            dbpass=$1
            ;;  
        --h*) #dbhost
            if [ $# -lt 2 ]; then
                usage
                echo "%%%-ERROR: you must supply an argument for $1 option"
                exit1
            fi
            shift
            dbhost=$1
            ;;  
        --r*) #reset
            reset=true
            ;; 
        *)
            usage
            echo "%%%-ERROR: unknown option ($1)"
            exit 1
            ;;
    esac
    shift
done

for param in local_path 
do
    remote_file=
    if [ -z "${!param}" ]; then
        usage_error -$param
    fi
done

[ ! -z $db ] && export PGDATABASE=$db
[ ! -z $dbuser ] && export PGUSER=$dbuser
[ ! -z $dbpass ] && export PGPASSWORD=$dbpass
[ ! -z $dbhost ] && export PGHOST=$dbhost

psql -q -w < /dev/null
if [ $? -ne 0 ]; then
    echo "%%%-ERROR: can not connect to database, exiting"
    exit 1
fi

if [ ! -r "$local_path" ]; then
    echo "%%%-ERROR: local directory ($local_path) is not readable, exiting..."
    exit 1
fi

if [ ! -x "$local_path" ]; then
    echo "%%%-ERROR: local directory ($local_path) can not be listed, exiting..."
    exit 1
fi

if  [ ! -z $reset ]; then
    rm -f $local_path/*.loaded
    if [ $? -ne 0 ]; then
        echo "%%%-ERROR: problem clearing list of loaded files"
        exit 1
    fi
    echo "%%%-INFO: all previous load flags cleared for tables in $local_path"
fi

for f in $(echo "$local_path/$file_list")
do
    echo 
    echo ----------------------------------------------------------------------------------------------------------------------------------------------
    num_total=$((num_total + 1))
    echo
    echo "    %%%-INFO: $(date) starting to load file $f "
    
    if [ -f $f.loaded ]; then
        num_previous=$((num_previous + 1))
        echo "    %%%-INFO: file already loaded, skipping"
        continue
    fi
    
    if [ ! -r $f ]; then
        num_error=$((num_error + 1))
        echo "    %%%-ERROR: can't read file $f, skipping"
        continue;
    fi
    
    md5_file=$f.md5
    if [ ! -f $md5_file ]; then
        num_error=$((num_error + 1))
        echo "    %%%-ERROR: can't find md5 file $md5_file, exiting..."
        continue
    fi
    
    if [ ! -r $md5_file ]; then
        num_error=$((num_error + 1))
        echo "    %%%-ERROR: md5 stamp file not readable, skiplling..."
        continue
    fi
    
    md5=$(md5 $f 2>/dev/null | perl -pi -e 's/\s+/\t/g' | cut -f4)
    grep "$md5" $md5_file > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        num_error=$((num_error + 1))
        echo "    %%%-ERROR: md5 stamp $md5 does not match stored: ($(cat $md5_file)), skipping..."
        continue
    fi
    
    base_file=$(basename $f)
    table_name=${base_file%%.bcp.gz}
    

    echo "    %%%-INFO: loading $($gzcat $f | wc -l) lines of data from a $(du -sh $f|cut -f1) compressed file..."

    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    $gzcat $f | head -5
    CMD="psql -c \"truncate table $table_name\""
    echo $CMD
    eval $CMD
    if [ $? -ne 0 ]; then
        num_error=$((num_error + 1))
        echo "    %%%-ERROR: could not truncate table $table_name, skipping"
        continue
    fi
    CMD="(echo '\timing on'; echo \"copy $table_name from STDIN with (null '');\"; $gzcat $f; echo '\.') | psql -q"
    echo $CMD
    eval $CMD
    if [ $? -ne 0 ]; then
        num_error=$((num_error + 1))
        echo "    %%%-ERROR could not load table $table_name, skipping"
        continue
    fi
    touch $f.loaded
    if [ ! -f $f.loaded ]; then
        num_error=$((num_error + 1))
        echo "    %%%-ERROR: problem touching $f.loaded"
        continue
    fi
    
    psql --echo-all -c "select count(*) from $table_name"
    psql --echo-all -c "select * from $table_name limit 5"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo 

    num_success=$((num_success + 1))
    echo "    %%%-INFO: $(date) COMPLETE load table $f "

done

echo
echo
if [ $num_error -gt 0 ]; then
    echo "%%%-ERROR: $num_error files not loaded"
    echo "%%%-ERROR: total/already_loaded/loaded/error files $num_total/$num_previous/$num_success/$num_error"
else
    echo "%%%-SUCCESS: total/already_loaded/loaded/error files $num_total/$num_previous/$num_success/$num_error"
fi

    
