CREATE NONCLUSTERED INDEX [i_bs] ON [SubInd_ch1] ([batch_id] ASC,[subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_ind_ss] ON [SubInd_ch1] ([submitted_ind_id] ASC,[subsnp_id] ASC,[gty_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_bs] ON [SubInd_ch2] ([batch_id] ASC,[subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_ind_ss] ON [SubInd_ch2] ([submitted_ind_id] ASC,[subsnp_id] ASC,[gty_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_bs] ON [SubInd_ch3] ([batch_id] ASC,[subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_ind_ss] ON [SubInd_ch3] ([submitted_ind_id] ASC,[subsnp_id] ASC,[gty_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_bs] ON [SubInd_ch4] ([batch_id] ASC,[subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_ind_ss] ON [SubInd_ch4] ([submitted_ind_id] ASC,[subsnp_id] ASC,[gty_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_bs] ON [SubInd_ch5] ([batch_id] ASC,[subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_ind_ss] ON [SubInd_ch5] ([submitted_ind_id] ASC,[subsnp_id] ASC,[gty_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_bs] ON [SubInd_ch6] ([batch_id] ASC,[subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_ind_ss] ON [SubInd_ch6] ([submitted_ind_id] ASC,[subsnp_id] ASC,[gty_id] ASC)
GO

CREATE NONCLUSTERED INDEX [i_bs] ON [SubInd_ch7] ([batch_id] ASC,[subsnp_id] ASC)
GO
CREATE NONCLUSTERED INDEX [i_ind_ss] ON [SubInd_ch7] ([submitted_ind_id] ASC,[subsnp_id] ASC,[gty_id] ASC)
GO

CREATE CLUSTERED INDEX [i_b_size] ON [dn_table_rowcount] ([build_id] DESC,[reserved_KB_spaceused] DESC)
GO

