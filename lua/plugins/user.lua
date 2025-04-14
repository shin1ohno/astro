---@type LazySpec
return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "gemini",
      auto_suggest_provider = "copilot",
      cursor_applying_provider = "gemini",
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
      vertex = {
        model = "gemini-2.5-pro-preview-03-25",
        endpoint = "https://us-central1-aiplatform.googleapis.com/v1/projects/kouzoh-p-sh1/locations/us-central1/publishers/google/models",
      },
      behaviour = {
        auto_suggestions = true,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        enable_cursor_planning_mode = true,
        support_paste_from_clipboard = true,
        minimize_diff = true,
        enable_claude_text_editor_mode = true,
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
          debug = true,
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
