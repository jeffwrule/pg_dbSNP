ALTER TABLE [Allele] ADD CONSTRAINT [df_Allele_create_time] DEFAULT (GETDATE()) FOR [create_time]
ALTER TABLE [Allele] ADD CONSTRAINT [df_Allele_update_time] DEFAULT (GETDATE()) FOR [last_updated_time]
ALTER TABLE [Allele] ADD CONSTRAINT [pk_Allele]  PRIMARY KEY  CLUSTERED ([allele_id] ASC)
GO
ALTER TABLE [Allele] ADD CONSTRAINT [u_Allele_allele]  UNIQUE  NONCLUSTERED ([allele] ASC)
GO

ALTER TABLE [AlleleFlagCode] ADD CONSTRAINT [pk_AlleleFlagCode]  PRIMARY KEY  CLUSTERED ([code] ASC)
GO

ALTER TABLE [AlleleMotif] ADD CONSTRAINT [pk_AlleleMotif]  PRIMARY KEY  CLUSTERED ([allele_id] ASC,[motif_order] ASC)
GO

ALTER TABLE [AllocIds] ADD CONSTRAINT [pk_AllocIds]  PRIMARY KEY  NONCLUSTERED ([name] ASC)
GO

ALTER TABLE [Author] ADD CONSTRAINT [pk_Author]  PRIMARY KEY  NONCLUSTERED ([pub_id] ASC,[position] ASC)
GO

ALTER TABLE [Batch_tax_id] ADD CONSTRAINT [FK__Batch_tax__pos_s__2013436E] FOREIGN KEY (pos_src_id) REFERENCES [BatchAssertedPositionSourceId](pos_src_id)
GO


ALTER TABLE [CpGCode] ADD CONSTRAINT [pk_CpGCode]  PRIMARY KEY  CLUSTERED ([code] ASC)
GO



ALTER TABLE [GtyAllele] ADD CONSTRAINT [pk_GtyAllele]  PRIMARY KEY  CLUSTERED ([gty_id] ASC,[rev_flag] ASC,[chr_num] ASC)
GO

ALTER TABLE [IUPACna] ADD CONSTRAINT [pk_IUPACna]  PRIMARY KEY  CLUSTERED ([allele] ASC)
GO

ALTER TABLE [LoadHistory] ADD CONSTRAINT [pk_LoadHistory]  PRIMARY KEY  NONCLUSTERED ([build_id] ASC)
GO

ALTER TABLE [LocTypeCode] ADD CONSTRAINT [DF__LocTypeCo__creat__75CD617E] DEFAULT (GETDATE()) FOR [create_time]
ALTER TABLE [LocTypeCode] ADD CONSTRAINT [pk_LocTypeCode]  PRIMARY KEY  CLUSTERED ([code] ASC)
GO

ALTER TABLE [MapLinkCode] ADD CONSTRAINT [pk_MapLinkCode]  PRIMARY KEY  CLUSTERED ([which_code] ASC,[code] ASC)
GO

ALTER TABLE [Method] ADD CONSTRAINT [pk_Method_mid]  PRIMARY KEY  CLUSTERED ([method_id] ASC)
GO

ALTER TABLE [MethodClass] ADD CONSTRAINT [pk_MethodClass]  PRIMARY KEY  CLUSTERED ([meth_class_id] ASC)
GO

ALTER TABLE [MethodLine] ADD CONSTRAINT [pk_MethodLine]  PRIMARY KEY  NONCLUSTERED ([method_id] ASC,[line_num] ASC)
GO

ALTER TABLE [Moltype] ADD CONSTRAINT [pk_Moltype]  PRIMARY KEY  CLUSTERED ([code] ASC)
GO

ALTER TABLE [Motif] ADD CONSTRAINT [pk_Motif]  PRIMARY KEY  CLUSTERED ([motif_id] ASC)
GO

ALTER TABLE [ObsGenotype] ADD CONSTRAINT [pk_ObsGenotype]  PRIMARY KEY  CLUSTERED ([gty_id] ASC)
GO

ALTER TABLE [ObsVariation] ADD CONSTRAINT [DF__ObsVariat__creat__3BB5CE82] DEFAULT (GETDATE()) FOR [create_time]
ALTER TABLE [ObsVariation] ADD CONSTRAINT [DF__ObsVariat__last___3CA9F2BB] DEFAULT (GETDATE()) FOR [last_updated_time]
ALTER TABLE [ObsVariation] ADD CONSTRAINT [pk_ObsVariation]  PRIMARY KEY  CLUSTERED ([var_id] ASC)
GO

ALTER TABLE [OrgDbStatus] ADD CONSTRAINT [pk_org_db_status]  PRIMARY KEY  CLUSTERED ([database_name] ASC)
GO

ALTER TABLE [OrganismTax] ADD CONSTRAINT [pk_organism]  PRIMARY KEY  NONCLUSTERED ([tax_id] ASC)
GO

ALTER TABLE [PopClass] ADD CONSTRAINT [pk_PopClass]  PRIMARY KEY  CLUSTERED ([pop_id] ASC,[pop_class_id] ASC)
GO

ALTER TABLE [PopClassCode] ADD CONSTRAINT [PK__PopClassCode__270595B6]  PRIMARY KEY  CLUSTERED ([pop_class_id] ASC)
GO

