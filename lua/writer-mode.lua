local zen = require("zen-mode")

local writerModeOn = false

function ToggleWriterMode()
    writerModeOn = not writerModeOn
    zen.toggle()
    if writerModeOn then
        vim.cmd('set wrap')
        vim.cmd('set linebreak')
        vim.cmd('set nolist')
    else
        vim.cmd('set nowrap')
        vim.cmd('set nolinebreak')
        vim.cmd('set list')
    end
end

vim.api.nvim_create_user_command("WriterMode", ToggleWriterMode, {})

vim.keymap.set("n", "<leader>wm", ToggleWriterMode, { noremap = true, silent = true })
