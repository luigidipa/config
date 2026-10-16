local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Colors & font
local mocha = {
  rosewater = "#f5e0dc",
  flamingo = "#f2cdcd",
  pink = "#f5c2e7",
  mauve = "#cba6f7",
  red = "#f38ba8",
  maroon = "#eba0ac",
  peach = "#fab387",
  yellow = "#f9e2af",
  green = "#a6e3a1",
  teal = "#94e2d5",
  sky = "#89dceb",
  sapphire = "#74c7ec",
  blue = "#89b4fa",
  lavender = "#b4befe",
  text = "#cdd6f4",
  subtext1 = "#bac2de",
  subtext0 = "#a6adc8",
  overlay2 = "#9399b2",
  overlay1 = "#7f849c",
  overlay0 = "#6c7086",
  surface2 = "#585b70",
  surface1 = "#45475a",
  surface0 = "#313244",
  base = "#1e1e2e",
  mantle = "#181825",
  crust = "#11111b",
}

config.colors = {
  foreground = mocha.text,
  background = mocha.base,
  cursor_bg = mocha.rosewater,
  cursor_fg = mocha.crust,
  cursor_border = mocha.rosewater,
  selection_fg = mocha.text,
  selection_bg = mocha.surface2,
  scrollbar_thumb = mocha.surface2,
  split = mocha.overlay0,

  ansi = {
    mocha.surface1, -- black
    mocha.red, -- red
    mocha.green, -- green
    mocha.yellow, -- yellow
    mocha.blue, -- blue
    mocha.pink, -- magenta
    mocha.teal, -- cyan
    mocha.subtext1, -- white
  },
  brights = {
    mocha.surface2, -- bright black
    mocha.red, -- bright red
    mocha.green, -- bright green
    mocha.yellow, -- bright yellow
    mocha.blue, -- bright blue
    mocha.pink, -- bright magenta
    mocha.teal, -- bright cyan
    mocha.subtext0, -- bright white
  },
  indexed = {
    [16] = mocha.peach,
    [17] = mocha.rosewater,
  },

  tab_bar = {
    background = mocha.crust,
    active_tab = { bg_color = mocha.mauve, fg_color = mocha.crust, intensity = "Bold" },
    inactive_tab = { bg_color = mocha.surface0, fg_color = mocha.subtext0 },
    inactive_tab_hover = { bg_color = mocha.surface1, fg_color = mocha.text },
    new_tab = { bg_color = mocha.crust, fg_color = mocha.subtext0 },
    new_tab_hover = { bg_color = mocha.surface1, fg_color = mocha.text },
  },
}

config.font = wezterm.font_with_fallback({ "JetBrainsMono Nerd Font", "Menlo" })
config.font_size = 14.0
config.line_height = 1.1
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

-- Window
config.window_background_opacity = 0.93
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.window_padding = { left = 16, right = 16, top = 12, bottom = 8 }
config.initial_cols = 130
config.initial_rows = 36
config.window_close_confirmation = "NeverPrompt"

-- Inactive panes dimmed slightly
config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.7 }

-- Cursor
-- config.default_cursor_style = "BlinkingBar"
-- config.cursor_blink_rate = 600
-- config.cursor_blink_ease_in = "EaseOut"
-- config.cursor_blink_ease_out = "EaseOut"

-- Tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 32
config.show_new_tab_button_in_tab_bar = false

wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
  local title = tab.tab_title
  if not title or #title == 0 then
    title = tab.active_pane.title
  end
  title = wezterm.truncate_right(title, max_width - 6)

  local fg, tab_bg
  if tab.is_active then
    fg, tab_bg = mocha.crust, mocha.mauve
  elseif hover then
    fg, tab_bg = mocha.text, mocha.surface1
  else
    fg, tab_bg = mocha.subtext0, mocha.surface0
  end

  local edge = mocha.crust
  return {
    { Background = { Color = edge } },
    { Foreground = { Color = tab_bg } },
    { Text = "" },
    { Background = { Color = tab_bg } },
    { Foreground = { Color = fg } },
    { Text = " " .. (tab.tab_index + 1) .. " " .. title .. " " },
    { Background = { Color = edge } },
    { Foreground = { Color = tab_bg } },
    { Text = "" },
  }
end)

-- Misc
config.scrollback_lines = 10000
config.audible_bell = "Disabled"
config.animation_fps = 60
config.max_fps = 120
config.front_end = "WebGpu"

return config
