# This is a general guide to what you can mess with in this config

## What this includes (and what it does not)

### Language features

> Supported languages :
> - Lua 
> - Python
> - cpp

- **Completions** 

  - Buffer completions
  - Lsp completions
  - Path completions
  - Snippets

- **Errors/Diagnostics**

  - Inline :
  - Multi-line :
  - Trouble :


- **Highlighting** :

  - Treesitter 

#### How to toggle..

- **Completions**
  - You cant really toggle...

- **Errors/Diagnostics** :
  - Inline - enabled by default Nothing you can do to disable it
  - Multi-line :
    - Comment in `require("nvim.lsp.lines")` If you WANT the Multi-line diagnostics
    - Comment out `require("nvim.lsp.lines")` If you DONT WANT the Multi-line diagnostics
- **Treesitter**:
  - Comment out `require("nvim.plugins.treesitter")` in the `init.lua` 

#### How to add more

- **Completions** AND **Diagnostics** :
  - Run `:Mason` and figure out what LSP you want
  - Add it to the list on line `11` in `lua/nvim/lsp/mason.lua` (IF you have installed an lsp not a formatter etc. etc.)
  - At line `31`, type in the following
  ```lua 
  lspconfig.your_lsp_name.setup({
    capabilities = capabilities,
  })
  ```

- **Treesitter**
  - Add your desired language to the ensure_installed list on
  - line `4` of `lua/nvim/plugins/treesitter.lua`

### File searching

> Supported plugins
> - **telescope.nvim**
> - **oil.nvim**
> - **Neotree.nvim**

- **oil.nvim (filetree)**
- **neotree.nvim (filetree)**
- **telescope.nvim**

