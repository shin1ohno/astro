# Neovim Configuration Project Overview

## Project Purpose
This is a personal Neovim configuration based on AstroNvim v5+, a full-featured IDE framework. The configuration provides a modern development environment with extensive plugin support, LSP integration, and AI assistance capabilities.

## Technology Stack
- **Base Framework**: AstroNvim v5+ (Neovim IDE framework)
- **Plugin Manager**: Lazy.nvim (modern plugin manager with lazy loading)
- **Language**: Lua (configuration language)
- **Additional Tools**:
  - AstroCommunity: Curated collection of community plugins
  - Mason: LSP server management
  - Conform.nvim: Code formatting
  - none-ls (null-ls): Additional formatting/linting
  - claudecode.nvim: AI integration (formerly avante.nvim)
  - Obsidian.nvim: Note-taking integration

## Project Structure
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
│       └── none-ls.lua   # Formatting/linting tools
├── .stylua.toml         # Lua code formatter configuration
├── CLAUDE.md            # Documentation for Claude Code AI
├── README.md            # Project documentation
└── lazy-lock.json       # Plugin version lock file
```

## Key Features
- Full IDE capabilities through AstroNvim
- Multiple AI provider integrations (Copilot, OpenAI, Claude, Gemini)
- Obsidian note-taking integration
- Automatic environment variable loading from ~/.env
- Nord theme with transparent background
- Extensive LSP support through Mason
- Custom key mappings for Claude Code AI integration

## Environment Requirements
- Neovim (compatible with AstroNvim v5+)
- Git (for plugin installation)
- Make (for building claudecode.nvim)
- Various API keys for AI services (loaded from ~/.env):
  - GROQ_API_KEY
  - LIGHTLLM_API_KEY
  - GEMINI_API_KEY