# Vim Cheat Sheet

## Modes

Default mode is Normal. You cannot type in this mode. Type i to go to Insert mode (where you type).  
To go from Insert to Normal, type ESC. From Normal, you can type : to go to Command mode.

## Motions

Motions are things that change text inside your editor.  
Some examples are y (yank which means copy), x (delete character under cursor), and p (paste).  
Motions can be prepended with a count like 10x means delete the ten characters that appear after the cursor.  
Motions can also be prepended with more motions; for example, dd means delete line.  
Everything you will learn henceforth are motions to manipulate text.

## Text Objects

Text objects are things that are recognized in Vim as a block of code. For example, the text object w means word.  
We can use text objects to pass them to other motions to perform changes on, for example viw means visual (v is also a motion) inside (i is usually used to reference a text object) and the text object w (word).  
This will highlight the word under the cursor or the nearest word if the cursor is not on a word.


## Normal Mode

### Movements

- h : move left
- j : move down
- k : move up
- l : move right
- w : move to next word
- b : move to previous word
- 0 : move to the beginning of the line
- $ : move to the end of the line
- gg : move to the beginning of the file
- G : move to the end of the file
- e : move to the end of the word
- ge : move to the end of the previous word
- Ctrl+u : move half a page up
- Ctrl+d : move half a page down

### Text Object Helpers

- i : inside (used to reference text objects)
- a : around (used to reference text objects)

### Text Objects

- w : word
- p : paragraph
- { : squiggly braces
- ( : braces
- [ : brackets
- < : HTML tags
- " : double quotes
- ' : single quotes
- c : class (This config specific)
- s : sentence (This config specific)
- t : inner tag (This config specific)

### Deletions / Changing

- c : change (requires text object)
- d : delete (can be used with text objects)
- cc : change a line
- dd : delete a line
- x : delete character under the cursor

### Yank and Paste

- y : yank (copy)
- yy : yank a line
- p : paste after the cursor
- P : paste before the cursor

### Undo and Redo

- u : undo
- Ctrl+r : redo


## Insert Mode

### Enter Insert Mode

- i : insert before the cursor
- I : insert at the beginning of the line
- a : insert after the cursor
- A : insert at the end of the line
- o : open a new line below and insert
- O : open a new line above and insert

### Deletion Keybinds

- Ctrl+w : delete word under cursor (essentially diw)

### Quick Switch Keybinds

- Ctrl+o : switches to Normal mode for one motion and then back to Insert mode when that motion is executed


## Visual Mode

### Visual Mode Enhancements

- v : start visual mode
- V : start visual line mode
- Ctrl+v : start visual block mode
- o : move to the other end of the highlighted text


## Command Mode

### Basic Commands

- :w : save the file
- :q : quit Vim
- :wq or :x : save and quit
- :q! : quit without saving
- :e filename : open a file
- :sp filename : open a file in a new horizontal split
- :vs filename : open a file in a new vertical split
