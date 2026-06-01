return {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function(_, _)
        local dap = require("dap")

        local netcoredbg_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"

        local netcoredbg_adapter = {
            type = "executable",
            command = netcoredbg_path,
            args = { "--interpreter=vscode" }
        }

        dap.adapters.netcoredbg = netcoredbg_adapter
        dap.adapters.coreclr = netcoredbg_adapter

        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "Launch",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
                end
            },
            {
                type = "coreclr",
                name = "Attach to running process",
                request = "attach",
                processId = require("dap.utils").pick_process,
            }
        }

        local definir_comando = function(keys, func)
            vim.keymap.set('n', keys, func)
        end
        definir_comando("<F5>", dap.continue)
        definir_comando("<F9>", dap.toggle_breakpoint)
        definir_comando("<F10>", dap.step_over)
        definir_comando("<F11>", dap.step_into)
        definir_comando("<F8>", dap.step_out)
        definir_comando("<leader>dr", dap.repl.open)
        definir_comando("<leader>dl", dap.run_last)
    end
}
