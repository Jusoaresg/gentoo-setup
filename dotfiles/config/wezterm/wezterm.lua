local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.colors = {
	background = "#000000",
	foreground = "#d1d5db",

	cursor_bg = "#7c3aed",
	cursor_fg = "#0b0b0f",
	cursor_border = "#7c3aed",

	selection_bg = "#2e1065",
	selection_fg = "#e5e7eb",

	ansi = {
		"#0b0b0f", -- black
		"#b91c1c", -- red (menos saturado)
		"#22c55e", -- green
		"#eab308", -- yellow
		"#2563eb", -- blue
		"#7c3aed", -- magenta (roxo mais contido)
		"#0891b2", -- cyan
		"#d1d5db", -- white
	},

	brights = {
		"#1f2933",
		"#ef4444",
		"#4ade80",
		"#fde047",
		"#60a5fa",
		"#8b5cf6",
		"#67e8f9",
		"#ffffff",
	},
}
config.hide_mouse_cursor_when_typing = false

config.keys = {
	{
		key = "Backspace",
		mods = "CTRL",
		action = wezterm.action.SendString("\x17"),
	},
}

config.window_background_opacity = 0.88
config.text_background_opacity = 1.0

config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

config.font = wezterm.font({
	family = "CaskaydiaCove Nerd Font",
	weight = "Regular",
})

config.font_size = 10.5
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

return config
