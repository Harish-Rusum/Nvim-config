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
windows : 
```
git clone https://www.github.com/Harish-Rusum/nvim-config/ $env:LOCALAPPDATA\nvim 
```

mac/linux
```
git clone https://www.github.com/Harish-Rusum/nvim-config/ ~/.config/nvim
```
### Note : Be sure to clear your `undo` folder once cloning and do it once in a while. This dir is used to save changes so that you can open a file, Write and Quit, Open the file again and be able to undo the changes. AND Update the filepath to your undodir on line `40` of `lua/nvim/general/settings.lua`. You also need to change line `4` in `lua/nvim/git/octohub.lua`. If you have an authenticated `gh` then when you open a repo using octohub.nvim, it will clone the projects into the dir specified in line 4 (`~/Projects` by default).

# Showcase

# My neovim VS Base Nvchad (Mine left, nvchad right)
![image](https://github.com/user-attachments/assets/f995078b-b0b3-4b2c-9a1e-7e111bd147da)
![image](https://github.com/user-attachments/assets/abdcf268-b429-4cd0-b317-197950e8ac7d)
![image](https://github.com/user-attachments/assets/33f6a108-bec1-46b7-abe1-d72dfe466431)
![image](https://github.com/user-attachments/assets/2db789b1-f944-4aff-b9cc-9a9e06654252)
![image](https://github.com/user-attachments/assets/34239bc9-8469-4e9f-b5b6-9fa3b9651c71)
![image](https://github.com/user-attachments/assets/353b151e-2a3c-490d-ba8a-23b81b0005b6)
![image](https://github.com/user-attachments/assets/f955af4d-ca07-40d0-ae7c-3c1ae9d8309a)
![image](https://github.com/user-attachments/assets/68012e24-f7cd-49c5-9e6d-35963e1feb6c)
![image](https://github.com/user-attachments/assets/5b12c2dc-130c-49e2-8b5d-77ac09be22c8)

# Credits

Huge thanks to a lot of the below mentioned people for their config videos and github repos
> - Typecraft - https://www.youtube.com/@typecraft_dev
> - Coding with sphere - https://www.youtube.com/@codingwithsphere
> - ThePrimeagen - https://www.youtube.com/c/theprimeagen
> - TJDevries - https://www.youtube.com/c/tjdevries
> - Chris@Machine - https://www.youtube.com/@chrisatmachine 

# About

This config was born out of frustration with lunarvim's lsp system ( https://www.lunarvim.org ), specifically how to use it and remove preconfigured stuff.
Note : LunarVim is REALLY good and my frustration stemmed from not understanding how to do things in it thats all.
I went from not knowing anything about vim (hence the moving from community distro to distro) and i finally just decided to make one myself, for this reason i have tried to make this config as self-explanatory and intuitive as possible with **relatively** good explanations of what everything is doing 
