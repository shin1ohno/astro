return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    lazygit = {
      configure = true,
      config = {
        os = { editPreset = "nvim-remote" },
        gui = {
          nerdFontsVersion = "3",
        },
      },
      theme = {
        [241] = { fg = "Special" },
        activeBorderColor = { fg = "MatchParen", bold = true },
        cherryPickedCommitBgColor = { fg = "Identifier" },
        cherryPickedCommitFgColor = { fg = "Function" },
        defaultFgColor = { fg = "Normal" },
        inactiveBorderColor = { fg = "FloatBorder" },
        optionsTextColor = { fg = "Function" },
        searchingActiveBorderColor = { fg = "MatchParen", bold = true },
        selectedLineBgColor = { bg = "Visual" },
        unstagedChangesColor = { fg = "DiagnosticError" },
      },
      win = {
        style = "lazygit",
      },
    },
    dashboard = {
      sections = {
        { section = "terminal", cmd = "fastfetch 2>/dev/null", height = 20, padding = 1 },
        { pane = 2, icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function() return Snacks.git.get_root() ~= nil end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
  },
}
