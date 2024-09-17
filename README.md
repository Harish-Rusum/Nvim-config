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


![image](https://github.com/user-attachments/assets/57b0d2ba-77d7-489d-a6f9-540f2eec5429)
![image](https://github.com/user-attachments/assets/ddcc2c9e-7216-40d6-b72b-e37e6d9066e1)
![image](https://github.com/user-attachments/assets/0cbb8f99-2f11-4c60-9653-19d925b039d5)
![image](https://github.com/user-attachments/assets/4e15547c-4d77-4235-98cd-b4f9293920fa)
![image](https://github.com/user-attachments/assets/6de89b1e-4ac4-4305-baf0-40df714cab82)
![image](https://github.com/user-attachments/assets/ec648f34-bf2b-4a8e-a4f4-a692b17a438c)
![image](https://github.com/user-attachments/assets/290efd2a-b012-43a5-8dc3-5c5cc2d955e6)
![image](https://github.com/user-attachments/assets/a825b83e-896f-4009-a96b-0c4273721a83)
![image](https://github.com/user-attachments/assets/2e952b86-e07e-4fd7-a027-2751663a53aa)
![image](https://github.com/user-attachments/assets/70bc585c-bdcb-4bdb-b025-8f2d486fb8d3)
![image](https://github.com/user-attachments/assets/64671655-11b7-4cdc-8278-60ba642d8fea)
![image](https://github.com/user-attachments/assets/02c099df-812a-403c-9177-4a3bf30c26d9)
![image](https://github.com/user-attachments/assets/2b4e3491-c611-4ebc-b585-e3a1287dfd42)

# About

This config was born out of frustration with lunarvim's lsp system ( https://www.lunarvim.org ), specifically how to use it and remove preconfigured stuff.
I went from not knowing anything about vim (hence the moving from community distro to distro) and i finally just decided to make one myself, for this reason i have tried to make this config as self-explanatory and intuitive as possible with **relatively** good explanations of what everything is doing 
