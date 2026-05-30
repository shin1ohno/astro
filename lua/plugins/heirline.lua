---@type LazySpec
return {
  "rebelot/heirline.nvim",
  optional = true,
  opts = function(_, opts)
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
