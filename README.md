# Table of Contents
1. [Installation](#installation)
   - [Requirements](#requirements)
   - [How To Install](#how-to-install)
   - [Note](#note)
   - [Credits](#credits)

2. [Showcase](#showcase)

3. [About](#about)

4. See [How to build on the config](lua/nvim/chtshts/general.md)

# Installation

## Requirements
-  git
- stylua (mason)
- ripgrep (by package manager of choice)
- xclip (by package manager of choice)
- Yazi (File manager, https://yazi-rs.github.io/docs/installation)
- A gemini/claude/anthropic/openai api key. (For the ai features), It is set to gemini by default but if you want to change it:
- "~/.local/share/nvim/lazy/avante.nvim/lua/avante/config.lua" Change the provider on line `13` to whatever you want

## How To Install:
<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/Harish-Rusum/Nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone https://github.com/Harish-Rusum/Nvim-config.git "%localappdata%\nvim"
```

If you're using `powershell.exe`

```
git clone https://github.com/Harish-Rusum/Nivm-config.git "${env:LOCALAPPDATA}\nvim"
```

</details>


# Credits

Huge thanks to a lot of the below mentioned people for their config videos and github repos
> - Typecraft - https://www.youtube.com/@typecraft_dev
> - Coding with sphere - https://www.youtube.com/@codingwithsphere
> - ThePrimeagen - https://www.youtube.com/c/theprimeagen
> - TJDevries - https://www.youtube.com/c/tjdevries
> - Chris@Machine - https://www.youtube.com/@chrisatmachine 

# About

This configuration was created out of frustration with LunarVim's LSP system (https://www.lunarvim.org), particularly regarding how to use it and remove the preconfigured settings. It's important to note that LunarVim is excellent; my frustration came from not fully understanding how to navigate its features. I started with no knowledge of Vim, which led me to switch between various community distributions. Ultimately, I decided to create my own setup. As a result, I aimed to make this configuration as self-explanatory and intuitive as possible, providing relatively clear explanations for each component.
