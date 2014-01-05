CREATE TABLE [SubInd_ch1]
(
[chr] [varchar](3) NOT NULL ,
[batch_id] [int] NOT NULL ,
[subsnp_id] [int] NOT NULL ,
[submitted_ind_id] [int] NOT NULL ,
[submitted_strand_code] [int] NULL ,
[allele_flag] [int] NULL ,
[gty_id] [int] NULL ,
[submitted_rs] [int] NULL
)
GO

CREATE TABLE [SubInd_ch2]
(
[chr] [varchar](3) NOT NULL ,
[batch_id] [int] NOT NULL ,
[subsnp_id] [int] NOT NULL ,
[submitted_ind_id] [int] NOT NULL ,
[submitted_strand_code] [int] NULL ,
[allele_flag] [int] NULL ,
[gty_id] [int] NULL ,
[submitted_rs] [int] NULL
)
GO

CREATE TABLE [SubInd_ch3]
(
[chr] [varchar](3) NOT NULL ,
[batch_id] [int] NOT NULL ,
[subsnp_id] [int] NOT NULL ,
[submitted_ind_id] [int] NOT NULL ,
[submitted_strand_code] [int] NULL ,
[allele_flag] [int] NULL ,
[gty_id] [int] NULL ,
[submitted_rs] [int] NULL
)
GO

CREATE TABLE [SubInd_ch4]
(
[chr] [varchar](3) NOT NULL ,
[batch_id] [int] NOT NULL ,
[subsnp_id] [int] NOT NULL ,
[submitted_ind_id] [int] NOT NULL ,
[submitted_strand_code] [int] NULL ,
[allele_flag] [int] NULL ,
[gty_id] [int] NULL ,
[submitted_rs] [int] NULL
)
GO

CREATE TABLE [SubInd_ch5]
(
[chr] [varchar](3) NOT NULL ,
[batch_id] [int] NOT NULL ,
[subsnp_id] [int] NOT NULL ,
[submitted_ind_id] [int] NOT NULL ,
[submitted_strand_code] [int] NULL ,
[allele_flag] [int] NULL ,
[gty_id] [int] NULL ,
[submitted_rs] [int] NULL
)
GO

CREATE TABLE [SubInd_ch6]
(
[chr] [varchar](3) NOT NULL ,
[batch_id] [int] NOT NULL ,
[subsnp_id] [int] NOT NULL ,
[submitted_ind_id] [int] NOT NULL ,
[submitted_strand_code] [int] NULL ,
[allele_flag] [int] NULL ,
[gty_id] [int] NULL ,
[submitted_rs] [int] NULL
)
GO

CREATE TABLE [SubInd_ch7]
(
[chr] [varchar](3) NOT NULL ,
[batch_id] [int] NOT NULL ,
[subsnp_id] [int] NOT NULL ,
[submitted_ind_id] [int] NOT NULL ,
[submitted_strand_code] [int] NULL ,
[allele_flag] [int] NULL ,
[gty_id] [int] NULL ,
[submitted_rs] [int] NULL
)
GO

CREATE TABLE [dn_table_rowcount]
(
[tabname] [varchar](64) NOT NULL ,
[row_cnt] [int] NOT NULL ,
[build_id] [int] NOT NULL ,
[update_time] [datetime] NOT NULL ,
[rows_in_spaceused] [int] NULL ,
[reserved_KB_spaceused] [int] NULL ,
[data_KB_spaceused] [int] NULL ,
[index_size_KB_spaceused] [int] NULL ,
[unused_KB_spaceused] [int] NULL
)
GO

