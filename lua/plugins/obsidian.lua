local is_mac = vim.fn.has "mac" == 1
local obsidian_notes_path

if is_mac then
  obsidian_notes_path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes/"
else
  obsidian_notes_path = "~/obsidian/notes/"
end

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
  init = function()
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*.md",
      callback = function()
        local vault_sync_command

        if is_mac then
          vault_sync_command =
            "/Users/sh1/.gvm/pkgsets/go1.21.3/global/bin/rclone bisync ~/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/ drive:obsidian"
        else
          vault_sync_command = "/usr/bin/rclone bisync ~/obsidian/ obsidian:obsidian"
        end

        vim.fn.jobstart(vault_sync_command, {
          on_exit = function(_, code)
            if code ~= 0 then print("Error: " .. code) end
          end,
        })
      end,
    })
  end,
  opts = {
    workspaces = {
      {
        name = "mercari",
        path = obsidian_notes_path,
      },
    },
    ui = {
      conceallevel = 1,
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
