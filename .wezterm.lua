local wezterm = require("wezterm")
local config = {}
config.term = "xterm-256color"

-- Catppuccin Theme (Auto Dark/Light)
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

-- Font Configuration
config.font = wezterm.font("Hack Nerd Font", { weight = "Regular" })

-- PowerShell 7 as Default
config.default_prog = { "pwsh.exe" }

-- Launch Menu
local vs_root = "C:\\Program Files\\Microsoft Visual Studio\\2022"
-- Adjust the edition below if needed (Community / Professional / Enterprise)
local vs_edition = "Community"
local vs_tools = vs_root .. "\\" .. vs_edition .. "\\VC\\Auxiliary\\Build"
local vs_common = vs_root .. "\\" .. vs_edition .. "\\Common7\\Tools"

config.launch_menu = {
	{ label = "WSL2", args = { "wsl.exe" } },
	{
		label = "VS 2022 - Developer PowerShell",
		args = {
			"pwsh.exe", "-NoExit",
			"-Command",
			"& { Import-Module \"" .. vs_root .. "\\" .. vs_edition .. "\\Common7\\Tools\\Microsoft.VisualStudio.DevShell.dll\"; Enter-VsDevShell -VsInstallPath \"" .. vs_root .. "\\" .. vs_edition .. "\" -SkipAutomaticLocation -DevCmdArguments '-arch=x64 -host_arch=x64' }",
		},
	},
	{
		label = "VS 2022 - Developer Command Prompt",
		args = { "cmd.exe", "/k", vs_common .. "\\VsDevCmd.bat" },
	},
	{
		label = "VS 2022 - x64 Native Tools",
		args = { "cmd.exe", "/k", vs_tools .. "\\vcvars64.bat" },
	},
}

-- Tmux-like Keybindings
local act = wezterm.action
config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "%", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "1", mods = "LEADER", action = act.ActivateTab(0) },
	{ key = "2", mods = "LEADER", action = act.ActivateTab(1) },
	{ key = "3", mods = "LEADER", action = act.ActivateTab(2) },
	{ key = "4", mods = "LEADER", action = act.ActivateTab(3) },
	{ key = "5", mods = "LEADER", action = act.ActivateTab(4) },
	{ key = "6", mods = "LEADER", action = act.ActivateTab(5) },
	{ key = "7", mods = "LEADER", action = act.ActivateTab(6) },
	{ key = "8", mods = "LEADER", action = act.ActivateTab(7) },
	{ key = "9", mods = "LEADER", action = act.ActivateTab(8) },
	{ key = "0", mods = "LEADER", action = act.ActivateTab(9) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
}
config.key_tables = {
	copy_mode = {
		{ key = "y", action = act.CopyTo("ClipboardAndPrimarySelection") },
		{ key = "Escape", action = act.CopyMode("Close") },
	},
}
return config
