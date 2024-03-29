local status_dash, dashboard = pcall(require, "alpha.themes.dashboard")
if not status_dash then
  print("alpha dashboard not ready")
  return
end

local button = function(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt,keybind, keybind_opts)
  b.opts.hl_shortcut = "Include"
  return b
end

dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
   button("f", nio.ui.icons.alpha.FindFile .. "  Find File", ":Telescope find_files<CR>"),
   button("p", nio.ui.icons.alpha.Project .. "  Projects ", "<CMD>Telescope project<CR>"),
   button("t", nio.ui.icons.alpha.FindText .. "  Find Text", "<CMD>Telescope live_grep<CR>"),
   button("c", nio.ui.icons.alpha.Gear .. "  Configuration", "<CMD>edit ~/.config/nvim/<CR>"),
}
local handle = io.popen('fortune')
if not handle then
  return
end
local fortune = handle:read("*a")
handle:close()
dashboard.section.footer.val = fortune

dashboard.config.opts.noautocmd = true

require("alpha").setup(dashboard.config)
