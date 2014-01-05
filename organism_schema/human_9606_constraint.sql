ALTER TABLE [AlleleFreqBySsPop] ADD CONSTRAINT [pk_AlleleFreqBySsPop_b129]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[pop_id] ASC,[allele_id] ASC)
GO

ALTER TABLE [Batch] ADD CONSTRAINT [pk_Batch]  PRIMARY KEY  CLUSTERED ([batch_id] ASC)
GO

ALTER TABLE [BatchCita] ADD CONSTRAINT [pk_BatchCita]  PRIMARY KEY  NONCLUSTERED ([batch_id] ASC,[position] ASC)
GO

ALTER TABLE [BatchCommLine] ADD CONSTRAINT [pk_BatchCommLine]  PRIMARY KEY  NONCLUSTERED ([batch_id] ASC,[line_num] ASC)
GO

ALTER TABLE [BatchCultivar] ADD CONSTRAINT [pk_BatchCultivar]  PRIMARY KEY  NONCLUSTERED ([batch_id] ASC,[line_num] ASC)
GO

ALTER TABLE [BatchMeExLine] ADD CONSTRAINT [pk_BatchMeExLine]  PRIMARY KEY  NONCLUSTERED ([batch_id] ASC,[line_num] ASC)
GO

ALTER TABLE [BatchStrain] ADD CONSTRAINT [pk_BatchStrain]  PRIMARY KEY  NONCLUSTERED ([batch_id] ASC,[line_num] ASC)
GO

ALTER TABLE [BatchValCode] ADD CONSTRAINT [pk_BatchValCode]  PRIMARY KEY  CLUSTERED ([batch_id] ASC)
GO

ALTER TABLE [ClinSigCode] ADD CONSTRAINT [DF__ClinSigCo__creat__5FBB8CD0] DEFAULT (GETDATE()) FOR [create_time]
ALTER TABLE [ClinSigCode] ADD CONSTRAINT [DF__ClinSigCo__last___60AFB109] DEFAULT (GETDATE()) FOR [last_updated_time]
ALTER TABLE [ClinSigCode] ADD CONSTRAINT [DF__ClinSigCo__sever__58B68DF4] DEFAULT ((0)) FOR [severity_level]
ALTER TABLE [ClinSigCode] ADD CONSTRAINT [PK__ClinSigC__357D4CF85DD3445E]  PRIMARY KEY  CLUSTERED ([code] ASC)
GO

ALTER TABLE [Contact] ADD CONSTRAINT [pk_Contact]  PRIMARY KEY  NONCLUSTERED ([batch_id] ASC,[handle] ASC)
GO


ALTER TABLE [GeneIdToName] ADD CONSTRAINT [pk_GeneIdToName]  PRIMARY KEY  CLUSTERED ([gene_id] ASC)
GO

ALTER TABLE [GtyFreqBySsPop] ADD CONSTRAINT [pk_GtyFreqBySsPop_b129]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[pop_id] ASC,[unigty_id] ASC)
GO

ALTER TABLE [IndGrpCode] ADD CONSTRAINT [pk_IndGrpCode]  PRIMARY KEY  CLUSTERED ([code] ASC)
GO

ALTER TABLE [IndivBySource] ADD CONSTRAINT [pk_IndivBySource]  PRIMARY KEY  NONCLUSTERED ([src_id] ASC,[src_ind_id] ASC)
GO


ALTER TABLE [Individual] ADD CONSTRAINT [pk_Individual]  PRIMARY KEY  CLUSTERED ([ind_id] ASC)
GO


ALTER TABLE [Pedigree] ADD CONSTRAINT [p_ped_id]  PRIMARY KEY  CLUSTERED ([ped_id] ASC)
GO

ALTER TABLE [PedigreeIndividual] ADD CONSTRAINT [pk_PedigreeIndividual]  PRIMARY KEY  CLUSTERED ([ped_id] ASC,[ind_id] ASC)
GO

ALTER TABLE [PopLine] ADD CONSTRAINT [pk_PopLine]  PRIMARY KEY  CLUSTERED ([pop_id] ASC,[line_num] ASC)
GO

ALTER TABLE [PopMandLine] ADD CONSTRAINT [pk_PopMandLine]  PRIMARY KEY  NONCLUSTERED ([pop_id] ASC,[line_num] ASC)
GO

ALTER TABLE [Population] ADD CONSTRAINT [pk_Population_pop_id]  PRIMARY KEY  CLUSTERED ([pop_id] ASC)
GO


