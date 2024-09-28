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
    - ![image](https://github.com/user-attachments/assets/f5a6ae87-8594-4249-9e2d-a5399db2a364)
  - Multi-line :
    - ![image](https://github.com/user-attachments/assets/60b1e07f-5cb1-4b8f-b40c-5614c3d0b685)
  - Trouble :
    - ![image](https://github.com/user-attachments/assets/1485d227-c4ad-4c14-ae8b-181acceb8de0)

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
> - **yazi.nvim**
> - **telescope.nvim**
> - **oil.nvim**
> - **Neotree.nvim**

- **yai.nvim**
  -  ![image](https://github.com/user-attachments/assets/60120c44-936b-4e88-8ce3-83335b0ef88d)

- **oil.nvim (filetree)**
  - ![image](https://github.com/user-attachments/assets/808527bf-e216-4030-b6da-b323544a319e)

- **neotree.nvim (filetree)**
  - ![image](https://github.com/user-attachments/assets/ee3a5222-fcb6-4800-90c3-92e7813a6df5)

- **telescope.nvim**
  - ![image](https://github.com/user-attachments/assets/63dddecf-585b-4b78-8709-5b02f1160b3b)

