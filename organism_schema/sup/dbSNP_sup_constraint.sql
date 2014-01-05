ALTER TABLE [SubSNPAcc_p1_human] ADD CONSTRAINT [pk_SubSNPAcc_p1_human]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[acc_type_ind] ASC,[acc_part] ASC)
GO

ALTER TABLE [SubSNPAcc_p2_human] ADD CONSTRAINT [pk_SubSNPAcc_p2_human]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[acc_type_ind] ASC,[acc_part] ASC)
GO

ALTER TABLE [SubSNPAcc_p3_human] ADD CONSTRAINT [pk_SubSNPAcc_p3]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[acc_type_ind] ASC,[acc_part] ASC)
GO

ALTER TABLE [SubSNPCommLine_p1_human] ADD CONSTRAINT [pk_SubSNPCommLine_p1_human]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPCommLine_p2_human] ADD CONSTRAINT [pk_SubSNPCommLine_p2_human]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPCommLine_p3_human] ADD CONSTRAINT [pk_SubSNPCommLine_p3]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPSeq3_p1_human] ADD CONSTRAINT [pk_SubSNPSeq3_p1_human]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[type] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPSeq3_p2_human] ADD CONSTRAINT [pk_SubSNPSeq3_p2_human]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[type] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPSeq3_p3_human] ADD CONSTRAINT [pk_SubSNPSeq3_p3]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[type] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPSeq5_p1_human] ADD CONSTRAINT [pk_SubSNPSeq5_p1_human]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[type] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPSeq5_p2_human] ADD CONSTRAINT [pk_SubSNPSeq5_p2_human]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[type] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPSeq5_p3_human] ADD CONSTRAINT [pk_SubSNPSeq5_p3]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[type] ASC,[line_num] ASC)
GO


