---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      "markdown",
      "markdown_inline",
    })
    opts.highlight = {
      enable = true,
    }
  end,
}
