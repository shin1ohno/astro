---@type LazySpec
return {
  {
    "shin1ohno/roon.nvim",
    -- Fully lazy: load only on a Roon command or a Roon keymap. No
    -- `dependencies` on telescope/neo-tree/heirline — those forced an eager
    -- startup load. Their integrations are wired independently:
    --   * neo-tree "roon" source — registered in the neo-tree spec below,
    --     applied when neo-tree itself loads (:Neotree).
    --   * telescope "roon" extension — auto-loaded by telescope on the first
    --     `:Telescope roon …` (telescope.extensions metatable), as long as
    --     roon.nvim is on the runtimepath (a Roon keymap loads it first).
    --   * heirline now-playing component — injected by the heirline spec on
    --     the `User LazyLoad roon.nvim` event (see heirline.lua).
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
    },
    opts = {
      zone = "Qutest",
      card = {
        art = { enabled = true },
      },
    },
    config = function(_, opts)
      require("roon").setup(opts)
      -- Register the telescope extension only when telescope is already
      -- loaded. Otherwise telescope auto-loads it on the first
      -- `:Telescope roon …`, so a non-telescope Roon command (e.g.
      -- :RoonPlay) does not drag telescope into the load.
      if package.loaded["telescope"] then
        require("telescope").load_extension("roon")
      end
      -- roon.nvim's setup() auto-opens the pinned widget after a 500ms
      -- defer. Close it once so the card stays hidden until the user
      -- explicitly invokes :RoonStatus / <leader>mS.
      vim.defer_fn(function()
        require("roon.widget").close()
      end, 600)
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
      -- RoonStatuslineToggle is defined by the heirline spec; this key loads
      -- roon.nvim (its owner) and then runs the toggle.
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
