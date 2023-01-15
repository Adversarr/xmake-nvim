-- Check the existance of plenary.
local utils = require 'xmake.utils'
local has_plenary = utils.check_plenary()
if not has_plenary then
  return
end

local config = require 'xmake.config'
local M = {
  config = config
  is_inited = false,
}

-- TODO: Check plenary is installed.


function M.setup(opt)
  opt = opt or {}
  

  for k, v in opt do
    config.update(k, v)
  end

  M.is_inited = true
end

return M
