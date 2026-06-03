local zen = require("zen-mode")

local writerModeOn = false

function ToggleWriterMode()
    writerModeOn = not writerModeOn
    zen.toggle()
    if writerModeOn then
        vim.cmd('set wrap')
        vim.cmd('set linebreak')
        vim.cmd('set nolist')
        vim.keymap.set({ "n", "v" }, "j", "gj", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v" }, "k", "gk", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v" }, "<Down>", "gj", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v" }, "<Up>", "gk", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v" }, "$", "g$", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v" }, "_", "g^", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v" }, "0", "g0", { noremap = true, silent = true })
    else
        vim.cmd('set nowrap')
        vim.cmd('set nolinebreak')
        vim.cmd('set list')
        vim.keymap.del({ "n", "v" }, "j")
        vim.keymap.del({ "n", "v" }, "k")
        vim.keymap.del({ "n", "v" }, "<Down>")
        vim.keymap.del({ "n", "v" }, "<Up>")
        vim.keymap.set({ "n", "v" }, "$")
        vim.keymap.set({ "n", "v" }, "_")
        vim.keymap.set({ "n", "v" }, "0")
    end
end

vim.api.nvim_create_user_command("WriterMode", ToggleWriterMode, {})

vim.keymap.set({ "n", "v" }, "<leader>wm", ToggleWriterMode, { noremap = true, silent = true })
