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
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
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

### Note : 
Be sure to clear your `undo` folder once cloning and do it once in a while. This dir is used to save changes so that you can open a file, Write and Quit, Open the file again and be able to undo the changes. AND Update the filepath to your undodir on line `40` of `lua/nvim/general/settings.lua`. You also need to change line `4` in `lua/nvim/git/octohub.lua`. If you have an authenticated `gh` then when you open a repo using octohub.nvim, it will clone the projects into the dir specified in line 4 (`~/Projects` by default).

# Showcase
![image](https://github.com/user-attachments/assets/d70fa5ee-cde8-47ae-a731-776897612c24)
![image](https://github.com/user-attachments/assets/50b9a8fc-4343-4973-8bfe-7a7b9a778b6a)
![image](https://github.com/user-attachments/assets/9f974da1-9cc3-4bd3-9fdf-8272a5d8c0be)
![image](https://github.com/user-attachments/assets/56533822-1955-4ab3-b8e0-b6637f505d97)
![image](https://github.com/user-attachments/assets/56f0c63d-d8b1-4be8-aa28-c0d60da2bf40)
![image](https://github.com/user-attachments/assets/02bbccda-4b3a-47e7-ba94-8ce2aabe7230)
![image](https://github.com/user-attachments/assets/5411b98d-1ed1-48e1-a3ff-d5e48ee107a8)
![image](https://github.com/user-attachments/assets/b64a04a9-ac35-403b-91c1-1cd65187b76b)
![image](https://github.com/user-attachments/assets/88093ce2-62de-47f8-b8d6-362f9821dc3c)
![image](https://github.com/user-attachments/assets/74dae176-cc44-40b5-bdf2-52445a1818b1)
![image](https://github.com/user-attachments/assets/12928a70-57f0-4958-b46b-68a098920b58)


# Credits

Huge thanks to a lot of the below mentioned people for their config videos and github repos
> - Typecraft - https://www.youtube.com/@typecraft_dev
> - Coding with sphere - https://www.youtube.com/@codingwithsphere
> - ThePrimeagen - https://www.youtube.com/c/theprimeagen
> - TJDevries - https://www.youtube.com/c/tjdevries
> - Chris@Machine - https://www.youtube.com/@chrisatmachine 

# About

This configuration was created out of frustration with LunarVim's LSP system (https://www.lunarvim.org), particularly regarding how to use it and remove the preconfigured settings. It's important to note that LunarVim is excellent; my frustration came from not fully understanding how to navigate its features. I started with no knowledge of Vim, which led me to switch between various community distributions. Ultimately, I decided to create my own setup. As a result, I aimed to make this configuration as self-explanatory and intuitive as possible, providing relatively clear explanations for each component.
