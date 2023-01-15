local config = {
  -- NOTE: Default config for xmake-nvim
  xmake_executable_path = "xmake",
  env_vars = {
    -- e.g.
    -- http_proxy = 'http://127.0.0.1:7890'
  },
}

local M = {}
function M.get(name)
  if name then
    return config[name]
  else
    return config
  end
end

function M.update(name, val) 
  config [ name ] = val
end

return M
