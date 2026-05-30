---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    filetypes = {
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
      },
    },
    mappings = {
      n = {
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<Leader>z"] = {
          desc = "zk",
        },
        ["<Leader>zn"] = {
          function() require("zk").new { title = vim.fn.input "Title: " } end,
          desc = "New zk note",
        },
        ["<Leader>zo"] = {
          function() require("zk").notes { sort = { "modified" } } end,
          desc = "Open zk notes",
        },
        ["<Leader>zt"] = {
          function() require("zk").tags() end,
          desc = "Open zk tags",
        },
        ["<Leader>zf"] = {
          function() require("zk").notes { sort = { "modified" }, match = { vim.fn.input "Search: " } } end,
          desc = "Search zk notes",
        },

        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
      },
    },
  },
}
