# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Overview

This is an AstroNvim v5+ based Neovim configuration using Lazy.nvim as the plugin manager. The configuration follows a modular architecture with settings split across multiple Lua files.

## Key Architecture

### Plugin Management
- **Lazy.nvim**: Modern plugin manager with lazy loading support
- **AstroNvim**: Full-featured Neovim IDE framework
- **AstroCommunity**: Curated collection of community plugins

### Directory Structure
```
~/.config/nvim/
├── init.lua              # Entry point, bootstraps Lazy.nvim
├── lua/
│   ├── lazy_setup.lua    # Main Lazy.nvim configuration
│   ├── community.lua     # AstroCommunity plugin imports
│   ├── polish.lua        # Final configuration adjustments
│   └── plugins/         # Individual plugin configurations
│       ├── user.lua      # Custom plugins (claudecode.nvim, dotenv.nvim)
│       ├── obsidian.lua  # Obsidian note management
│       ├── astro*.lua    # AstroNvim core components
│       ├── mason.lua     # LSP server management
│       └── ...
```

## Common Commands

### Plugin Management
- `:Lazy` - Open Lazy.nvim UI for plugin management
- `:Lazy sync` - Update all plugins
- `:Lazy install` - Install missing plugins
- `:Lazy clean` - Remove unused plugins

### Development Tasks
- `:Mason` - Manage LSP servers, formatters, linters
- `:LspInfo` - Show attached LSP clients
- `:ConformInfo` - Show formatter information

### AI Integration
The configuration includes multiple AI providers through claudecode.nvim (formerly avante.nvim):
- Copilot (default provider)
- OpenAI (model: o3)
- Claude (via Copilot, model: claude-sonnet-4)
- Gemini (model: gemini-2.5-pro-preview-03-25)
- Custom vendors: Groq, Mercari internal LLM

### Obsidian Integration
- `:ObsidianOpen` - Open note in Obsidian app
- `:ObsidianNew` - Create new note
- `:ObsidianSearch` - Search notes
- Auto-sync on save (Linux only via `~/.setup_shin1ohno/obsidian_sync/sync.sh`)

## Important Configuration Details

### Environment Variables
- Automatically loads from `~/.env` file via dotenv.nvim
- Required API keys:
  - `GROQ_API_KEY` for Groq AI
  - `LIGHTLLM_API_KEY` for Mercari internal LLM
  - `GEMINI_API_KEY` for Google Gemini

### Color Scheme
- Nord theme with transparent background support
- Configured in `polish.lua`

### Obsidian Notes Location
- macOS: `~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obs`
- Linux: `~/Obs`

### Build Requirements
- claudecode.nvim requires `make` for building
- Run `:Lazy build claudecode.nvim` if build fails

## Development Workflow

When modifying this configuration:
1. Edit files in `lua/plugins/` for plugin-specific changes
2. Use `lua/polish.lua` for final configuration tweaks
3. Test changes with `:source %` or restart Neovim
4. Check `:checkhealth` for any issues after major changes

## LSP and Formatting

The configuration uses:
- Mason for LSP server management
- none-ls (null-ls) for additional formatting/linting
- Conform.nvim for formatting
- Multiple language-specific packs from AstroCommunity

Check `lua/plugins/mason.lua` and `lua/plugins/none-ls.lua` for specific tool configurations.

## Claude Code Support

### Using Serena for Large Codebase Analysis
When dealing with large codebases that exceed context limits, use Serena (smart AI agent) for comprehensive analysis:
- **When to use**: Multi-file analysis, codebase understanding, feature verification
- **How to use**: Let Claude Code know you want to use Serena for analysis tasks
- **Benefits**: Better context understanding across entire codebase

### Using Gemini CLI for Large Context
For massive context requirements, use the Gemini CLI with `@` syntax:
- **File inclusion**: `gemini -p "@src/main.py Explain this file"`
- **Directory analysis**: `gemini -p "@src/ Summarize the architecture"`  
- **Web search**: `gemini -p "WebSearch: oauth 2.0 security best practices"`
- **Feature verification**: `gemini -p "@src/ @lib/ Has dark mode been implemented?"`

### Best Practices
1. Use Serena for complex reasoning tasks and large codebase analysis
2. Use Gemini CLI when context window limitations are encountered
3. Both tools complement Claude Code's capabilities for comprehensive development workflow