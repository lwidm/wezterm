# lukwidmer WezTerm setup
This wezterm config file is ment to mimik my Tmux setup so i can use a similar multiplexer on windows. The main difference in keyboard shortcuts is that the LEADER is `Shift+<Space>` instead of `Ctrl+<Space>`

For a WezTerm refernce guide refer to the [wezterm website](https://wezterm.org/config/lua/general.html)

## Installation / Setup
- install Powershell7 and configure (setup see [other github repo](https://github.com/lwidm/powershell-profile))
- run `winget install wez.wezterm`
- Download [.wezterm.lua](./.wezterm.lua) and copy it to your home directory

## Configuration description
- Theme: Catppuccin Mocha
- opacity enabled
- use Powershell 7
- Similar Keybinds to tmux (with `Shift+<Space>` as LEADER)
