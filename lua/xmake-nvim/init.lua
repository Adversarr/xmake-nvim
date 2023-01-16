-- Check the existance of plenary.
local utils = require 'xmake-nvim.utils'
local config = require 'xmake-nvim.config'
local M = {
}

-- TODO: Check plenary is installed.

local function setup_all_submodules()
  require('xmake-nvim.details.autocmds').setup()
  M.config = config
  M.show = require 'xmake-nvim.show'
  M.utils = require 'xmake-nvim.utils'
end

function M.setup(opt)
  opt = opt or {}
  local status, _ = pcall(require, 'plenary')
  if not status then
    vim.notify("xmake-nvim is not setup: xmake-nvim depends on pleanry.nvim, please check plenary is installed.", vim.log.levels.ERROR, {})
    return
  end
  config.setup(opt)
  setup_all_submodules()
end

return M
