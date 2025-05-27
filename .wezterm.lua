local wezterm = require("wezterm")

-- Initialize config
-- local config = wezterm.config_builder()
local config = {}
-- config.term = "xterm-256color"
config.term = 'wezterm'

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
config.default_prog = { "pwsh.exe" } -- 'pwsh' is the PowerShell 7 executable

-- Tmux-like Keybindings
local act = wezterm.action

config.leader = { key = " ", mods = "SHIFT", timeout_milliseconds = 1000 }

config.keys = {
	-- Send Ctrl-Space through by pressing it twice
	-- { key = " ", mods = "CTRL", action = act.SendKey { key = " ", mods = "CTRL" } },
	{ key = " ", mods = "SHIFT", action = act.SendKey({ key = " ", mods = "SHIFT" }) },

	-- Split panes (tmux style)
	{ key = "%", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Pane navigation
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	-- Tab management
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },

	-- Jump to specific pane by index (e.g., Ctrl-Space + 1 for first pane)
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

	-- Close pane
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

	-- Copy mode
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
}
config.key_tables = {
	copy_mode = {
		{ key = "y", action = act.CopyTo("ClipboardAndPrimarySelection") }, -- Yank selection
		{ key = "Escape", action = act.CopyMode("Close") }, -- Exit copy mode
	},
}

return config
