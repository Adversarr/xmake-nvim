local M = {}

-- Logger:
function M.notify(message, level)
  local config_level = require('xmake-nvim.config').get('log_level')
  if level < config_level then
    return
  end
  vim.notify(message, level, {title = 'xmake-nvim'})
end

function M.info(message)
  M.notify(message, vim.log.levels.INFO)
end

function M.warn(message)
  M.notify(message, vim.log.levels.WARN)
end

function M.debug(message)
  M.notify(message, vim.log.levels.DEBUG)
end

function M.error(message)
  M.notify(message, vim.log.levels.ERROR)
end

-- Plenary check
function M.check_plenary() 
  local status, _ = pcall(require, 'plenary')
  if not status then
    vim.notify("xmake-nvim depends on pleanry.nvim, please check plenary is installed.", vim.log.levels.ERROR, {})
  end

  return status
end


return M
