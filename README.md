# Table of Contents
1. [Installation](#installation)
   - [Requirements](#requirements)
   - [How To Install](#how-to-install)
   - [Credits](#credits)

2. [Showcase](#showcase)

3. [About](#about)

4. See [How to build on the config](lua/nvim/chtshts/general.md)

# Installation

## Requirements
-  git
-  fd (for telecsope find files)
- stylua (mason)
- ripgrep (by package manager of choice)
- xclip (by package manager of choice)
- Yazi (File manager, https://yazi-rs.github.io/docs/installation)
- A github acount (for "copilot auth")

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

# Showcase
## Transparent terminal background
![2025-02-22-212542_hyprshot](https://github.com/user-attachments/assets/de7c50be-d348-4eba-9b31-c55ee13b1362)
![2025-02-22-212941_hyprshot](https://github.com/user-attachments/assets/93474257-db96-49e0-8b35-db6caef14fbd)
![2025-02-22-213006_hyprshot](https://github.com/user-attachments/assets/06afc604-3f90-4c2d-a363-25076b460181)
![2025-02-22-213038_hyprshot](https://github.com/user-attachments/assets/b6964d0b-38af-41ce-93f8-24e42f9496d4)
## Non transparent terminal background
![2025-02-22-213554_hyprshot](https://github.com/user-attachments/assets/8f180eee-68f4-427c-9ee6-a1bfdaeb660e)
![2025-02-22-213527_hyprshot](https://github.com/user-attachments/assets/ae22bc4b-c11e-4da4-b0d6-d46b07aee4b9)
![2025-02-22-213455_hyprshot](https://github.com/user-attachments/assets/a45f68dd-2954-43c6-8c93-c0d374d39ccf)
![2025-02-22-213354_hyprshot](https://github.com/user-attachments/assets/eb2c39d4-84eb-4e42-ac66-e9446bcbc70e)



# Credits

Huge thanks to a lot of the below mentioned people for their config videos and github repos
> - Typecraft - https://www.youtube.com/@typecraft_dev
> - Coding with sphere - https://www.youtube.com/@codingwithsphere
> - ThePrimeagen - https://www.youtube.com/c/theprimeagen
> - TJDevries - https://www.youtube.com/c/tjdevries
> - Chris@Machine - https://www.youtube.com/@chrisatmachine 

# About

This configuration was created out of frustration with LunarVim's LSP system (https://www.lunarvim.org), particularly regarding how to use it and remove the preconfigured settings. It's important to note that LunarVim is excellent; my frustration came from not fully understanding how to navigate its features. I started with no knowledge of Vim, which led me to switch between various community distributions. Ultimately, I decided to create my own setup. As a result, I aimed to make this configuration as self-explanatory and intuitive as possible, providing relatively clear explanations for each component.
