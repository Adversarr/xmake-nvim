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

function M.get_containing_path()
  local info = debug.getinfo(1,'S');
  return string.sub(info.source, 2, -25)
end

function M.get_internal_xmake_script_path(name)
  if string.sub(name, -4) ~= '.lua' then
    name = name .. '.lua'
  end
  return M.get_containing_path() .. 'asset/' .. name
end

function M.get_xmake_job(opts)
  opts.command = opts.command or require('xmake-nvim.config').get('xmake_executable_path')
  return require('plenary.job'):new(opts)
end

function M.debug_xmake_lua(name)
  local Job = require('plenary.job')
  if string.sub(name, -4) ~= '.lua' then
    name = name .. '.lua'
    print(name)
  end

  Job:new {
    command = 'xmake',
    envs = {
      "XMAKE_THEME=plain"
    },
    args = {
      'lua', M.get_internal_xmake_script_path(name)
    },
    on_stdout = function(j, d, e)
      print(d)
    end,
  }:sync()
end


return M
