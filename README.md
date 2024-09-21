# Table of Contents
1. [Installation](#installation)
   - [Requirements](#requirements)
   - [How To Install](#how-to-install)
   - [Note](#note)
   
2. [Showcase](#showcase)

3. [About](#about)
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

![image](https://github.com/user-attachments/assets/7b663c3b-2512-4785-9a84-6ca923fb8df3)
![image](https://github.com/user-attachments/assets/e8d0a817-92d2-4f04-bfd3-c9ed35aab7be)
![image](https://github.com/user-attachments/assets/8ed73f72-f7b6-42cc-9055-a1359792ddcf)
![image](https://github.com/user-attachments/assets/38726f7f-92d9-4fce-a110-2774620bfe12)
![image](https://github.com/user-attachments/assets/2ddb9b1c-d6b7-48e9-945b-264c0496d9df)
![image](https://github.com/user-attachments/assets/839de997-e240-4039-b6ee-d06776e68012)
![image](https://github.com/user-attachments/assets/479f7e6a-7579-4dcb-b420-90168c188134)
![image](https://github.com/user-attachments/assets/7fdc2020-a03c-41ea-9d5c-51bc88aa667f)
![image](https://github.com/user-attachments/assets/6e0f53a4-733f-4fd2-bd88-f6e9c1bb3909)
![image](https://github.com/user-attachments/assets/d913c1c4-7a2a-4fc9-b188-3e7d9eadc296)
![image](https://github.com/user-attachments/assets/feed77f6-e8be-42f1-8b2e-265a8b6c7dd9)
![image](https://github.com/user-attachments/assets/a51d6161-f64d-46b8-92a6-235534e45a91)
![image](https://github.com/user-attachments/assets/a33a6887-c5a5-4447-9e87-706f438e23c3)
![image](https://github.com/user-attachments/assets/16bb78b5-0c03-40ff-b5ab-957cc18fbad7)
![image](https://github.com/user-attachments/assets/8cbfcdf1-1270-4b1d-8a13-7478d9a16116)
![image](https://github.com/user-attachments/assets/33377e49-eab2-473e-880a-f4d2e62637d6)
![image](https://github.com/user-attachments/assets/562db9f0-4adb-4346-8c8f-6992c4d1eaba)


# About

This config was born out of frustration with lunarvim's lsp system ( https://www.lunarvim.org ), specifically how to use it and remove preconfigured stuff.
I went from not knowing anything about vim (hence the moving from community distro to distro) and i finally just decided to make one myself, for this reason i have tried to make this config as self-explanatory and intuitive as possible with **relatively** good explanations of what everything is doing 