ALTER TABLE [SNP] ADD CONSTRAINT [fk_exem_ss] FOREIGN KEY (exemplar_subsnp_id) REFERENCES [SubSNP](subsnp_id)
GO
ALTER TABLE [SNP] ADD CONSTRAINT [fk_exem_ss_2link] FOREIGN KEY (exemplar_subsnp_id) REFERENCES [SNPSubSNPLink](subsnp_id)
GO


ALTER TABLE [SNPAlleleFreq] ADD CONSTRAINT [pk_SNPAlleleFreq]  PRIMARY KEY  CLUSTERED ([snp_id] ASC,[allele_id] ASC)
GO


ALTER TABLE [SNPAncestralAllele] ADD CONSTRAINT [DF__SNPAncest__batch__664F5149] DEFAULT ((0)) FOR [batch_id]
ALTER TABLE [SNPAncestralAllele] ADD CONSTRAINT [pk_SNPAncestralAllele]  PRIMARY KEY  CLUSTERED ([snp_id] ASC,[batch_id] ASC)
GO


ALTER TABLE [SNPGtyFreq] ADD CONSTRAINT [pk_SNPGtyFreq]  PRIMARY KEY  CLUSTERED ([snp_id] ASC,[unigty_id] ASC)
GO

ALTER TABLE [SNPHWProb] ADD CONSTRAINT [pk_SNPHWProb]  PRIMARY KEY  CLUSTERED ([snp_id] ASC)
GO

ALTER TABLE [SNPHistory] ADD CONSTRAINT [pk_SNPHistory]  PRIMARY KEY  CLUSTERED ([snp_id] ASC)
GO




ALTER TABLE [SNPSuspect] ADD CONSTRAINT [DF__SNPSuspec__upd_t__18BF0002] DEFAULT (GETDATE()) FOR [upd_time]
ALTER TABLE [SNPSuspect] ADD CONSTRAINT [PK__SNPSuspe__430A13A116D6B790]  PRIMARY KEY  CLUSTERED ([snp_id] ASC)
GO

ALTER TABLE [SNPVal] ADD CONSTRAINT [pk_SNPVal]  PRIMARY KEY  CLUSTERED ([batch_id] ASC,[snp_id] ASC)
GO


ALTER TABLE [SNP_bitfield] ADD CONSTRAINT [pk_SNP_bitfield]  PRIMARY KEY  CLUSTERED ([snp_id] ASC)
GO

ALTER TABLE [SubPop] ADD CONSTRAINT [DF__SubPopB10__last___19AB9A98] DEFAULT (GETDATE()) FOR [last_updated_time]
ALTER TABLE [SubPop] ADD CONSTRAINT [fk_SubPop_batch_id] FOREIGN KEY (batch_id) REFERENCES [Batch](batch_id)
GO
ALTER TABLE [SubPop] ADD CONSTRAINT [fk_SubPop_pop] FOREIGN KEY (pop_id) REFERENCES [Population](pop_id)
GO
ALTER TABLE [SubPop] ADD CONSTRAINT [PK__SubPop_new__180E3640]  PRIMARY KEY  CLUSTERED ([batch_id] ASC,[subsnp_id] ASC,[pop_id] ASC,[type] ASC)
GO

ALTER TABLE [SubPopAllele] ADD CONSTRAINT [fk_SubPopAllele_bid_ss_pop_type] FOREIGN KEY (batch_id,subsnp_id,pop_id,type) REFERENCES [SubPop](batch_id,subsnp_id,pop_id,type)
GO

ALTER TABLE [SubPopGty] ADD CONSTRAINT [pk_SubPopGty]  PRIMARY KEY  CLUSTERED ([subpop_id] ASC,[gty_id] ASC)
GO

ALTER TABLE [SubSNP] ADD CONSTRAINT [pk_SubSNP]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC)
GO

ALTER TABLE [SubSNPAcc_ins] ADD CONSTRAINT [pk_SubSNPAcc]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[acc_type_ind] ASC,[acc_part] ASC)
GO

ALTER TABLE [SubSNPCommLine_ins] ADD CONSTRAINT [pk_SubSNPCommLine]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPHGVS] ADD CONSTRAINT [pk_SubSNPHGVS]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC)
GO

ALTER TABLE [SubSNPLinkout] ADD CONSTRAINT [DF__SubSNPLin__link___660506BC] DEFAULT ('NA') FOR [link_type]
ALTER TABLE [SubSNPLinkout] ADD CONSTRAINT [pk_SubSNPLinkout]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[link_type] ASC)
GO

ALTER TABLE [SubSNPMdFailLn] ADD CONSTRAINT [pk_SubSNPMdFailLn]  PRIMARY KEY  NONCLUSTERED ([subsnp_id] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPNoVariSeq] ADD CONSTRAINT [pk_SubSNPNoVariSeq]  PRIMARY KEY  NONCLUSTERED ([subsnp_id] ASC,[line_num] ASC)
GO


