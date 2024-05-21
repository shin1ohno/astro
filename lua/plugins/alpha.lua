return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-project.nvim",
  },
  opts = function(_, opts)
    local _, plenary_path = pcall(require, "plenary.path")
    local theme = require "alpha.themes.theta"

    math.randomseed(os.time())

    local function set_random_header()
      local hello = {}
      hello.panda = {
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣆⠀⢀⣀⣀⣤⣤⣤⣶⣦⣤⣤⣄⣀⣀⠀⢠⣾⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀   ]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀   ]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀    ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀    ]],
        [[⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⠟⠀⠀⠀⠀⠀⣀⣤⣤⣤⡀⠀⠀⠀⠀⠀⢀⣤⣤⣤⣄⡀⠀⠀⠀⠀⠘⣿⡿⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀   ]],
        [[⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀⠀⠀⣠⣾⣿⣿⠛⣿⡇⠀⠀⠀⠀⠀⢸⣿⣿⠛⣿⣿⣦⠀⠀⠀⠀⠸⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀    ]],
        [[⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠁⠀⠀⠀⠀⣿⣿⣿⣿⣿⡟⢠⣶⣾⣿⣿⣷⣤⢹⣿⣿⣿⣿⣿⡇⠀⠀⣀⣤⣿⣷⣴⣶⣦⣀⡀⠀⠀⠀⠀   ]],
        [[⠀⠀⠀⠀ ⠀⠀⠀⢀⣠⣤⣤⣤⣇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⠀⠘⠻⣿⣿⣿⡿⠋⠀⢹⣿⣿⣿⣿⡇⠀⣿⣿⣿⡏⢹⣿⠉⣿⣿⣿⣷⠀⠀⠀   ]],
        [[⠀⠀⠀ ⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠹⣿⣿⠿⠋⠀⢤⣀⢀⣼⡄⠀⣠⠀⠈⠻⣿⣿⠟⠀⢸⣿⣇⣽⣿⠿⠿⠿⣿⣅⣽⣿⡇⠀⠀   ]],
        [[⠀⠀⠀⠀ ⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣟⠁⠀⠀⠀⠈⣿⣿⣿⡇⠀⠀⠀  ]],
        [[⠛⠛⠛⠛⠛⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛]],
        [[⠀⠀⠀⠀⠀⠀⠘⠛⠻⢿⣿⣿⣿⣿⣿⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ]],
      }
      hello.vlogo = {
        [[     .          .     ]],
        [[   ';;,.        ::'   ]],
        [[ ,:::;,,        :ccc, ]],
        [[,::c::,,,,.     :cccc,]],
        [[,cccc:;;;;;.    cllll,]],
        [[,cccc;.;;;;;,   cllll;]],
        [[:cccc; .;;;;;;. coooo;]],
        [[;llll;   ,:::::'loooo;]],
        [[;llll:    ':::::loooo:]],
        [[:oooo:     .::::llodd:]],
        [[.;ooo:       ;cclooo:.]],
        [[  .;oc        'coo;.  ]],
        [[    .'         .,.    ]],
      }

      local keys = {
        "panda",
        "vlogo",
      }

      local key = keys[math.random(#keys)]
      opts.section.header.val = hello[key]
    end

    local function set_info_footer()
      local lazy_stats = require("lazy").stats()
      local total_plugins = " " .. lazy_stats.loaded .. "/" .. lazy_stats.count .. " packages"
      local datetime = os.date " %A %B %d"
      local version = vim.version()
      local nvim_version_info = "ⓥ  " .. version.major .. "." .. version.minor .. "." .. version.patch
      opts.section.footer.val = datetime .. "  |  " .. total_plugins .. "  |  " .. nvim_version_info
    end

    local function set_shortcuts()
      opts.section.buttons.val = {
        opts.button("LDR f f", "  Find File  "),
        opts.button("LDR f o", "󰈙  Recents  "),
        opts.button("LDR f w", "󰈭  Find Word  "),
        opts.button("LDR f '", "  Bookmarks  "),
        opts.button("LDR S l", "  Last Session  "),
      }
    end

    set_random_header()
    set_info_footer()
    set_shortcuts()

    return opts
  end,
}
