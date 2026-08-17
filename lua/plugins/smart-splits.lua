---@type LazySpec
return {
  -- Overrides the AstroNvim lazy_snapshot pin (0bd0216). herdr's ctrl+hjkl bindings
  -- invoke the plugin's bundled herdr-plugin.toml, which lands only on master.
  {
    "mrjones2014/smart-splits.nvim",
    commit = "289971cfdbc7f7b1c91670a228b239d870130af7",
  },
}
