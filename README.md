# Installation

## Requirements
-  git
- mypy (mason)
- black (mason)
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
### Note : Be sure to clear your `undo` folder once cloning and do it once in a while. This dir is used to save changes so that you can open a file, Write and Quit, Open the file again and be able to undo the changes.

# Showcase


![image](https://github.com/user-attachments/assets/78340391-ad61-48f8-9cd1-5ae14a4e7ac2)

![image](https://github.com/user-attachments/assets/7c84d279-e2c3-4d5f-8f69-afd9aedb3761)

![image](https://github.com/user-attachments/assets/4e9b4c89-a7a3-43e1-a0ec-363c7454870d)

![image](https://github.com/user-attachments/assets/31b2e353-7f52-475f-a26e-0345fe75062a)

![image](https://github.com/user-attachments/assets/adfea70c-83e4-47b9-8c2e-d5dc22c97a45)

![image](https://github.com/user-attachments/assets/454cbda4-2580-403d-87e1-23ae8121b029)

![image](https://github.com/user-attachments/assets/820f827b-aa8b-44a0-a296-10ebbe2c6fe5)

![image](https://github.com/user-attachments/assets/41f305a0-6b76-4701-b1a8-7c15c395474c)

![image](https://github.com/user-attachments/assets/5e5b0b19-ce83-4b6c-9c3d-0315e62cf731)

# About

This config was born out of frustration with lunarvim's lsp system ( https://www.lunarvim.org ), specifically how to use it and remove preconfigured stuff.
I went from not knowing anything about vim (hence the moving from community distro to distro) and i finally just decided to make one myself, for this reason i have tried to make this config as self-explanatory and intuitive as possible with **relatively** good explanations of what everything is doing 
