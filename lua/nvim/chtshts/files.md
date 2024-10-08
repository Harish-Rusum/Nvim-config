[!Tip]  How vim handles files

[!Tip]  Windows, tabs and buffers 

Vim handles files through a combination of **buffers**, **windows**, and **tabs**.

Buffers :
- A buffers is the in-memory text of a file which is loaded into memory for editing.
- Buffers can be empty or contain some text 
- Two windows containing the same file (see below) are both modifying the same buffer.

Windows :
- It is the fullscreen or split view into a buffer (they are like viewports)
- You can have multiple windows into a single buffer (see above) at the same location or a different location
- You can also have multiple windows into multiple buffers.

Tabs:
- Tabs are containers for windows. 
- You can have multiple tabs open, each containing one or more windows. 

**Buffers**
- `:new [file]` will create a split window with an unnamed buffer. (if you do not pass the file arg)
- `:enew [file]` will open one in the current window.
- `:vnew [file]` will open one in a vertically split window.
- `:bnext` will go to the next buffer
- `:bprev` will go to the prev buffer
- `:Telescope buffers` will give you the telescope view of all open buffers
- `:ls` will list all the currently open buffers

**Tabs** 

- `:tabnew` will open a new tab with an unnamed buffer.
- `:tabedit [file]` will open a specific file in a new tab.
- `:tabclose` will close the current tab.
- `:tabonly` will close all other tabs except the current one.
- `:tabnext` or `:tn` will go to the next tab.
- `:tabprevious` or `:tp` will go to the previous tab.
- `:tabs` will list all open tabs and the buffers they contain.
- `:Telescope tabs` will give you the Telescope view of all open tabs (if configured with the `tabs` extension for Telescope).

**Windows**

- `:new` will open a new window with an unnamed buffer.
- `:vnew` will open a new window vertically with an unnamed buffer.
- `:split` or `:sp` will split the current window horizontally.
- `:vsplit` or `:vsp` will split the current window vertically.
- `:close` will close the current window.
- `:only` will close all other windows except the current one.
- `Ctrl-w h` will move to the left window.
- `Ctrl-w j` will move to the window below.
- `Ctrl-w k` will move to the window above.
- `Ctrl-w l` will move to the right window.
