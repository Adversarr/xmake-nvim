local M = {
  config = {
    group_name = 'XmakeNvim',

    -- xmake b ...
    build_success = 'XmakeBuildSuccess',
    build_failed = 'XmakeBuildFailed',
    build_pre = 'XmakeBuildPre',
    build_post = 'XmakeBuildPost',

    -- xmake f ...
    configure_success = 'XmakeConfigureSuccess',
    configure_failed = 'XmakeConfigureFailed',
    configure_pre = 'XmakeConfigurePre',
    configure_post = 'XmakeConfigurePost',

    -- xmake run
    run_pre = 'XmakeRunPre',
    run_post = 'XmakeRunPost',

    -- any xmake.lua file change
    config_file_change = 'XmakeConfigFileChange',
    -- Internal config change:
    config_load_success = 'XmakeConfigLoadSuccess',
    config_load_failed = 'XmakeConfigLoadFailed',
    config_load_pre = 'XmakeConfigLoadPre',
    config_load_post = 'XmakeConfigLoadPost',
  }
}

function M.setup()
  vim.api.nvim_create_augroup(M.config.group_name, {
    clear = true
  })
  -- TODO: register
end

function M.exec(name)
  vim.api.nvim_exec_autocmds('User', {
    group = M.config.group_name,
    pattern = name
  })
end

return M
