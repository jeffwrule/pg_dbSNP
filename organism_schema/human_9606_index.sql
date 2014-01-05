
CREATE NONCLUSTERED INDEX [i_tax_id] ON [Batch] ([tax_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_submitted_time] ON [Batch] ([submitted_time] ASC)
GO
CREATE NONCLUSTERED INDEX [i_handle_loc_batch_id] ON [Batch] ([handle] ASC,[loc_batch_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_pop_id] ON [Batch] ([pop_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_success_rate_int] ON [Batch] ([success_rate_int] ASC)
GO
CREATE NONCLUSTERED INDEX [i_method_id] ON [Batch] ([method_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_lbid_u] ON [Batch] ([loc_batch_id_upp] ASC)
GO
CREATE NONCLUSTERED INDEX [i_last_updated] ON [Batch] ([last_updated_time] ASC)
GO

CREATE NONCLUSTERED INDEX [i_pub_id] ON [BatchCita] ([pub_id] ASC)
GO


CREATE NONCLUSTERED INDEX [i_BatchCultivar2] ON [BatchCultivar] ([line] ASC)
GO


CREATE NONCLUSTERED INDEX [i_strain] ON [BatchStrain] ([line] ASC)
GO




CREATE CLUSTERED INDEX [t_hwp_chisq] ON [FreqSummaryBySsPop] ([subsnp_id] ASC,[pop_id] ASC)
GO








CREATE NONCLUSTERED INDEX [i_curator_ped_id] ON [Pedigree] ([curator] ASC,[curator_ped_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_ind_ped] ON [PedigreeIndividual] ([ind_id] ASC,[ped_id] ASC)
GO


CREATE CLUSTERED INDEX [i_pid_line_num] ON [PopMandLine] ([pop_id] ASC,[line_num] ASC)
GO

CREATE NONCLUSTERED INDEX [i_handle_loc_pop_id_upp] ON [Population] ([handle] ASC,[loc_pop_id_upp] ASC)
GO
CREATE NONCLUSTERED INDEX [i_handle_loc_pop_id] ON [Population] ([handle] ASC,[loc_pop_id] ASC)
GO

CREATE CLUSTERED INDEX [i_rsH] ON [RsMergeArch] ([rsHigh] ASC)
GO
CREATE NONCLUSTERED INDEX [i_rsL] ON [RsMergeArch] ([rsLow] ASC)
GO

CREATE CLUSTERED INDEX [i_rs] ON [SNP] ([snp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_exemplarSs] ON [SNP] ([exemplar_subsnp_id] ASC,[snp_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_snp_id] ON [SNP3D] ([snp_id] ASC)
GO




CREATE CLUSTERED INDEX [i_rs_hgvs] ON [SNPClinSig] ([hgvs_g] ASC,[snp_id] ASC)
GO



CREATE NONCLUSTERED INDEX [i_hist_time] ON [SNPHistory] ([history_create_time] ASC)
GO

CREATE CLUSTERED INDEX [i_rs_ss_pmid] ON [SNPPubmed] ([snp_id] ASC,[subsnp_id] ASC,[pubmed_id] ASC,[type] ASC)
GO

CREATE CLUSTERED INDEX [i_ss] ON [SNPSubSNPLink] ([subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_rs] ON [SNPSubSNPLink] ([snp_id] ASC,[subsnp_id] ASC,[substrand_reversed_flag] ASC)
GO

CREATE CLUSTERED INDEX [i_snp_id] ON [SNPSubSNPLinkHistory] ([snp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_ss_rs] ON [SNPSubSNPLinkHistory] ([subsnp_id] ASC,[snp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_build_id] ON [SNPSubSNPLinkHistory] ([build_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_build_id_when_history_made] ON [SNPSubSNPLinkHistory] ([build_id_when_history_made] ASC)
GO


CREATE NONCLUSTERED INDEX [i_rs] ON [SNPVal] ([snp_id] ASC)
GO

CREATE CLUSTERED INDEX [i_rs_hgvs] ON [SNP_HGVS] ([hgvs_name] ASC,[snp_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_link_prop_b2] ON [SNP_bitfield] ([link_prop_b2] ASC,[snp_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_ss] ON [SubPop] ([subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_pop_ss] ON [SubPop] ([pop_id] ASC,[subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_subpop_id] ON [SubPop] ([subpop_id] ASC)
GO

CREATE CLUSTERED INDEX [iuc_SubPopAllele] ON [SubPopAllele] ([batch_id] ASC,[subsnp_id] ASC,[pop_id] ASC,[allele] ASC,[other] ASC,[type] ASC)
GO
CREATE NONCLUSTERED INDEX [iSubPopAllele1] ON [SubPopAllele] ([freq] ASC)
GO
CREATE NONCLUSTERED INDEX [iSubPopAllele2] ON [SubPopAllele] ([freq_max] ASC)
GO
CREATE NONCLUSTERED INDEX [iSubPopAllele3] ON [SubPopAllele] ([freq_min] ASC)
GO
CREATE NONCLUSTERED INDEX [i_subsnp_id] ON [SubPopAllele] ([subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_type] ON [SubPopAllele] ([type] ASC)
GO
CREATE NONCLUSTERED INDEX [i_last_updated_time] ON [SubPopAllele] ([last_updated_time] ASC)
GO
CREATE NONCLUSTERED INDEX [i_allele_id] ON [SubPopAllele] ([allele_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_subpop_id] ON [SubPopAllele] ([subpop_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_sp_ale] ON [SubPopAllele] ([subpop_id] ASC,[type] ASC,[allele] ASC,[other] ASC)
GO

CREATE NONCLUSTERED INDEX [i_subpop_id] ON [SubPopGty] ([subpop_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_gty_id] ON [SubPopGty] ([gty_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_loc_snp] ON [SubSNP] ([loc_snp_id_upp] ASC,[subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_bid_ss] ON [SubSNP] ([batch_id] ASC,[subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_var] ON [SubSNP] ([variation_id] ASC,[subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_ss_bid_loc] ON [SubSNP] ([subsnp_id] ASC,[batch_id] ASC,[loc_snp_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_acc_part_ind] ON [SubSNPAcc_ins] ([acc_part] ASC,[acc_type_ind] ASC,[subsnp_id] ASC)
GO




CREATE NONCLUSTERED INDEX [i_subsnp_id] ON [SubSNPMdFailLn] ([subsnp_id] ASC)
GO


CREATE CLUSTERED INDEX [i_ss] ON [SubSNPOmim] ([subsnp_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_pmid] ON [SubSNPPubmed] ([pubmed_id] ASC)
GO





CREATE NONCLUSTERED INDEX [i_submitted_ind_id] ON [SubmittedIndividual] ([submitted_ind_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_ind] ON [SubmittedIndividual] ([ind_id] ASC)
GO




CREATE CLUSTERED INDEX [i_rs_gi_pos] ON [b138_MapLink] ([snp_id] ASC,[gi] ASC,[offset] ASC)
GO
CREATE NONCLUSTERED INDEX [i_src] ON [b138_MapLink] ([source] ASC)
GO
CREATE NONCLUSTERED INDEX [i_gi_from_to] ON [b138_MapLink] ([gi] ASC,[offset] ASC,[asn_to] ASC,[snp_id] ASC,[lc_ngbr] ASC,[rc_ngbr] ASC,[loc_type] ASC)
GO


CREATE CLUSTERED INDEX [i_gi] ON [b138_MapLinkInfo] ([gi] ASC)
GO

CREATE CLUSTERED INDEX [i_gi] ON [b138_ProteinInfo] ([gi] ASC)
GO


CREATE CLUSTERED INDEX [i_rs] ON [b138_SNPChrPosOnRef] ([snp_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_pos] ON [b138_SNPContigLoc] ([ctg_id] ASC,[asn_from] ASC,[snp_id] ASC)
GO

CREATE CLUSTERED INDEX [i_rsCtgMrna] ON [b138_SNPContigLocusId] ([snp_id] ASC,[contig_acc] ASC,[asn_from] ASC,[locus_id] ASC,[allele] ASC,[mrna_start] ASC,[mrna_gi] ASC)
GO
CREATE NONCLUSTERED INDEX [i_rs] ON [b138_SNPContigLocusId] ([snp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_rna] ON [b138_SNPContigLocusId] ([mrna_gi] ASC,[snp_id] ASC)
GO


The statement has been terminated.

CREATE NONCLUSTERED INDEX [i_rs_weight] ON [b138_SNPMapInfo] ([snp_id] ASC,[assembly] ASC,[weight] ASC)
GO



CREATE CLUSTERED INDEX [i_pid] ON [dn_IND_batch_pop] ([pop_id] ASC)
GO





CREATE CLUSTERED INDEX [i_b_size] ON [dn_table_rowcount] ([build_id] DESC,[reserved_KB_spaceused] DESC)
GO

