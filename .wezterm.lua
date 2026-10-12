local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Colors & font
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback({ "JetBrainsMono Nerd Font", "Menlo" })
config.font_size = 15.0
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
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 600
config.cursor_blink_ease_in = "EaseOut"
config.cursor_blink_ease_out = "EaseOut"

-- Tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 32
config.show_new_tab_button_in_tab_bar = false

local bg = "#1e1e2e"
local active_bg = "#cba6f7"
local inactive_bg = "#313244"

config.colors = {
  tab_bar = {
    background = "#11111b",
    active_tab = { bg_color = active_bg, fg_color = bg, intensity = "Bold" },
    inactive_tab = { bg_color = inactive_bg, fg_color = "#a6adc8" },
    inactive_tab_hover = { bg_color = "#45475a", fg_color = "#cdd6f4" },
    new_tab = { bg_color = "#11111b", fg_color = "#a6adc8" },
    new_tab_hover = { bg_color = "#45475a", fg_color = "#cdd6f4" },
  },
}

wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
  local title = tab.tab_title
  if not title or #title == 0 then
    title = tab.active_pane.title
  end
  title = wezterm.truncate_right(title, max_width - 6)

  local fg, tab_bg
  if tab.is_active then
    fg, tab_bg = bg, active_bg
  elseif hover then
    fg, tab_bg = "#cdd6f4", "#45475a"
  else
    fg, tab_bg = "#a6adc8", inactive_bg
  end

  local edge = "#11111b"
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
