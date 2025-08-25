# AI Integration Details for Neovim Configuration

## Claude Code Integration (claudecode.nvim)

### Configuration Location
- Main configuration: `lua/plugins/user.lua`
- Terminal command: `~/.claude/local/claude --dangerously-skip-permissions`
- Terminal split width: 40% of window

### Available AI Providers
1. **Copilot** (default provider)
2. **OpenAI** - Model: o3
3. **Claude** - Via Copilot, Model: claude-sonnet-4  
4. **Gemini** - Model: gemini-2.5-pro-preview-03-25
5. **Groq** - Custom vendor, requires GROQ_API_KEY
6. **Mercari Internal LLM** - Requires LIGHTLLM_API_KEY

### Key Mappings
All AI mappings use `<leader>a` prefix:
- `<leader>ac` - Toggle Claude Code
- `<leader>af` - Focus Claude window
- `<leader>ar` - Resume previous session
- `<leader>aC` - Continue conversation
- `<leader>am` - Select AI model
- `<leader>ab` - Add current buffer to context
- `<leader>as` - Send selection to Claude (visual mode)
- `<leader>as` - Add file from tree view (in file explorers)
- `<leader>aa` - Accept suggested diff
- `<leader>ad` - Deny suggested diff

### Environment Variables Required
Store in `~/.env` file (auto-loaded via dotenv.nvim):
```
GROQ_API_KEY=your_groq_key
LIGHTLLM_API_KEY=your_lightllm_key
GEMINI_API_KEY=your_gemini_key
```

### Build Requirements
- Requires `make` for building
- If build fails: `:Lazy build claudecode.nvim`

## Extended AI Capabilities

### Using Serena (MCP)
- For large codebase analysis
- Multi-file understanding
- Feature verification across project
- Activated through Claude Code

### Using Gemini CLI
- For massive context requirements
- Web search capabilities
- File inclusion with @ syntax:
  - `gemini -p "@file.lua Explain this"`
  - `gemini -p "@lua/ Analyze architecture"`
  - `gemini -p "WebSearch: topic"`

### Using o3 MCP
- Three variants: o3-high, o3, o3-low
- General knowledge and high reasoning
- Web search capabilities
- Use based on task complexity

## Best Practices
1. Use appropriate tool for context size:
   - Small edits: Direct Claude Code
   - Large analysis: Serena
   - Massive context: Gemini CLI
   - Complex reasoning: o3 variants

2. Model Selection:
   - Quick responses: Copilot
   - Complex coding: Claude
   - Large context: Gemini
   - Specialized tasks: Choose appropriate model

3. Session Management:
   - Use `--resume` to continue previous work
   - Focus window when needed
   - Accept/deny diffs carefully

## Troubleshooting
- Check API keys in ~/.env
- Verify claudecode.nvim is built
- Check `:checkhealth` for issues
- Ensure terminal command path is correct
- Review `:Lazy` for plugin status