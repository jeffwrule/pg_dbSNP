#!/bin/csh -f


#----------------------------------------
# Desc:
#   This is a demo script for creating a local copy of dbSNP using files in /schema and /data directories.
# Note:
#    1. Use tab as delimiter in bcp files.
#    2. It is faster to bulk insert data to tables before table indexes are created.
#	created: 10/22/03
# Log: 2/14/06: modified schemaDir and dataDir directory to remove reference to "mssql" subdirectory.
#----------------------------------------
#

set schemaDir = "/am/ftp-snp/database/shared_schema"
set dataDir = "/am/ftp-snp/database/shared_data"
set workDir = "/net/atlas/a5/snp/toFTP/testload"
set tableSql = dbSNP_main_table.sql.gz 

   while ( $#argv )
      if ( $argv[1] == '-D' ) then
         shift
         set database = $argv[1]
      else if ( $argv[1] == '-S' ) then
         shift
         set server = $argv[1]
      else if ( $argv[1] == '-U' ) then
         shift
         set user = $argv[1]
      else
      #   echo "Usage: cmd.loaddata -D <database> -S <server> -U <user>."
      #   exit
      endif
      shift

   end

	endif
  if ( !( $?database && $?server && $?user )) then
         echo "Usage: cmd.loaddata -D <database> -S <server> -U <user>."
         exit

   endif

#---------------------------------------------------------
# set password here:
#  This password file only has one line: your password.
#  You could set this file to be readonly by you.
#---------------------------------------------------------
set pwd = `cat .dbpassword`

#---------------------------------------------------------
# Remove header and footer from table schema file:
#---------------------------------------------------------

set myTableSql = $tableSql:r
gunzip -c $schemaDir/$tableSql | sed -e '/^#/d' -e 's/^GO/go/' > $workDir/$myTableSql

#---------------------------------------------------------
# First create tables without creating indexes:
#---------------------------------------------------------
set TabCnt_file = `fgrep 'CREATE TABLE' $workDir/$myTableSql |wc -l`
echo $TabCnt_file
echo "calling dsql to create tables..."
#dsql -S $server -D $database -U $user -i  $workDir/$myTableSql <<EOF
#$pwd
#EOF

dsql -S $server -D $database -U $user <<EOF
$pwd
set nocount on
declare @cnt int
select @cnt =  count(*) from sysobjects where type = 'U' and name != 'dtproperties'
if ( @cnt != $TabCnt_file ) begin
select "ERROR: number of tables in $myTableSql = $TabCnt_file, db table count = ", @cnt
end 
else 
begin
select "OK: $TabCnt_file tables created"
end


go
EOF

#---------------------------------------------------------
# load data
#---------------------------------------------------------

cd $dataDir
foreach f ( `ls *.bcp.gz`)
    set myf = $f:r
    gunzip -c $f | sed -e  '/^#/d' -e '/^ $/d' -e 's/true/1/g' -e 's/false/0/g'> $workDir/$myf
    set table = $myf:r
    $workDir/cmd.bulkinsert -T $table -F $workDir/$myf
end



#---------------------------------------------------------
# Then create indexes and foreign keys:
#---------------------------------------------------------
