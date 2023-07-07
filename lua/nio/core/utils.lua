_G.nio = {}

nio.keymap = function(m, k, v, opt)
  if not opt then
    opt = { silent = true }
  end
  vim.keymap.set(m, k, v, opt)
end


nio.requireDir = function(dir)
  for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/nio/'..dir, [[v:val =~ '\.lua$']])) do
    require('nio.'..dir..'.'..file:gsub('%.lua$', ''))
  end

end

nio.setup = function(name, opts)
  local status, m = pcall(require, name)
  if not status then
    return
  end
  if opts then
    m.setup(opts)
  else
    m.setup()
  end
  return m
end
