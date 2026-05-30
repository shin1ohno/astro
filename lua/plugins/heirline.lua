---@type LazySpec
return {
  "rebelot/heirline.nvim",
  optional = true,
  opts = function(_, opts)
    -- roon.nvim is fully lazy, so we must NOT `require("roon.*")` here — that
    -- would pull it into the startup load via lazy.nvim's require hook.
    -- Instead the now-playing component is injected into the live statusline
    -- once roon.nvim actually loads (User LazyLoad), and the toggle command
    -- loads roon on demand. The statusline renders fine without roon present.

    if vim.g.roon_statusline_visible == nil then
      vim.g.roon_statusline_visible = false
    end

    -- Build + append the Roon component to the already-instantiated heirline
    -- statusline. Idempotent: the wrapper carries a `roon_np` marker (via
    -- `static`) so repeated calls don't stack duplicates. Appends at the end
    -- (far right) rather than mid-list so existing components keep their ids.
    local function inject_roon_component()
      local ok, rh = pcall(require, "roon.heirline")
      if not ok then
        return
      end
      local heirline = require("heirline")
      local sl = heirline.statusline
      if not sl then
        return
      end
      for _, child in ipairs(sl) do
        if child.roon_np then
          return -- already injected
        end
      end
      local wrapper = {
        static = { roon_np = true },
        condition = function()
          return vim.g.roon_statusline_visible
        end,
        rh.component(),
      }
      local idx = #sl + 1
      sl[idx] = sl:new(wrapper, idx)
      vim.cmd("redrawstatus")
    end

    -- Inject as soon as roon.nvim loads, for whatever reason (a Roon command,
    -- a Roon keymap, or the toggle below). The component stays hidden until
    -- `roon_statusline_visible` is flipped on.
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(ev)
        if ev.data == "roon.nvim" then
          -- Defer so the inject runs after roon.nvim has fully finished
          -- loading (rtp added + config run), not mid-load.
          vim.schedule(inject_roon_component)
        end
      end,
      desc = "Inject Roon now-playing component once roon.nvim loads",
    })

    -- Defensive: if roon.nvim is somehow already loaded by the time heirline
    -- is configured (e.g. a config reload), inject immediately. Reading
    -- lazy's config does not trigger a load.
    local rcfg = require("lazy.core.config").plugins["roon.nvim"]
    if rcfg and rcfg._ and rcfg._.loaded then
      inject_roon_component()
    end

    vim.api.nvim_create_user_command("RoonStatuslineToggle", function()
      vim.g.roon_statusline_visible = not vim.g.roon_statusline_visible
      if vim.g.roon_statusline_visible then
        -- Ensure roon.nvim is loaded so the component can render; the
        -- LazyLoad autocmd above performs the injection.
        require("lazy").load({ plugins = { "roon.nvim" }, wait = true })
        inject_roon_component()
      end
      vim.cmd("redrawstatus")
    end, { desc = "Toggle Roon now-playing statusline component" })

    return opts
  end,
}
