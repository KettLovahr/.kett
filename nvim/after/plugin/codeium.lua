vim.g.codeium_disable_bindings = 1 -- Don't want to deal with the default bindings
vim.g.codeium_idle_delay = 100 -- Shorter delay for the completion

vim.keymap.set('i', '<C-Space>', function() return vim.fn['codeium#Accept']() end, {expr = true}) -- For some reason I have muscle memory for this shortcut

-- Alt x and z to cycle through completions
vim.keymap.set('i', '<M-x>', function() return vim.fn['codeium#CycleCompletions'](1) end, {expr = true})
vim.keymap.set('i', '<M-z>', function() return vim.fn['codeium#CycleCompletions'](-1) end, {expr = true})
