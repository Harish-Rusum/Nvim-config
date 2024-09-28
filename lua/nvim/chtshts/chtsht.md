> [!Tip] Vim Basics

> Vim operates in multiple modes, each designed for specific tasks.
There are four primary modes in Vim: Normal mode, Insert mode, Visual mode, and Command-line mode.

> [!Tip] Normal Mode

> Normal mode is where you perform motions and actions (sometimes both together). This is the default mode when you open Vim. In this mode, you can navigate through the text using `h`, `j`, `k`, and `l` for left, down, up, and right, respectively, or simply use the arrow keys (which also work in Insert mode).

> [!Tip] Insert Mode

> In Insert mode, you can type text. Press `ESC` to return to Normal mode.

> [!Tip] Visual Mode

> Visual mode is essentially a selection mode. You can move the cursor and apply (some) motions and actions. Press `ESC` to return to Normal mode.

> [!Tip] Command-line Mode

> Command-line mode is used to execute Vim commands. While it might not seem very useful at first, it's crucial for running commands efficiently.

> [!Tip] Vim Motions and Actions

> [!Tip] Vim Motions

> Motions are commands that move the cursor. Examples include `$` (move to the end of the line) and `0` (move to the first character of the line).

> [!Tip] Vim Actions

> An action is a command that modifies text. For example, `x` deletes the character under the cursor. Combining an action with a motion allows you to modify a range of text. For example, `c` (change) followed by a motion deletes the text in the motion's range and puts you into Insert mode.

> [!Tip] Anatomy of **Anything** in Vim

> A motion can be preceded by a count, for example, `2w` moves the cursor to the next word twice. Combining this with an action, like `2cw`, will delete the next two words and put you in Insert mode.

Formally: **COUNT** + **ACTION** + **MOTION**

> [!Tip] Text Objects

> Text objects are recognized blocks of text in Vim. For example, `w` is a word. Text objects can be combined with motions for more complex editing. For instance, `viw` means "visual inside word," which highlights the word under or near the cursor.

> [!Tip] Normal Mode

>>> Movements

- `h` : move left
- `j` : move down
- `k` : move up
- `l` : move right
- `w` : move to the next word
- `b` : move to the previous word
- `0` : move to the beginning of the line
- `$` : move to the end of the line
- `gg` : move to the beginning of the file
- `G` : move to the end of the file
- `e` : move to the end of the word
- `ge` : move to the end of the previous word
- `Ctrl+u` : move half a page up
- `Ctrl+d` : move half a page down

>>> Text Object Helpers

- `i` : inside (used to reference text objects)
- `a` : around (used to reference text objects)

>>> Text Objects

- `w` : word
- `p` : paragraph
- `{` : squiggly braces
- `(` : braces
- `[` : brackets
- `<` : HTML tags
- `"` : double quotes
- `'` : single quotes
- `c` : class (this config specific)

>>> Deletions / Changes

- `c` : change (requires text object)
- `d` : delete (can be used with text objects)
- `cc` : change a line
- `dd` : delete a line
- `x` : delete character under the cursor

>>> Yank and Paste

- `y` : yank (copy)
- `yy` : yank a line
- `p` : paste after the cursor
- `P` : paste before the cursor

>>> Undo and Redo

- `u` : undo
- `Ctrl+r` : redo

> [!Tip] Insert Mode

>>> Enter Insert Mode

- `i` : insert before the cursor
- `I` : insert at the beginning of the line
- `a` : insert after the cursor
- `A` : insert at the end of the line
- `o` : open a new line below and insert
- `O` : open a new line above and insert

>>> Deletion Keybinds

- `Ctrl+w` : delete word under cursor (essentially `diw`)

>>> Quick Switch Keybinds

- `Ctrl+o` : switches to Normal mode for one motion and then back to Insert mode when that motion is executed

> [!Tip] Visual Mode

>>> Visual Mode Enhancements

- `v` : start visual mode
- `V` : start visual line mode
- `Ctrl+v` : start visual block mode
- `o` : move to the other end of the highlighted text

> [!Tip] Command Mode

>>> Basic Commands

- `/` : search for the pattern
- `:` : go to line number
- `%s/pattern/replace-to/` : search and replace

>>> File Commands

- `:w` : save the file
- `:q` : quit Vim
- `:wq` or `:x` : save and quit
- `:q!` : quit without saving
- `:e filename` : open a file
- `:sp filename` : open a file in a new horizontal split
- `:vs filename` : open a file in a new vertical split
