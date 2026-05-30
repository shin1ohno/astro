---@type LazySpec
return {
  "rebelot/heirline.nvim",
  optional = true,
  opts = function(_, opts)
    -- roon.nvim (fully lazy) owns the now-playing component, its visibility
    -- state, and the :RoonStatuslineToggle command. All we do here is ask it
    -- to attach once it loads — `require("roon.heirline").attach()` is
    -- idempotent and gates itself on visibility, so the component stays hidden
    -- until toggled.
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(ev)
        if ev.data == "roon.nvim" then
          vim.schedule(function()
            require("roon.heirline").attach()
          end)
        end
      end,
      desc = "Attach Roon now-playing component once roon.nvim loads",
    })
    return opts
  end,
}
