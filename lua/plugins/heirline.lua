---@type LazySpec
return {
  "rebelot/heirline.nvim",
  optional = true,
  opts = function(_, opts)
    local ok, rh = pcall(require, "roon.heirline")
    if not ok then
      return opts
    end
    opts.statusline = opts.statusline or {}
    -- Insert the Roon Now Playing component just before the final
    -- NvChad nav/folder section so it sits on the right side but not
    -- off-screen.
    local pos = math.max(#opts.statusline, 1)
    table.insert(opts.statusline, pos, rh.component())
    return opts
  end,
}
