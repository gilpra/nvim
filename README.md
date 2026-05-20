# Neovim config — revised for Nvim 0.12.4

This version is adjusted for Neovim 0.12.4 and current APIs.

## Important changes

- `nvim-treesitter` uses the `main` branch and the new `setup()` / `install()` API.
- Treesitter is not lazy-loaded; it uses `lazy = false` and `build = ":TSUpdate"`.
- Treesitter parsers include the languages used by this config plus Neovim config/query parsers.
- The old `ensure_installed` option and manual `.so` parser detection were removed.
- Mason uses the current `mason-org` repositories.
- `mason-lspconfig` installs the configured LSP servers, while this config explicitly calls `vim.lsp.config()` and `vim.lsp.enable()`.
- `automatic_enable = false` avoids duplicate/implicit LSP enablement.
- The HTML-specific `snippetSupport = false` override was removed so Blink can advertise snippet support normally.
- Conform uses a 1-second save timeout and checks the actual file size before formatting.
- `<leader>cf` formats the current buffer asynchronously.

## External tools

Conform does not install formatters itself. Make sure these are available through Mason/system PATH as appropriate:

- `stylua`
- `black`
- `shfmt`
- `prettier`
- `clang-format`

Treesitter `main` also requires the `tree-sitter` CLI (>= 0.26.1), `curl`, `tar`, and a C compiler.

## First launch

After replacing your config, start Neovim and run:

```vim
:Lazy sync
:checkhealth
:checkhealth nvim-treesitter
:checkhealth mason
:checkhealth vim.lsp
```

If parsers are missing, `nvim-treesitter` will request their installation through its `install()` API. `:TSUpdate` updates installed parsers to versions compatible with the plugin.

## Notes

This config intentionally keeps the original UI, keymaps, plugins, and custom Monochrome theme rather than turning it into a distribution-style configuration.
