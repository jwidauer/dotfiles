local wezterm = require "wezterm"

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Configure wsl startup when running on Windows
local wsl_domains = wezterm.default_wsl_domains()
if wsl_domains and wsl_domains[1] then
  config.default_domain = wsl_domains[1].name
end

-- Configure keybindings
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }

local act = wezterm.action
config.keys = {
  { key = 'r', mods = 'LEADER', action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = 'd', mods = 'LEADER', action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = false } },
  { key = 'n', mods = 'LEADER', action = act.SpawnTab("CurrentPaneDomain") },
  { key = 'w', mods = 'LEADER', action = act.CloseCurrentTab { confirm = false } },
  { key = '1', mods = 'LEADER', action = act.ActivateTab(0) },
  { key = '2', mods = 'LEADER', action = act.ActivateTab(1) },
  { key = '3', mods = 'LEADER', action = act.ActivateTab(2) },
  { key = '4', mods = 'LEADER', action = act.ActivateTab(3) },
  { key = '5', mods = 'LEADER', action = act.ActivateTab(4) },
  { key = '6', mods = 'LEADER', action = act.ActivateTab(5) },
  { key = '7', mods = 'LEADER', action = act.ActivateTab(6) },
  { key = '8', mods = 'LEADER', action = act.ActivateTab(7) },
  { key = '9', mods = 'LEADER', action = act.ActivateTab(8) },
  { key = '0', mods = 'LEADER', action = act.ActivateTab(9) },
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection("Left") },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection("Down") },
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection("Up") },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection("Right") }
}

-- Configure color scheme
config.color_scheme = "Google Dark (Gogh)"

-- Configure font
config.font_size = 10.0
config.force_reverse_video_cursor = true

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
  return '[' .. (tab_info.tab_index + 1) .. ']'
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
