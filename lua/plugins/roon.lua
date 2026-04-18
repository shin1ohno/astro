---@type LazySpec
return {
  {
    dir = vim.fn.expand("~/ManagedProjects/roon-nvim"),
    name = "roon-nvim",
    dev = true,
    lazy = false,
    dependencies = {
      "rebelot/heirline.nvim",
      "nvim-neo-tree/neo-tree.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      zone = "Qutest",
    },
    config = function(_, opts)
      require("roon-nvim").setup(opts)
      require("telescope").load_extension("roon")
    end,
    keys = {
      { "<leader>fR", "<cmd>Telescope roon search<cr>", desc = "Roon search" },
      { "<leader>nR", "<cmd>Neotree roon focus<cr>", desc = "Roon browser" },
      { "<leader>mb", "<cmd>Neotree roon focus<cr>", desc = "Roon browser" },
      { "<leader>mp", "<cmd>RoonPlayPause<cr>", desc = "Roon play/pause" },
      { "<leader>mn", "<cmd>RoonNext<cr>", desc = "Roon next" },
      { "<leader>m,", "<cmd>RoonPrevious<cr>", desc = "Roon previous" },
      { "<leader>mx", "<cmd>RoonStop<cr>", desc = "Roon stop" },
      { "<leader>ms", "<cmd>Telescope roon search<cr>", desc = "Roon search" },
      { "<leader>mS", "<cmd>RoonStatus<cr>", desc = "Roon status card" },
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
