#!/bin/bash

export PGDATABASE=dbsnp

PROG=$(basename $0)
usage()
{
    echo "USAGE: $PROG --help --remote_path <remote_path> [--local_path <local path>] [--host host_name]"
    echo ""
    echo "  program to sync all remote files ending in .gz from remote site"
    echo
    echo "  The script will first sync all the *.md5 files"
    echo "  for each *.md5 file, if the associated .gz file exists and has"
    echo "  matches the .md5 it will be skipped, this allows for easy restart"
    echo 
    echo "  The list of tables to sync is derived from the list of synced *.md5 files"
    echo 
    echo "  --remote_path path on remote ftp site to pull all files"
    echo "  --local_path directory to sync remote contents to"
    echo "      If not specified, will default to a sub-directory"
    echo "      with the same name as the last part of the remote path"
    echo "  --host remote host"
    echo "      IF not supplied defaults to ftp.ncbi.nlm.nih.gov"
}

usage_error()
{
    usage
    echo "%%%-ERROR: you must supply a $1 parameter"
    exit 1
}


remote_path=
local_path=
host=ftp.ncbi.nlm.nih.gov
user=anonymous
password=anonymous

num_error=0
num_skipped=0
num_downloaded=0
num_total=0

uname -a | grep -i linux > /dev/null 2>&1
if [ $? -eq 0 ]; then
    md5_cmd=md5sum
    md5_field=1
else
    md5_cmd=md5
    md5_field=4
fi

while [ $# -gt 0 ]
do
    case "$1" in
        --he*)   # help
            usage && exit 0
            ;;
        --r*) # remote_path
            if [ $# -lt 2 ]; then
                usage
                echo "%%%-ERROR: you must supply and argument for $1 option"
                exit1
            fi
            shift
            remote_path=$1
            ;;            
         --l*) #local_path
            if [ $# -lt 2 ]; then
                usage
                echo "%%%-ERROR: you must supply and argument for $1 option"
                exit1
            fi
            shift
            local_path="$1"
            ;;
         --ho*) #host
            if [ $# -lt 2 ]; then
                usage
                echo "%%%-ERROR: you must supply and argument for $1 option"
                exit1
            fi
            shift
            host=$1
            ;;             
        *)
            usage
            echo "%%%-ERROR: unknown option ($1)"
            exit 1
            ;;
    esac
    shift
done

for param in remote_path
do
    remote_file=
    if [ -z "${!param}" ]; then
        usage_error -$param
    fi
done

if [ -z "$local_path" ]; then
    local_path=$(basename "$remote_path")
    echo "%%%-INFO: no local path specified defaulting to $local_path"
fi

if [ ! -d "$local_path" ]; then
    echo "%%%-INFO: local path ($local_path) does not exist, creating..."
    mkdir "$local_path"
    if [ $? -ne 0 ]; then
        echo "%%%-ERROR: could not create local_path ($local_path), exiting..."
    fi
fi

if [ ! -w "$local_path" ]; then
    echo "%%%-ERROR: local directory ($local_path) is not writeable, exiting..."
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

cd "$local_path"
if [ $? -ne 0 ]; then
    echo "%%%-ERROR: could not cd into local directory $local_path, exiting..."
    exit 1
fi

get_md5()
{
    rm -f *.md5
    CMD="(echo prompt; echo 'cd $remote_path'; echo 'mget *.md5') | ftp -v $host"
    echo $CMD
    eval $CMD
    if [ $? -ne 0 ]; then
        echo "    %%%-ERROR: problem getting list of *.md5 files from remote, exiting..."
        exit 1
    fi
}

remove_previous_builds()
{
    echo "%%%-INFO: only saving files from most recent dbSNP build from this data directory (bxxx_*.md5)"
    local file_template='b[0-9][0-9][0-9]_*.md5'
    if [ -z "$file_template" ]; then
        echo "%%%-INFO: no builds found in this directory"
        return
    fi
    local builds=($(ls $file_template | cut -f1 -d'_' | sort -u | sort -n -r)) > /dev/null 2>&1
    last_build=${builds[0]}
    echo "%%%-INFO: removing all files for builds except for build: $last_build"
    for b in ${builds[*]}
    do
        if [ "$b" == "$last_build" ]; then
            continue
        fi
        echo "%%%-INFO: removing files from previous bulid $b"
        ls ${b}_*
        rm ${b}_*
    done
}

get_md5
remove_previous_builds

check_md5()
{
    local md5_file=$1
    local file=$2
    md5=$($md5_cmd $file | perl -pi -e 's/\s+/\t/g' | cut -f${md5_field})
    if [ $? -ne 0 ]; then
        echo "    %%%-ERROR: problem getting md5 file $file, exiting..."
        exit 1
    fi
    grep $md5 $md5_file > /dev/null 2>&1
    return $?
}

ftp_get_file()
{
    local file=$1
    CMD="ftp '$ftp_path${remote_path}/${file}'"
    CMD="(echo prompt; echo 'cd $remote_path';  echo hash; echo 'get $1') | ftp -v -v $host"
    echo "    $CMD"
    eval $CMD
    if [ $? -ne 0 ]; then
        echo "    %%%-ERROR: problem getting file ($1) from remote, exiting..."
        return 1
    fi 
    return 0
}

for md5_file in *.md5
do
    num_total=$((num_total + 1))
    echo "---------------------------------------------------------------------"
    file=${md5_file%%.md5}
    table=${file%%..bcp.gz}
    echo "    %%%%-INFO: Processing files $file"
    if [ -f $file ]; then
        check_md5 $md5_file $file
        if [ $? -eq 0 ]; then
            num_skipped=$((num_skipped + 1))
            echo "    %%%-INFO: file matches md5 stamp, skipping download..."
            continue
        fi
    fi
    ftp_get_file $file
    if [ $? -ne 0 ]; then
        num_error=$((num_error + 1))
    else
        num_downloaded=$((num_downloaded + 1))
    fi
done

if [ $num_error -ne -0 ]; then
    echo "%%%-ERROR: $num_error files failed to download"
    echo "%%%-ERROR: total/error/skipped/downloaded $num_total/$num_error/$num_skipped/$num_downloaded"
else
    echo "%%%-SUCCESS:  total/error/skipped/downloaded $num_total/$num_error/$num_skipped/$num_downloaded"
fi

