---@type LazySpec
return {
  "rebelot/heirline.nvim",
  optional = true,
  opts = function(_, opts)
    local ok, rh = pcall(require, "roon.heirline")
    if not ok then
      return opts
    end

    if vim.g.roon_statusline_visible == nil then
      vim.g.roon_statusline_visible = false
    end

    vim.api.nvim_create_user_command("RoonStatuslineToggle", function()
      vim.g.roon_statusline_visible = not vim.g.roon_statusline_visible
      vim.cmd("redrawstatus")
    end, { desc = "Toggle Roon now-playing statusline component" })

    local roon_component = {
      condition = function()
        return vim.g.roon_statusline_visible
      end,
      rh.component(),
    }

    opts.statusline = opts.statusline or {}
    -- Insert the Roon Now Playing component just before the final
    -- NvChad nav/folder section so it sits on the right side but not
    -- off-screen.
    local pos = math.max(#opts.statusline, 1)
    table.insert(opts.statusline, pos, roon_component)
    return opts
  end,
}
