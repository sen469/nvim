return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "DAP Continue" },
      { "<F10>", function() require("dap").step_over() end, desc = "DAP Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "DAP Step Into" },
      { "<F12>", function() require("dap").step_out() end, desc = "DAP Step Out" },
      { "<Leader>b", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<Leader>B", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional Breakpoint" },
      { "<Leader>dr", function() require("dap").repl.open() end, desc = "DAP REPL" },
      { "<Leader>du", function() require("dapui").toggle() end, desc = "DAP UI Toggle" },
    },
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- ====================
      -- dap-ui
      -- ====================
      dapui.setup()

      dap.listeners.after.event_initialized["dapui"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui"] = function()
        dapui.close()
      end

      -- ====================
      -- codelldb adapter
      -- ====================
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.adapters.lldb = {
        type = "server",
        port = 12345,
        executable = {
          command = "codelldb",
          args = { "--port", "12345" },
        },
      }

      -- ====================
      -- C / C++
      -- ====================
      dap.configurations.cpp = {
        {
          name = "Launch (Mason codelldb)",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. "/",
              "file"
            )
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,

          initCommands = {
            "settings set target.process.thread.step-avoid-libraries true",
            "settings set target.process.thread.step-avoid-regexp ^(std::|__)",
          },
        },
        {
          name = "Launch with system codelldb",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = true,
          runInTerminal = true,
        },
      }
      dap.configurations.c = dap.configurations.cpp

      -- =====================================================
      -- DAP hover 管理（複数保持 + ESC 全消去）
      -- =====================================================
      local dap_hover_wins = {}

      local function dap_hover_keep()
        local widgets = require("dap.ui.widgets")
        local cur_win = vim.api.nvim_get_current_win()

        widgets.hover()

        local hover_win = vim.api.nvim_get_current_win()
        if hover_win ~= cur_win then
          table.insert(dap_hover_wins, hover_win)
          vim.schedule(function()
            if vim.api.nvim_win_is_valid(cur_win) then
              vim.api.nvim_set_current_win(cur_win)
            end
          end)
        end
      end

      local function close_all_dap_hovers()
        for _, win in ipairs(dap_hover_wins) do
          if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
          end
        end
        dap_hover_wins = {}
      end

      -- ====================
      -- DAP 中のみ keymap
      -- ====================
      dap.listeners.after.event_initialized["dap_hover_keys"] = function()
        vim.keymap.set("n", "K", dap_hover_keep, {
          buffer = true,
          desc = "DAP Hover (keep, no focus)",
        })

        vim.keymap.set("n", "<Esc>", close_all_dap_hovers, {
          buffer = true,
          desc = "Close all DAP hovers",
        })
      end

      dap.listeners.before.event_terminated["dap_hover_keys"] = function()
        close_all_dap_hovers()
      end

      dap.listeners.before.event_exited["dap_hover_keys"] = function()
        close_all_dap_hovers()
      end
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = { "codelldb" },
      automatic_installation = true,
      automatic_setup = false,
    },
  },
}
