# PyTorch Source Python + C++ NeoVim setup

A fast, batteries-included Neovim config focused on **mixed C++/Python** projects (think: C++ libs, Python front-ends, pybind11/C API, and Jupyter-style iteration). It’s built on top of the Kickstart base but trimmed and tuned for day-to-day systems + scientific work.

## Quick start

```bash
# Backup any old config, then clone this repo as your Neovim config
mv ~/.config/nvim ~/.config/nvim.backup-$(date +%Y%m%d) 2>/dev/null || true
git clone https://github.com/hinriksnaer/nvim ~/.config/nvim

# Start Neovim; plugins will install automatically
nvim
```

> Tip: Run `:Mason` once to see installable tools and `:LspInfo` to confirm LSPs are attached.

## What you get

* **Language Servers (LSP)** via `mason` + `lspconfig`

  * **C++:** `clangd` (semantic indexing, cross-file nav, code actions)
  * **Python:** `pyright` (type checking), optional `ruff-lsp` (fast linting)
* **Formatting & Linting**

  * **C++:** `clang-format` (project-local `.clang-format` respected)
  * **Python:** `black` and/or `ruff` (choose on save)
* **Treesitter** for modern syntax highlighting and structural selection (C, C++, Python, CMake, JSON, TOML, Markdown…)
* **Completion** with `nvim-cmp` (+ snippets)
* **Fuzzy finding** with `telescope` (+ live grep, symbols, diagnostics)
* **Git UX** with inline hunks & blame
* **Debugging** with `nvim-dap`

  * **C/C++:** `codelldb`
  * **Python:** `debugpy`
* **Quality-of-life**

  * which-key hints, better diagnostics, commenting, TODO highlighters, statusline, etc.

> The base kickstart README in this repo was replaced to document these language-specific defaults. (Previously it contained the generic Kickstart install text.) ([GitHub][1])

## Mixed C++ ↔ Python workflows

* **Editing**
  Open both sides of your project; LSPs run per-language. Treesitter and diagnostics work across buffers.

* **Building C++ for Python**
  Use your usual build (CMake/meson) to produce a Python extension (e.g., pybind11). From Neovim:

  * `:make` or your CMake commands in a terminal split
  * Reload your Python module inside a Python REPL/pytest run

* **Debugging**

  * **Python app calling into C++:** Start Python with DAP (`:DapContinue`), then attach C++ with `codelldb` if needed.
  * **Native binary:** Launch with the C++ debug config; breakpoints work as usual.

## Everyday commands

* **Search files / symbols / grep:** `:Telescope find_files`, `:Telescope live_grep`, `:Telescope lsp_document_symbols`
* **LSP:** `gd` (goto def), `gr` (references), `K` (hover), code actions, rename
* **Diagnostics:** `:Telescope diagnostics` or jump via next/prev
* **Format now:** `:Format` (respects language/Project settings)
* **Mason UI:** `:Mason` (manage LSPs/formatters/debuggers)
* **DAP:** `:DapContinue`, `:DapToggleBreakpoint`, `:DapStepOver`

## Troubleshooting

* **No completion / LSP not attached:** `:LspInfo` → check server status; run `:Mason` to install missing tools.
* **Formatter not running:** ensure the tool is installed and project config exists (`.clang-format`, `pyproject.toml`).
* **Debugging fails to start:** verify `codelldb`/`debugpy` are installed and the DAP configuration points to the right program.

## License

MIT (see `LICENSE.md`).
