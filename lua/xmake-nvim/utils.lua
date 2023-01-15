local M = {}

function M.check_plenary() 
  local status, _ = pcall(require, 'plenary')
  if not status then
    vim.notify("xmake-nvim depends on pleanry.nvim, please check plenary is installed.", vim.log.levels.ERROR, {})
  end

  return status
end

return M
