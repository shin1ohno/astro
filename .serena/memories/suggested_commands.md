# Neovim Configuration - Suggested Commands

## Plugin Management (Neovim Commands)
- `:Lazy` - Open Lazy.nvim UI for plugin management
- `:Lazy sync` - Update all plugins to latest versions
- `:Lazy install` - Install missing plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy build claudecode.nvim` - Rebuild Claude Code plugin if needed

## Development Tools (Neovim Commands)
- `:Mason` - Manage LSP servers, formatters, and linters
- `:LspInfo` - Show attached LSP clients for current buffer
- `:ConformInfo` - Show formatter information for current buffer
- `:checkhealth` - Check Neovim health status after changes

## AI Integration (Neovim Commands)
- `:ClaudeCode` - Toggle Claude AI assistant
- `:ClaudeCodeFocus` - Focus Claude window
- `:ClaudeCode --resume` - Resume previous Claude session
- `:ClaudeCode --continue` - Continue Claude conversation
- `:ClaudeCodeSelectModel` - Select AI model
- `:ClaudeCodeAdd %` - Add current buffer to Claude context
- `:ClaudeCodeDiffAccept` - Accept suggested diff
- `:ClaudeCodeDiffDeny` - Deny suggested diff

## Obsidian Integration (Neovim Commands)
- `:ObsidianOpen` - Open current note in Obsidian app
- `:ObsidianNew` - Create new Obsidian note
- `:ObsidianSearch` - Search through Obsidian notes

## Configuration Management (Shell Commands)
- `nvim` - Start Neovim
- `:source %` - Reload current configuration file
- `git status` - Check configuration changes
- `git add .` - Stage configuration changes
- `git commit -m "message"` - Commit configuration changes
- `git push` - Push changes to remote repository

## System Utilities (Linux)
- `ls -la` - List all files including hidden
- `cat file` - Display file contents
- `grep pattern file` - Search for pattern in file
- `find . -name "*.lua"` - Find Lua files
- `cd ~/.config/nvim` - Navigate to Neovim config directory

## Environment Setup
- `:Dotenv ~/.env` - Load environment variables (auto-loaded on startup)

## Testing Changes
1. Edit configuration files in `lua/plugins/` or `lua/polish.lua`
2. Run `:source %` to reload current file or restart Neovim
3. Run `:checkhealth` to verify configuration health
4. Check `:Lazy` for plugin status