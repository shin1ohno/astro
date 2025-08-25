# Task Completion Checklist for Neovim Configuration

## After Making Code Changes

### 1. Verify Syntax
- Ensure Lua syntax is correct
- Check for missing commas, brackets, or quotes
- Verify table structures are properly closed

### 2. Test Configuration
- Restart Neovim or run `:source %` on changed files
- Verify plugins load without errors
- Check `:Lazy` to ensure all plugins are installed
- Run `:checkhealth` to identify any issues

### 3. Format Code
- Code should follow .stylua.toml settings
- Ensure proper indentation (2 spaces)
- Remove trailing whitespace
- Add newline at end of file

### 4. Update Documentation
- Update CLAUDE.md if AI-related changes
- Update README.md for significant changes
- Add comments only if absolutely necessary

### 5. Plugin-Specific Checks
- For new plugins: verify they're in lazy-lock.json after `:Lazy sync`
- For claudecode.nvim: run `:Lazy build claudecode.nvim` if needed
- For LSP changes: verify with `:Mason` and `:LspInfo`

### 6. Environment Variables
- Verify required API keys are in ~/.env
- Test `:Dotenv ~/.env` loads correctly
- Check environment-dependent features work

### 7. Version Control
- Review changes with `git status` and `git diff`
- Stage changes with `git add`
- Write descriptive commit message
- Push to remote repository if needed

## Common Issues to Check

### Plugin Loading
- Dependencies are correctly specified
- Lazy loading conditions are appropriate
- No circular dependencies

### Key Mappings
- No conflicts with existing mappings
- Consistent with leader key patterns
- Mode specifications are correct (normal, visual, etc.)

### File Paths
- Obsidian paths correct for OS (macOS vs Linux)
- Plugin paths resolve correctly
- Configuration files in correct locations

### Performance
- Lazy loading working as expected
- No unnecessary plugins loaded at startup
- Disabled unused rtp plugins

## Final Verification
1. Close and reopen Neovim
2. Try basic operations (open file, edit, save)
3. Test specific features that were changed
4. Ensure no error messages appear
5. Verify intended functionality works as expected