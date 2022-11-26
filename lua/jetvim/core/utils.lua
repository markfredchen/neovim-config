jetvim.keymap = function(m, k, v, opt)
  if not opt then
    opt = { silent = ture }
  end
  vim.keymap.set(m, k, v, opt) 
end

jetvim.require_dir = function(dir)
  for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/jetvim/'..dir, [[v:val =~ '\.lua$']])) do
    require('jetvim.'..dir..'.'..file:gsub('%.lua$', ''))
  end
end
