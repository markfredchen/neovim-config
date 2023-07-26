_G.edge = {}

edge.keymap = function(mode, key, binding, opt)
  if not opt then
    opt = { silent = true }
  end
  vim.keymap.set(mode, key, binding, opt)
end

edge.requireDir = function(dir)
  for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/edgenvim/'..dir, [[v:val =~ '\.lua$']])) do
    require('nio.'..dir..'.'..file:gsub('%.lua$', ''))
  end
end

