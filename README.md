# Indent navigation useful for python and other language.

4 keys defined:
- Jump to previous, next line with the same indent.
- Jump to line above with less indent (ignoring empty lines).
- Jump back to the line with larger intent. Plugin maintains the list of positions, which makes it useful to jump to start of the block / function name and come back to the original place.


Setup for lazy plugin manager:
```lua
  {
    "ivanvolosyuk/python_left",
    keys = {
      { mode = { "v", "n", "i" }, "<M-Right>", "<cmd>call python_left#right()<CR>", "Restore indent" },
      { mode = { "v", "n", "i" }, "<M-Left>", "<cmd> call python_left#left()<CR>", "Decrease indent" },
      { mode = { "v", "n", "i" }, "<M-Up>", "<cmd>call python_left#prev()<CR>", "up, same indent" },
      { mode = { "v", "n", "i" }, "<M-Down>", "<cmd> call python_left#next()<CR>", "down, same indent" },
    },
  }
  ```
