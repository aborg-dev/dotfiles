require("which-key").setup {}

-- The default timeout of 1 second is too large.
-- So we overwrite the global setting that triggers after initial <Leader> keypress.
vim.o.timeoutlen = 300 -- 300 milliseconds.
