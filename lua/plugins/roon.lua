---@type LazySpec
return {
  {
    "shin1ohno/roon.nvim",
    cmd = {
      "RoonPlay",
      "RoonPause",
      "RoonStop",
      "RoonNext",
      "RoonPrevious",
      "RoonPlayPause",
      "RoonStatus",
      "RoonShow",
      "RoonHide",
      "RoonToast",
      "RoonLog",
      "RoonLogClear",
      "RoonSeek",
      "RoonSeekForward",
      "RoonSeekBack",
      "RoonVolume",
      "RoonVolumeUp",
      "RoonVolumeDown",
      "RoonMute",
      "RoonUnmute",
      "RoonMuteToggle",
      "RoonStatuslineToggle",
    },
    opts = {
      zone = "Qutest",
      card = {
        auto_open = false,
        art = { enabled = true },
      },
    },
    config = function(_, opts)
      require("roon").setup(opts)
      if package.loaded["telescope"] then
        require("telescope").load_extension("roon")
      end
    end,
    keys = {
      { "<leader>fR", "<cmd>Telescope roon search<cr>", desc = "Roon search" },
      { "<leader>nR", "<cmd>Neotree roon focus<cr>", desc = "Roon browser" },
      { "<leader>mb", "<cmd>Neotree roon focus<cr>", desc = "Roon browser" },
      { "<leader>mp", "<cmd>RoonPlayPause<cr>", desc = "Roon play/pause" },
      { "<leader>mn", "<cmd>RoonNext<cr>", desc = "Roon next" },
      { "<leader>m,", "<cmd>RoonPrevious<cr>", desc = "Roon previous" },
      { "<leader>ml", "<cmd>RoonSeekForward<cr>", desc = "Roon seek +10s" },
      { "<leader>mh", "<cmd>RoonSeekBack<cr>", desc = "Roon seek -10s" },
      { "<leader>mk", "<cmd>RoonVolumeUp<cr>", desc = "Roon volume +5" },
      { "<leader>mj", "<cmd>RoonVolumeDown<cr>", desc = "Roon volume -5" },
      { "<leader>mM", "<cmd>RoonMuteToggle<cr>", desc = "Roon mute toggle" },
      { "<leader>mx", "<cmd>RoonStop<cr>", desc = "Roon stop" },
      { "<leader>ms", "<cmd>Telescope roon artists<cr>", desc = "Roon artists" },
      { "<leader>mA", "<cmd>Telescope roon albums<cr>", desc = "Roon albums" },
      { "<leader>mt", "<cmd>Telescope roon tracks<cr>", desc = "Roon tracks" },
      { "<leader>mS", "<cmd>RoonStatus<cr>", desc = "Roon status card" },
      { "<leader>mV", "<cmd>RoonStatuslineToggle<cr>", desc = "Roon statusline toggle" },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      if not vim.tbl_contains(opts.sources, "roon") then
        table.insert(opts.sources, "roon")
      end
      return opts
    end,
  },
}