ALTER TABLE [Publication] ADD CONSTRAINT [pk_Publication]  PRIMARY KEY  NONCLUSTERED ([pub_id] ASC)
GO

ALTER TABLE [SNPGlossary] ADD CONSTRAINT [DF__SNPGlossa__last___4050666D] DEFAULT (GETDATE()) FOR [last_updated]
ALTER TABLE [SNPGlossary] ADD CONSTRAINT [pk_SNPGlossary]  PRIMARY KEY  CLUSTERED ([term] ASC)
GO

ALTER TABLE [SNP_tax_id] ADD CONSTRAINT [DF__SNP_tax_i__statu__31583BA0] DEFAULT ('C') FOR [status]
ALTER TABLE [SNP_tax_id] ADD CONSTRAINT [pk_SNP_tax_id]  PRIMARY KEY  CLUSTERED ([snp_id] ASC)
GO

ALTER TABLE [SnpChrCode] ADD CONSTRAINT [pk_SnpChrCode]  PRIMARY KEY  CLUSTERED ([code] ASC)
GO

ALTER TABLE [SnpClassCode] ADD CONSTRAINT [pk_SnpClassCode]  PRIMARY KEY  CLUSTERED ([code] ASC)
GO

ALTER TABLE [SnpFunctionCode] ADD CONSTRAINT [pk_SnpFunctionCode]  PRIMARY KEY  CLUSTERED ([code] ASC)
GO

ALTER TABLE [SnpValidationCode] ADD CONSTRAINT [pk_SnpValidationCode]  PRIMARY KEY  NONCLUSTERED ([code] ASC)
GO

ALTER TABLE [StrandCode] ADD CONSTRAINT [pk_StrandCode]  PRIMARY KEY  CLUSTERED ([code] ASC)
GO



ALTER TABLE [Submitter] ADD CONSTRAINT [DF_Submitter_create_time] DEFAULT (GETDATE()) FOR [create_time]
ALTER TABLE [Submitter] ADD CONSTRAINT [pk_Submitter]  PRIMARY KEY  NONCLUSTERED ([handle] ASC)
GO

ALTER TABLE [TemplateType] ADD CONSTRAINT [pk_TemplateType]  PRIMARY KEY  CLUSTERED ([temp_type_id] ASC)
GO

ALTER TABLE [UniGty] ADD CONSTRAINT [pk_UniGty]  PRIMARY KEY  CLUSTERED ([unigty_id] ASC)
GO

ALTER TABLE [UniVariAllele] ADD CONSTRAINT [pk_UniVariAllele]  PRIMARY KEY  CLUSTERED ([univar_id] ASC,[allele_id] ASC)
GO

ALTER TABLE [UniVariation] ADD CONSTRAINT [pk_UniVariation]  PRIMARY KEY  CLUSTERED ([univar_id] ASC)
GO

ALTER TABLE [UniVariationSrcCode] ADD CONSTRAINT [pk_UniVariationSrcCode]  PRIMARY KEY  CLUSTERED ([code] ASC)
GO

ALTER TABLE [VariAllele] ADD CONSTRAINT [pk_VariAllele]  PRIMARY KEY  CLUSTERED ([var_id] ASC,[allele_id] ASC)
GO

ALTER TABLE [db_ftp_table_list] ADD CONSTRAINT [DF__db_ftp_ta__creat__27F9B9EF] DEFAULT (GETDATE()) FOR [create_time]
ALTER TABLE [db_ftp_table_list] ADD CONSTRAINT [pk_db_ftp_table_list]  PRIMARY KEY  CLUSTERED ([table_name] ASC)
GO

ALTER TABLE [db_map_table_name] ADD CONSTRAINT [DF__db_map_ta__inNon__206E7217] DEFAULT ('N') FOR [inNonHuman]
ALTER TABLE [db_map_table_name] ADD CONSTRAINT [pk_db_map_table_name]  PRIMARY KEY  CLUSTERED ([table_name] ASC)
GO

ALTER TABLE [dn_Allele_rev] ADD CONSTRAINT [pk_dn_Allele_rev]  PRIMARY KEY  CLUSTERED ([allele_id] ASC,[rev_flag] ASC)
GO

ALTER TABLE [dn_Motif_rev] ADD CONSTRAINT [pk_dn_Motif_rev]  PRIMARY KEY  CLUSTERED ([motif_id] ASC,[rev_flag] ASC)
GO

ALTER TABLE [dn_UniGty_allele] ADD CONSTRAINT [pk_dn_UniGty_allele]  PRIMARY KEY  CLUSTERED ([unigty_id] ASC,[chr_num] ASC)
GO


ALTER TABLE [dn_UniVariation_rev] ADD CONSTRAINT [pk_dn_UniVariation_rev]  PRIMARY KEY  CLUSTERED ([univar_id] ASC,[rev_flag] ASC)
GO



ALTER TABLE [dn_summary] ADD CONSTRAINT [df_dn_summary_create_time] DEFAULT (GETDATE()) FOR [create_time]
ALTER TABLE [dn_summary] ADD CONSTRAINT [df_dn_summary_update_time] DEFAULT (GETDATE()) FOR [last_updated_time]
ALTER TABLE [dn_summary] ADD CONSTRAINT [pk_dn_summary]  PRIMARY KEY  CLUSTERED ([tax_id] ASC,[build_id] ASC,[type] ASC)
GO

