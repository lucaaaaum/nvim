local on_attach = function(client, bufnr)
    vim.notify(string.format('Setting up client \'%s\' for buffer %d', client.name, bufnr))
    local definir_comando_normal = function(keys, func)
        vim.keymap.set('n', keys, func, { buffer = bufnr })
    end

    definir_comando_normal('<leader>R', vim.lsp.buf.rename)
    definir_comando_normal('<leader>a', vim.lsp.buf.code_action)

    definir_comando_normal('gd', vim.lsp.buf.definition)
    definir_comando_normal('gD', vim.lsp.buf.declaration)
    definir_comando_normal('gi', vim.lsp.buf.implementation)
    definir_comando_normal('<leader>D', vim.lsp.buf.type_definition)

    local telescope = require('telescope.builtin')
    definir_comando_normal('<leader>r', telescope.lsp_references)
    definir_comando_normal('<leader>s', telescope.lsp_document_symbols)
    definir_comando_normal('<leader>S', telescope.lsp_dynamic_workspace_symbols)

    definir_comando_normal('<leader>W', vim.lsp.buf.hover)

    definir_comando_normal('<leader>l', function()
        vim.diagnostic.jump({ count = 1 })
    end)
    definir_comando_normal('<leader>h', function()
        vim.diagnostic.jump({ count = -1 })
    end)

    vim.api.nvim_buf_create_user_command(
        bufnr,
        'Format',
        function(_)
            vim.lsp.buf.format()
        end,
        {}
    )

    definir_comando_normal('<leader>m', ':Format<CR>')

    local function definir_comando_visual(keys, func)
        vim.keymap.set('v', keys, func, { buffer = bufnr })
    end

    definir_comando_visual('<leader>a', vim.lsp.buf.code_action)

    vim.notify(string.format('Finished setting up client \'%s\' for buffer %d', client.name, bufnr))
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            on_attach(client, args.buf)
        end
    end
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
        },
    },
})

vim.lsp.config('roslyn_ls', {
    filetypes = {
        "cs"
    }
})

vim.lsp.config('gopls', {})

vim.lsp.enable({ 'lua_ls', 'roslyn_ls', 'gopls' })
