local dap = require('dap')

-- DAP Adapters and Configurations
local codelldb_path = vim.fn.exepath "codelldb"

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        -- CHANGE THIS to your path!
        command = codelldb_path,
        args = {"--port", "${port}"},

        -- On windows you may have to uncomment this:
        detached = false,
    }
}

dap.configurations.c = {
    {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c


-- DAP UI
local dapui = require("dapui")
dapui.setup()

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

-- Keymaps
vim.keymap.set("n", "<leader>du", dapui.toggle)
vim.keymap.set("n", "<leader>dc", dapui.close)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)

-- Eval var under the cursor
vim.keymap.set("n", "<leader>?", function()
    dapui.eval(nil, { enter = true })
end)

vim.keymap.set("n", "<f5>", dap.continue)
vim.keymap.set("n", "<f10>", dap.step_over)
vim.keymap.set("n", "<f11>", dap.step_into)
vim.keymap.set("n", "<f12>", dap.step_out)
