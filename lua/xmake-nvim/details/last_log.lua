local M = {
  command_outputs = {}
}


function M.clear() 
  M.command_outputs = {}
end

function M.register_output(output)
  if type(output) == 'string' then
    output = { output }
  end
  if type(output) ~= 'table' then
    local u = require 'xmake-nvim.utils'
    u.error("Failed to register output, expect 'string', 'table', got " .. type(output))
    return
  end

  -- TODO:

end

return M
