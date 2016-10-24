if exists("b:did_ftplugin")
    finish
endif
setlocal textwidth=80
let b:did_ftplugin = 1
let b:undo_ftplugin = "setlocal  tw< commentstring<"
