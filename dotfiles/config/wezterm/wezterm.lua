local wezterm = require("wezterm")

return {
	color_scheme = "CustomRoxo",

	colors = {
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
	},
	hide_mouse_cursor_when_typing = false,

	keys = {
		-- Ctrl + Backspace → delete word backward
		{
			key = "Backspace",
			mods = "CTRL",
			action = wezterm.action.SendString("\x17"),
		},
	},

	window_background_opacity = 0.88,
	text_background_opacity = 1.0,

	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",

	font = wezterm.font({
		family = "CaskaydiaCove Nerd Font",
		weight = "Regular",
	}),

	font_size = 10.5,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },

	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,

	-- Unix Domain
	-- unix_domains = {
	-- 	{
	-- 		name = "unix",
	-- 	},
	-- },
	-- default_gui_startup_args = { "connect", "unix" },
}
