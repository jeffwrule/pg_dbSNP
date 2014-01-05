CREATE TABLE [SubSNPAcc_p1_human]
(
[subsnp_id] [int] NOT NULL ,
[acc_type_ind] [char](1) NOT NULL ,
[acc_part] [varchar](16) NOT NULL ,
[acc_ver] [int] NULL
)
GO

CREATE TABLE [SubSNPAcc_p2_human]
(
[subsnp_id] [int] NOT NULL ,
[acc_type_ind] [char](1) NOT NULL ,
[acc_part] [varchar](16) NOT NULL ,
[acc_ver] [int] NULL
)
GO

CREATE TABLE [SubSNPAcc_p3_human]
(
[subsnp_id] [int] NOT NULL ,
[acc_type_ind] [char](1) NOT NULL ,
[acc_part] [varchar](16) NOT NULL ,
[acc_ver] [int] NULL
)
GO

CREATE TABLE [SubSNPCommLine_p1_human]
(
[subsnp_id] [int] NOT NULL ,
[line_num] [tinyint] NOT NULL ,
[line] [varchar](255) NOT NULL
)
GO

CREATE TABLE [SubSNPCommLine_p2_human]
(
[subsnp_id] [int] NOT NULL ,
[line_num] [tinyint] NOT NULL ,
[line] [varchar](255) NOT NULL
)
GO

CREATE TABLE [SubSNPCommLine_p3_human]
(
[subsnp_id] [int] NOT NULL ,
[line_num] [tinyint] NOT NULL ,
[line] [varchar](255) NOT NULL
)
GO

CREATE TABLE [SubSNPSeq3_p1_human]
(
[subsnp_id] [int] NOT NULL ,
[type] [tinyint] NOT NULL ,
[line_num] [tinyint] NOT NULL ,
[line] [varchar](255) NOT NULL
)
GO

CREATE TABLE [SubSNPSeq3_p2_human]
(
[subsnp_id] [int] NOT NULL ,
[type] [tinyint] NOT NULL ,
[line_num] [tinyint] NOT NULL ,
[line] [varchar](255) NOT NULL
)
GO

CREATE TABLE [SubSNPSeq3_p3_human]
(
[subsnp_id] [int] NOT NULL ,
[type] [tinyint] NOT NULL ,
[line_num] [tinyint] NOT NULL ,
[line] [varchar](255) NOT NULL
)
GO

CREATE TABLE [SubSNPSeq5_p1_human]
(
[subsnp_id] [int] NOT NULL ,
[type] [tinyint] NOT NULL ,
[line_num] [tinyint] NOT NULL ,
[line] [varchar](255) NOT NULL
)
GO

CREATE TABLE [SubSNPSeq5_p2_human]
(
[subsnp_id] [int] NOT NULL ,
[type] [tinyint] NOT NULL ,
[line_num] [tinyint] NOT NULL ,
[line] [varchar](255) NOT NULL
)
GO

CREATE TABLE [SubSNPSeq5_p3_human]
(
[subsnp_id] [int] NOT NULL ,
[type] [tinyint] NOT NULL ,
[line_num] [tinyint] NOT NULL ,
[line] [varchar](255) NOT NULL
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

