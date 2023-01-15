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
  }
}

function M.setup()
  vim.api.nvim_create_augroup(M.config.group_name, {
    clear = true
  })
  -- TODO: register
end

return M
