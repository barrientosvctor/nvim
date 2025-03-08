return {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {"nvim-neotest/nvim-nio"},
        },
        "theHamsta/nvim-dap-virtual-text",
        "williamboman/mason.nvim",
    },
    cmd = {
        "DapContinue",
        "DapLoadLaunchJSON",
        "DapRestartFrame",
        "DapSetLogLevel",
        "DapShowLog",
        "DapStepInto",
        "DapStepOut",
        "DapStepOver",
        "DapTerminate",
        "DapToggleBreakpoint",
        "DapToggleRepl",
    },
    config = function()
        local dap, dapui = require "dap", require "dapui"

        dapui.setup()
        require("nvim-dap-virtual-text").setup {}

        local codelldb_executable = vim.fn.exepath "codelldb"
        if codelldb_executable ~= "" then
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = codelldb_executable,
                    args = {"--port", "${port}"},
                    detached = (vim.fn.has("win32") == 0),
                },
            }

            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                },
            }

            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp
        end

        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F6>", dap.step_into)
        vim.keymap.set("n", "<F7>", dap.step_over)
        vim.keymap.set("n", "<F8>", dap.restart)
        vim.keymap.set("n", "<Leader>tb", dap.toggle_breakpoint)
        vim.keymap.set("n", "<Leader>?", function()
            dapui.eval(nil, { enter = true })
        end)

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
}
