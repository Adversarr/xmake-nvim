# xmake-nvim

XMake plugin for neovim.

## Dependency

1. plenary.nvim

## Roadmap

basic:

- [ ] Commands and Lua API
- [ ] Configurations: build-type(debug/release/...), arch, platform, toolchain, etc.
- [ ] Build, run: background async build, build success callback, autocmd, and persistent log
- [ ] Status bar: via g:xxx or b:xxx variables.
- [ ] `workspaceRoot/workspaceFolder` support 

advanced:

- [ ] Debug
- [ ] Telescope integration.
- [ ] ToggleTerm integration.

## Commands and API

Similar to [xmake-vscode](https://github.com/xmake-io/xmake-vscode), xmake-nvim provide:

> `!` means this commands will not be supported very soon.

1. `XmakeConfigure`: Configure
2. `XmakeCleanConfigure`: Clean and reconfigure
3. `XmakeBuild`: Build selected target
4. `XmakeRebuild`: Rebuild selected target
5. `XmakeClean`: Clean the outputs of target
6. `XmakeRun`: Run given target
7. `XmakeBuildRun`: Run given target
8. ! `XmakePackage`: Package
9. ! `XmakeDebug`: Call debug to given target.

For special target, i.e. `all`:

1. `XmakeBuildAll`: Build all the targets.
2. `XmakeCleanAll`: Clean all the targets.

Command-line args can be set via:

1. `XmakeSetBuildMode`: set target build mode, i.e. debug, release, ...
2. `XmakeSetPlatform`: set target platform 
3. `XmakeSetTargetArch`: set target arch
4. `XmakeSetTargetToolchain`: set target arch

These variables will be passed to configure commands automatically:

```
xmake f -p $PLATFORM -a $ARCH -m $MODE --toolchain=$TOOLCHAIN
```

Other xmake-nvim variables canbe set via:

1. `XmakeSetTarget`: set the default target.
2. `XmakeSetProjectDir`: set the xmake workingdir, i.e. `-P` flag in xmake.

## Auto commands for Build/Run/Configure commands

xmake-nvim use `autocmd` instead of callback to notify neovim and user the status of build and run.

Build:

1. `XmakeBuildSuccess`: After last build command is success
2. `XmakeBuildFailed`: After last build command throws an error
3. `XmakeBuildPre`: Before build command is executed
4. `XmakeBuildPost`: After build command is finished.

Configure:

1. `XmakeConfigureSuccess`
2. `XmakeConfigureFailed`
3. `XmakeConfigurePre`
4. `XmakeConfigurePost`

Run:

1. `XmakeRunPre` 
2. `XmakeRunPost`

... To be done.

