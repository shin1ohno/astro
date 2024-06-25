return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "epwalsh/pomo.nvim",
  },
  cmd = {
    "ObsidianOpen",
    "ObsidianNew",
    "ObsidianQuickSwitch",
    "ObsidianFollowLink",
    "ObsidianBacklinks",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianTemplate",
    "ObsidianSearch",
    "ObsidianLink",
    "ObsidianLinkNew",
  },
  opts = {
    workspaces = {
      {
        name = "mercari",
        path = "~/Documents/Obsidian Vaults/mercari",
      },
    },
    notes_dir = "notes",
    log_level = vim.log.levels.INFO,
    daily_notes = {
      folder = "notes/dailies",
      default_tags = { "daily-notes" },
      template = nil,
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
  },
}
