---@type LazySpec
return {
  {
    "ellisonleao/dotenv.nvim",
    config = function() require("dotenv").setup {} end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "copilot",
      auto_suggest_provider = "copilot",
      cursor_applying_provider = "copilot",
      vendors = {
        groq = {
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          endpoint = "https://api.groq.com/openai/v1/",
          model = "meta-llama/llama-4-scout-17b-16e-instruct",
          max_completion_tokens = 1024,
        },
      },
      copilot = {
        model = "claude-3.7-sonnet",
      },
      claude = {
        disable_tools = true,
      },
      gemini = {
        api_key_name = "GEMINI_API_KEY",
        model = "gemini-2.5-pro-preview-03-25",
      },
      behaviour = {
        auto_apply_diff_after_generation = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_suggestions = true,
        enable_claude_text_editor_mode = true,
        enable_cursor_planning_mode = true,
        minimize_diff = true,
        support_paste_from_clipboard = true,
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        "CopilotC-Nvim/CopilotChat.nvim",
        event = { "VeryLazy" },
        branch = "main",
        dependencies = {
          { "zbirenbaum/copilot.lua" },
          { "nvim-lua/plenary.nvim" },
        },
        opts = {
          model = "claude-3.7-sonnet",
        },
      },
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
