local status, alpha = pcall(require, "alpha")
if not status then
  return
end

local dashboard_status, dashboard = pcall(require, "alpha.themes.dashboard")
if not dashboard_status then
  return
end

alpha.setup(dashboard.config)
