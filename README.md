# Neovim Configuration for Python, HTML, and CSS

A modern Neovim configuration optimized for Python, HTML, and CSS development with LSP, autocompletion, formatting, linting, debugging, and autosave.

## Features

- **LSP Support**: Pyright (Python), HTML, CSS, Emmet
- **Autocompletion**: nvim-cmp with snippets
- **Syntax Highlighting**: Treesitter
- **Auto-save**: Automatically saves files on changes
- **Formatting**: Black + isort (Python), Prettier (HTML/CSS)
- **Linting**: Ruff (Python)
- **Debugging**: DAP for Python
- **Virtual Environment**: Easy venv selection
- **File Explorer**: nvim-tree
- **Fuzzy Finder**: Telescope
- **Git Integration**: Gitsigns
- **Beautiful UI**: Tokyo Night theme with lualine

## Installation

### 1. Install Required Tools

```bash
# Install Python tools
pip install black isort ruff debugpy

# Install Node.js tools (for Prettier and LSP servers)
sudo pacman -S nodejs npm
npm install -g prettier

# Install ripgrep and fd (for Telescope)
sudo pacman -S ripgrep fd

# Install a Nerd Font for icons
sudo pacman -S ttf-jetbrains-mono-nerd
```

### 2. Launch Neovim

```bash
nvim
```

On first launch:
- lazy.nvim will automatically install all plugins
- Mason will install LSP servers (pyright, html, cssls, emmet_ls)
- Treesitter will install syntax parsers

This may take a few minutes. Wait for everything to complete.

### 3. Verify Installation

After installation completes, restart Neovim:
```bash
nvim
```

Check Mason installation status:
```
:Mason
```

All servers should show a ✓ symbol.

## Key Bindings

### General
- `,` - Leader key
- `<leader>w` (`,w`) - Save file
- `<leader>q` - Quit
- `<leader>nh` - Clear search highlights

### File Explorer (nvim-tree)
- `<leader>e` - Toggle file explorer
- `<leader>ef` - Find current file in explorer

### Fuzzy Finder (Telescope)
- `<leader>ff` - Find files
- `<leader>fr` - Recent files
- `<leader>fs` - Search string in project
- `<leader>fc` - Search word under cursor
- `<leader>fb` - Find buffers

### LSP
- `gd` - Go to definition
- `gr` - Show references
- `K` - Show hover documentation
- `<leader>ca` - Code action
- `<leader>rn` - Rename symbol
- `<leader>d` - Show diagnostics
- `[d` / `]d` - Previous/next diagnostic

### Formatting & Linting
- `<leader>mp` - Format file
- `<leader>l` - Lint file

### Python Virtual Environment
- `<leader>vs` - Select virtual environment

### Debugging
- `<leader>db` - Toggle breakpoint
- `<leader>dc` - Continue/Start debugging
- `<leader>di` - Step into
- `<leader>do` - Step over
- `<leader>dO` - Step out
- `<leader>dt` - Terminate debugging

### Window Management
- `<leader>sv` - Split vertically
- `<leader>sh` - Split horizontally
- `<C-h/j/k/l>` - Navigate between splits

### Buffer Navigation
- `<Tab>` - Next buffer
- `<Shift-Tab>` - Previous buffer
- `<leader>bd` - Delete buffer

### Git
- `]c` / `[c` - Next/previous change
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk

### Comments
- `gcc` - Toggle line comment
- `gbc` - Toggle block comment
- In visual mode: `gc` - Toggle comment

## Auto-save

Files are automatically saved:
- When leaving insert mode
- After text changes (with 1 second debounce)
- When losing focus
- When leaving buffer

You'll see a notification in the bottom right when files are auto-saved.

## Python Workflow

1. Open your Python project
2. Select virtual environment: `<leader>vs`
3. LSP will provide completions, diagnostics, and hover info
4. Format on save is enabled automatically
5. Set breakpoints and debug with `<leader>db` and `<leader>dc`

## HTML/CSS Workflow

1. Emmet abbreviations work out of the box
2. Type an abbreviation and press `<Tab>` to expand
3. Prettier formats on save
4. LSP provides completions and validation

## Customization

Edit files in `~/.config/nvim/lua/plugins/` to customize:
- `lsp.lua` - LSP configuration
- `python.lua` - Python-specific settings
- `utils.lua` - Utilities and autosave
- `colorscheme.lua` - Theme
- `options.lua` - Editor options
- `keymaps.lua` - Key bindings

## Troubleshooting

### LSP not working
```
:Mason
```
Check if servers are installed. If not, install manually: `:MasonInstall pyright html cssls emmet_ls`

### Python debugger not working
```bash
pip install debugpy
```

### Formatter not working
```bash
pip install black isort
npm install -g prettier
```

## Learning Resources

- Type `,` and wait to see available keybindings (which-key)
- `:Telescope keymaps` - See all keybindings
- `:checkhealth` - Check for issues
- `:help <plugin-name>` - Get help for any plugin
