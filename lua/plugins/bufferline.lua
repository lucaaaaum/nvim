return {
    "akinsho/bufferline.nvim",
    config = function(_, opts)
        vim.opt.termguicolors = true
        require("bufferline").setup(opts)
    end
}
