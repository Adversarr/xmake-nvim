local config = {
  -- NOTE: Default config for xmake-nvim
  xmake_executable_path = "xmake",
  log_level = vim.log.levels.INFO
  env_vars = {
    -- e.g.
    -- http_proxy = 'http://127.0.0.1:7890'
  },
}

local M = {
  is_inited = true
}

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

function M.setup(opts)
  for k, v in opt do
    config.update(k, v)
  end
  M.is_inited = true
end

return M
