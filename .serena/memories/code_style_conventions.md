# Code Style and Conventions for Neovim Configuration

## Lua Code Style (via .stylua.toml)
- **Line Width**: 120 characters maximum
- **Line Endings**: Unix style (LF)
- **Indentation**: Spaces, 2 spaces per level
- **Quote Style**: Auto-prefer double quotes
- **Call Parentheses**: None (omit when possible)
- **Simple Statements**: Always collapse

## File Organization Conventions
- Configuration files use `.lua` extension
- Plugin configurations go in `lua/plugins/` directory
- Each plugin gets its own file when complex
- Use descriptive filenames matching plugin names

## Code Structure Patterns
```lua
-- Return LazySpec table for plugin configurations
---@type LazySpec
return {
  {
    "plugin/name",
    dependencies = { "dependency/name" },
    config = function() 
      require("plugin").setup {}
    end,
    opts = {
      -- configuration options
    },
    keys = {
      -- key mappings
    },
  },
}
```

## Naming Conventions
- Use snake_case for Lua variables and functions
- Use descriptive names for configuration files
- Prefix AI/Claude related mappings with `<leader>a`
- Keep consistent with AstroNvim patterns

## Documentation Standards
- Include type annotations where helpful (`---@type LazySpec`)
- Use comments sparingly, code should be self-documenting
- CLAUDE.md file for AI assistant documentation
- README.md for general project documentation

## Configuration Best Practices
- Modular configuration split across multiple files
- Use lazy loading where possible
- Keep polish.lua for final tweaks
- Follow AstroNvim's configuration patterns
- Load environment variables from ~/.env automatically

## Git Commit Conventions
- Use English for commit messages and code comments
- Keep commit messages concise and descriptive
- Use imperative mood ("Add feature" not "Added feature")
- Include component prefix when relevant (e.g., "plugins: add new tool")

## Key Mapping Patterns
- Leader key: Space
- Local leader: Comma
- AI/Claude mappings: `<leader>a` prefix
- Follow vim conventions for other mappings

## File Requirements
- Always end files with newline character
- No trailing whitespace
- No empty lines with only whitespace
- Use consistent formatting throughout