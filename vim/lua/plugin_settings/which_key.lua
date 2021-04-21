-- The default timeout of 1 second is too large.
-- So we overwrite the global setting that triggers after initial <Leader> keypress.
-- And a secondary setting that triggers when going to sub-keys.
vim.o.timeoutlen = 300 -- 300 milliseconds.
vim.g.which_key_timeout = 100 -- 100 milliseconds.
