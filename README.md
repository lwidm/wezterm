# lukwidmer WezTerm setup
This wezterm config file is ment to mimik my Tmux setup so i can use a similar terminal multiplexer on windows using PowerShell. The main difference in keyboard shortcuts is that the LEADER is `Shift+<Space>` instead of `Ctrl+<Space>`

For a WezTerm refernce guide refer to the [wezterm website](https://wezterm.org/config/lua/general.html)

## Installation / Setup
- install PowerShell 7 and configure its profile (setup see [my github repo for powershell-profile](https://github.com/lwidm/powershell-profile))
- To insteall WezTerm run 
   ```PowerShell
   winget install wez.wezterm
   ```
- Download [.wezterm.lua](./.wezterm.lua?raw=true) and copy it to your home directory.
  **Warning**: The filename has to match exactly including the `.` at the beginning. Firefox tends to remove this dot when downloading so ensure that the filename is unchanged.

## Configuration description
- Theme: Catppuccin Mocha
- opacity enabled
- use PowerShell 7
- Similar Keybinds to tmux (with `Shift+<Space>` as LEADER)
