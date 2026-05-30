-- mcphub.nvim — replaces the disabled astrocommunity import
-- (astrocommunity.editing-support.mcphub-nvim, commented out in community.lua).
--
-- Upstream's pack spec is malformed: the CopilotChat.nvim block sits as a stray
-- positional `[2]` at top level instead of inside `specs`, so `#spec == 2` and
-- lazy.nvim's list branch (Spec:normalize) iterates `ipairs` over only [1] and
-- [2], silently discarding the container's `event`/`cmd`/`opts`/`specs`/
-- `dependencies` keys. The result is mcphub.nvim resolving to lazy=false and
-- loading eagerly at startup. This well-formed copy keeps the cmd/event lazy
-- triggers (CopilotChat moved into `specs` where it belongs).
--
-- The codecompanion / avante / CopilotChat specs are `optional = true`, so they
-- only inject opts when those plugins are also installed (this config uses
-- claudecode.nvim instead, so they are currently no-ops) — kept for fidelity.

---@type LazySpec
return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
  },
  event = "User AstroFile",
  cmd = "MCPHub",
  opts = {},
  specs = {
    {
      "olimorris/codecompanion.nvim",
      optional = true,
      opts = {
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              show_result_in_chat = true,
              make_vars = true,
              make_slash_commands = true,
            },
          },
        },
      },
    },
    {
      "yetone/avante.nvim",
      optional = true,
      opts = {
        system_prompt = function()
          local hub = require("mcphub").get_hub_instance()
          return hub and hub:get_active_servers_prompt() or ""
        end,
        -- The custom_tools type supports both a list and a function that returns a list.
        -- Using a function here prevents requiring mcphub before it's loaded.
        custom_tools = function()
          return {
            require("mcphub.extensions.avante").mcp_tool(),
          }
        end,
      },
    },
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      optional = true,
      opts = {
        extensions = {
          copilotchat = {
            enabled = true,
            convert_tools_to_functions = true,
            convert_resources_to_functions = true,
            add_mcp_prefix = false,
          },
        },
      },
    },
  },
}
