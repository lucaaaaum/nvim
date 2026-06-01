vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.wrap = false

vim.opt.foldlevelstart = 99

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        local ok, parsers = pcall(require, "nvim-treesitter.parsers")
        if ok and parsers.has_parser() then
            vim.wo[0][0].foldmethod = "expr"
            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        else
            vim.wo[0][0].foldmethod = "indent"
        end
    end,
})

vim.cmd('set nowrap');
