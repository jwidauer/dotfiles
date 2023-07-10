local wezterm = require "wezterm"

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local wsl_domains = wezterm.default_wsl_domains()

if wsl_domains and wsl_domains[1] then
  config.default_domain = wsl_domains[1].name
end

-- Configure color scheme
config.color_scheme = "Google Dark (Gogh)"

-- Configure font
config.font = wezterm.font("CodeNewRoman Nerd Font")
config.font_size = 11.0
config.force_reverse_video_cursor = true
config.line_height = 0.95

-- Configure tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

local bg_color = wezterm.color.get_builtin_schemes()[config.color_scheme].background

local function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  return '[' .. tab_info.tab_index .. ']'
end

wezterm.on(
  'format-tab-title',
  function(tab, _, _, _, _, _)
    local title = { Text = ' ' .. tab_title(tab) .. ' ' }
    if tab.is_active then
      return {
        { Background = { Color = bg_color } },
        title,
      }
    end
    return { title }
  end
)


-- Configure window decorations
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.scrollback_lines = 10000
config.audible_bell = "Disabled"

return config
