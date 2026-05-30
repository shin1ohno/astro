---@type LazySpec
return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      extra_groups = {
        "NormalFloat",
        "FloatBorder",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
      },
    },
    config = function(_, opts)
      local transparent = require "transparent"
      transparent.setup(opts)
      transparent.toggle(true)
    end,
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          opts.mappings.n["<Leader>uT"] = { "<Cmd>TransparentToggle<CR>", desc = "Toggle transparency" }
          if vim.tbl_get(opts, "autocmds", "heirline_colors") then
            table.insert(opts.autocmds.heirline_colors, {
              event = "User",
              pattern = "TransparentClear",
              desc = "Refresh heirline colors",
              callback = function()
                if package.loaded["heirline"] then require("astroui.status.heirline").refresh_colors() end
              end,
            })
          end
        end,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sources = { "filesystem", "buffers", "git_status" },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
  {
    "amekusa/auto-input-switch.nvim",
    config = function()
      require("auto-input-switch").setup {
        activate = true,
        async = false,
        log = false,
        prefix = "AutoInputSwitch",
        popup = {
          enable = true,
          duration = 1500,
          pad = true,
          hl_group = "PmenuSel",
          border = "none",
          zindex = 50,
          row = 1,
          col = 0,
          relative = "cursor",
          anchor = "NW",
          labels = {
            normal_input = { "A", 1 },
            lang_inputs = {
              Ja = { "あ", 2 },
              Zh = { "拼", 2 },
              Ko = { "한", 2 },
            },
          },
        },
        normalize = {
          enable = true,
          on = {
            "InsertLeave",
            "BufLeave",
            "WinLeave",
            "FocusLost",
            "ExitPre",
          },
          file_pattern = false,
        },
        restore = {
          enable = true,
          on = {
            "InsertEnter",
            "FocusGained",
          },
          file_pattern = false,
          exclude_pattern = "[-a-zA-Z0-9=~+/?!@#$%%^&_(){}%[%];:<>]",
        },
        match = {
          enable = false,
          on = {
            "InsertEnter",
            "FocusGained",
          },
          file_pattern = false,
          languages = {
            Ru = { enable = false, priority = 0, pattern = "[\\u0400-\\u04ff]" },
            Ja = { enable = false, priority = 0, pattern = "[\\u3000-\\u30ff\\uff00-\\uffef\\u4e00-\\u9fff]" },
            Zh = {
              enable = false,
              priority = 0,
              pattern = "[\\u3000-\\u303f\\u4e00-\\u9fff\\u3400-\\u4dbf\\u3100-\\u312f]",
            },
            Ko = {
              enable = false,
              priority = 0,
              pattern = "[\\u3000-\\u303f\\u1100-\\u11ff\\u3130-\\u318f\\uac00-\\ud7af]",
            },
          },
          lines = {
            above = 2,
            below = 1,
            exclude_pattern = [[^\s*\([-+*:|>]\|[0-9]\+\.\)\s]],
          },
        },
        os = false,
        os_settings = {
          macos = {
            enable = true,
            cmd_get = "macism",
            cmd_set = "macism %s",
            normal_input = false,
            lang_inputs = {
              Ru = "com.apple.keylayout.Russian",
              Ja = "com.apple.inputmethod.Kotoeri.Japanese",
              Zh = "com.apple.inputmethod.SCIM.ITABC",
              Ko = "com.apple.inputmethod.Korean.2SetKorean",
            },
          },
          windows = {
            enable = false,
            cmd_get = "im-select.exe",
            cmd_set = "im-select.exe %s",
            normal_input = false,
            lang_inputs = {},
          },
          linux = {
            enable = false,
            cmd_get = "ibus engine",
            cmd_set = "ibus engine %s",
            normal_input = false,
            lang_inputs = {},
          },
        },
      }
    end,
  },
  {
    "ellisonleao/dotenv.nvim",
    config = function() require("dotenv").setup {} end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown" },
    },
    ft = { "markdown" },
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    opts = {
      terminal = {
        split_width_percentage = 0.40,
      },
      terminal_cmd = "~/.local/bin/claude --dangerously-skip-permissions",
    },
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
  { "mrcjkb/neotest-haskell", lazy = true },
}
