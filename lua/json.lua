vim.api.nvim_create_augroup("JsonShortcuts", { clear = true });

vim.api.nvim_create_autocmd("FileType", {
    group = "JsonShortcuts",
    pattern = "json",
    callback = function()
        local function executar_jq(args)
            local pos_cursor = vim.api.nvim_win_get_cursor(0)
            vim.api.nvim_command('%!jq ' .. args)
            vim.api.nvim_win_set_cursor(0, pos_cursor)
        end

        local function definir_comando(name, func)
            vim.api.nvim_create_user_command(name, func, {})
        end

        local function definir_atalho(keys, func, bufnr)
            vim.keymap.set('n', keys, func, { buffer = bufnr })
        end

        definir_comando('JsonFormat', function()
            executar_jq('.')
        end)

        definir_comando('JsonCompact', function()
            executar_jq('-c .')
        end)

        definir_comando('JsonSort', function()
            executar_jq('-s .')
        end)

        definir_atalho('<leader>jj', ':JsonFormat<CR>')
        definir_atalho('<leader>jc', ':JsonCompact<CR>')
        definir_atalho('<leader>js', ':JsonSort<CR>')
    end
})
