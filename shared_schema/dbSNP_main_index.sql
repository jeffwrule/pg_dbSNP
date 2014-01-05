CREATE NONCLUSTERED INDEX [i_rev_allele_id] ON [Allele] ([rev_allele_id] ASC)
GO


CREATE NONCLUSTERED INDEX [i_motif] ON [AlleleMotif] ([motif_id] ASC)
GO

CREATE CLUSTERED INDEX [ind_AllocIds_name] ON [AllocIds] ([name] ASC)
GO

CREATE NONCLUSTERED INDEX [i_auth] ON [Author] ([author] ASC)
GO

CREATE CLUSTERED INDEX [i_batch] ON [Batch_tax_id] ([batch_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_batch_asm] ON [Batch_tax_id] ([batch_id] ASC,[asm_acc] ASC,[asm_version] ASC)
GO
CREATE NONCLUSTERED INDEX [i_asm] ON [Batch_tax_id] ([asm_acc] ASC,[asm_version] ASC)
GO





CREATE NONCLUSTERED INDEX [i_unigty] ON [GtyAllele] ([unigty_id] ASC)
GO
CREATE NONCLUSTERED INDEX [gty_id_idx] ON [GtyAllele] ([gty_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_gty_id] ON [GtyAllele] ([gty_id] ASC)
GO


CREATE NONCLUSTERED INDEX [i_loaddate] ON [LoadHistory] ([loaddate] ASC)
GO



CREATE NONCLUSTERED INDEX [i_handle_loc_method_id] ON [Method] ([handle] ASC,[loc_method_id] ASC)
GO




CREATE NONCLUSTERED INDEX [i_motif] ON [Motif] ([motif] ASC)
GO

CREATE NONCLUSTERED INDEX [i_obs] ON [ObsGenotype] ([obs] ASC)
GO
CREATE NONCLUSTERED INDEX [i_obs_upp_fix] ON [ObsGenotype] ([obs_upp_fix] ASC)
GO
CREATE NONCLUSTERED INDEX [i_gty_id] ON [ObsGenotype] ([gty_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_pattern] ON [ObsVariation] ([pattern] ASC)
GO
CREATE NONCLUSTERED INDEX [i_univar] ON [ObsVariation] ([univar_id] ASC)
GO


CREATE CLUSTERED INDEX [iuc_OrganismTax] ON [OrganismTax] ([organism] ASC)
GO
CREATE NONCLUSTERED INDEX [i_tax_id] ON [OrganismTax] ([tax_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_sp_tax] ON [OrganismTax] ([species_tax_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_dbname] ON [OrganismTax] ([database_name] ASC)
GO



CREATE CLUSTERED INDEX [i_handle_title] ON [Publication] ([handle] ASC,[title] ASC)
GO


CREATE NONCLUSTERED INDEX [i_tax_id] ON [SNP_tax_id] ([tax_id] ASC,[snp_id] ASC)
GO




CREATE CLUSTERED INDEX [i_code] ON [SnpValidationCode] ([code] ASC)
GO

CREATE NONCLUSTERED INDEX [i_abbrev_orien] ON [StrandCode] ([abbrev] ASC,[rs_to_ss_orien] ASC,[code] ASC)
GO

CREATE CLUSTERED INDEX [i_comment_id] ON [SubSNPDelComm] ([comment_id] ASC)
GO


CREATE CLUSTERED INDEX [iuc_Submitter] ON [Submitter] ([handle] ASC)
GO
CREATE NONCLUSTERED INDEX [ic_Submitter] ON [Submitter] ([name] ASC)
GO


CREATE NONCLUSTERED INDEX [i_u_gty_str] ON [UniGty] ([gty_str] ASC)
GO
CREATE NONCLUSTERED INDEX [i_u_allele_ids] ON [UniGty] ([allele_id_1] ASC,[allele_id_2] ASC)
GO
CREATE NONCLUSTERED INDEX [i_allele_id_2] ON [UniGty] ([allele_id_2] ASC)
GO

CREATE NONCLUSTERED INDEX [i_allele_id] ON [UniVariAllele] ([allele_id] ASC)
GO

CREATE NONCLUSTERED INDEX [cv_uvid_class] ON [UniVariation] ([univar_id] ASC,[subsnp_class] ASC)
GO
CREATE NONCLUSTERED INDEX [i_u_var_str] ON [UniVariation] ([var_str] ASC)
GO


CREATE NONCLUSTERED INDEX [i_allele_id] ON [VariAllele] ([allele_id] ASC)
GO









CREATE CLUSTERED INDEX [i_gty] ON [dn_gty2unigty_trueSNP] ([gty_id] ASC,[rev_flag] ASC)
GO


