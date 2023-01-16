local M = {
  info = nil
}

function M.update_info()
  local config = require('xmake-nvim.config').get()
  local utils = require 'xmake-nvim.utils'
  local au = require 'xmake-nvim.details.autocmds'
  local output = ''
  local has_error = false

  au.exec(au.config.config_load_pre)
  local job = utils.get_xmake_job {
    args = {
      'lua',
      utils.get_internal_xmake_script_path('project_config')
    },
    on_stdout = function(j, data, except)
      output = output .. data
    end,
    on_stderr = function(_, data, _)
      has_error = true
    end,
  }
  job:sync()
  if output == '' or has_error then
    utils.warn("Failed to load project config.")
    au.exec(au.config.config_load_failed)
  else
    M.info = vim.fn.json_decode(output)
    au.exec(au.config.config_load_success)
  end
  au.exec(au.config.config_load_post)
end

return M
