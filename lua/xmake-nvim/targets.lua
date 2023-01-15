local M = {}

function M.get_targets()
  Job = require 'plenary.job'
  Job:new {
    command = 'xmake',
  }


end
