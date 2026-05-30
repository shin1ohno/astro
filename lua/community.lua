-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  -- transparent-nvim: import disabled — consolidated into a single self-contained
  -- spec in lua/plugins/user.lua. The pack and the user spec were a duplicate
  -- (lazy merged them by URL and the user config silently shadowed the pack's
  -- opts/config). The user spec re-adds the pack's <Leader>uT mapping + the
  -- TransparentClear->heirline color-refresh autocmd, so nothing is lost.
  -- { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.colorscheme.nord-nvim" },
  { import = "astrocommunity.completion.nvim-cmp" },
  { import = "astrocommunity.completion.blink-cmp-tmux" },
  ---{ import = "astrocommunity.completion.copilot-cmp" },
  -- mcphub-nvim: import disabled — upstream pack spec is malformed (a stray
  -- positional CopilotChat block makes #spec==2, so lazy.nvim's list branch
  -- discards the event/cmd triggers and mcphub loads eagerly at startup).
  -- Replaced by a well-formed spec in lua/plugins/mcphub.lua.
  -- { import = "astrocommunity.editing-support.mcphub-nvim" },
  { import = "astrocommunity.fuzzy-finder.telescope-nvim" },
  { import = "astrocommunity.git.octo-nvim" },
  { import = "astrocommunity.icon.mini-icons" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.note-taking.zk-nvim" },
  { import = "astrocommunity.pack.haskell" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.recipes.picker-nvchad-theme" },
  { import = "astrocommunity.recipes.vscode-icons" },
  { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },
  { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
}
