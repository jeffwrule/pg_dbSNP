-- this is a list of constraints that are missing from the mssql database and cause FK's to fail if they don't exist
-- this file should run before standard human file so the missing primry keys are in place.

drop index i_ss_snpsubsnplink;  -- redundant by next statement
alter table SNPSubSNPLink add constraint pk_SNPSubSNPLink PRIMARY KEY (subsnp_id); 

drop index i_rs_snp;  -- redundant by next statement
alter table SNP add constraint pk_SNP PRIMARY KEY (snp_id); 