ALTER TABLE [SubSNPPubmed] ADD CONSTRAINT [pk_SubSNPPubmed]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPSeq3_ins] ADD CONSTRAINT [pk_SubSNPSeq3]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[type] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPSeq5_ins] ADD CONSTRAINT [pk_SubSNPSeq5]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC,[type] ASC,[line_num] ASC)
GO

ALTER TABLE [SubSNPSeqPos] ADD CONSTRAINT [pk_SubSNPSeqPos]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC)
GO

ALTER TABLE [SubSNP_top_or_bot] ADD CONSTRAINT [PK__t_ss_top_or_bot__0D5DFFA8]  PRIMARY KEY  CLUSTERED ([subsnp_id] ASC)
GO

ALTER TABLE [SubmittedIndividual] ADD CONSTRAINT [DF__Submitted__ploid__41661CE5] DEFAULT (2) FOR [ploidy]
ALTER TABLE [SubmittedIndividual] ADD CONSTRAINT [pk_SubmittedIndividual]  PRIMARY KEY  CLUSTERED ([pop_id] ASC,[loc_ind_id_upp] ASC)
GO

ALTER TABLE [SuspectReasonCode] ADD CONSTRAINT [DF__SuspectRe__creat__130626AC] DEFAULT (GETDATE()) FOR [create_time]
ALTER TABLE [SuspectReasonCode] ADD CONSTRAINT [DF__SuspectRe__last___13FA4AE5] DEFAULT (GETDATE()) FOR [last_update_time]
ALTER TABLE [SuspectReasonCode] ADD CONSTRAINT [PK__SuspectR__357D4CF8111DDE3A]  PRIMARY KEY  CLUSTERED ([code] ASC)
GO

ALTER TABLE [Synonym] ADD CONSTRAINT [pk_Synonym]  PRIMARY KEY  NONCLUSTERED ([subsnp_id] ASC,[type] ASC)
GO

ALTER TABLE [b138_ContigInfo] ADD CONSTRAINT [df_b138_ContigInfo_update_dt] DEFAULT (GETDATE()) FOR [last_updated_time]
ALTER TABLE [b138_ContigInfo] ADD CONSTRAINT [pk_b138_ContigInfo]  PRIMARY KEY  CLUSTERED ([contig_gi] ASC)
GO

ALTER TABLE [b138_MapLink] ADD CONSTRAINT [fk_b138_MapLink_rs] FOREIGN KEY (snp_id) REFERENCES [SNP](snp_id)
GO






ALTER TABLE [b138_SNPContigLoc] ADD CONSTRAINT [fk_b138_SNPContigLoc_rs] FOREIGN KEY (snp_id) REFERENCES [SNP](snp_id)
GO
ALTER TABLE [b138_SNPContigLoc] ADD CONSTRAINT [pk_b138_SNPContigLoc]  PRIMARY KEY  CLUSTERED ([snp_id] ASC,[ctg_id] ASC,[asn_from] ASC)
GO

ALTER TABLE [b138_SNPContigLocusId] ADD CONSTRAINT [fk_b138_SNPContigLocusId_rs] FOREIGN KEY (snp_id) REFERENCES [SNP](snp_id)
GO



ALTER TABLE [b138_SNPMapInfo] ADD CONSTRAINT [fk_b138_SNPMapInfo_rs] FOREIGN KEY (snp_id) REFERENCES [SNP](snp_id)
GO
ALTER TABLE [b138_SNPMapInfo] ADD CONSTRAINT [pk_b138_SNPMapInfo]  PRIMARY KEY  CLUSTERED ([snp_id] ASC,[asm_acc] ASC,[asm_version] ASC)
GO


ALTER TABLE [dn_IND_batchCount] ADD CONSTRAINT [pk_dn_IND_batchCount]  PRIMARY KEY  NONCLUSTERED ([batch_id] ASC,[pop_id] ASC)
GO


ALTER TABLE [dn_PopulationIndGrp] ADD CONSTRAINT [pk_dn_PopulationIndGrp]  PRIMARY KEY  CLUSTERED ([pop_id] ASC)
GO

ALTER TABLE [dn_batchCount] ADD CONSTRAINT [pk_dn_batchCount]  PRIMARY KEY  NONCLUSTERED ([batch_id] ASC)
GO

ALTER TABLE [dn_handleCount] ADD CONSTRAINT [pk_dn_handleCount]  PRIMARY KEY  NONCLUSTERED ([handle] ASC,[batch_type] ASC)
GO



