vim.g.mapleader = " "

-- Normal Mode Keymaps
vim.keymap.set("n", "<Leader>xx", vim.cmd.Ex)
vim.keymap.set("n", "<Leader>xs", vim.cmd.Sex)
vim.keymap.set("n", "<M-Left>", vim.cmd.tabprev)
vim.keymap.set("n", "<M-Right>", vim.cmd.tabnext)
vim.keymap.set("n", "<Leader>qf", vim.cmd.copen)

vim.keymap.set("n", "<Leader>cd", ":cd %:p:h<CR>:pwd<CR>")
vim.keymap.set("n", "<Leader>cc", '"+yy') -- Copy current line to system clipboard

-- Visual Mode Keymaps
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv") -- Move selected lines down
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv") -- Move selected lines up

vim.keymap.set("x", "<Leader>c", '"+y')      -- Copy selected text to system clipboard

-- Create empty line between enclosing braces when pressing <CR>
vim.keymap.set("i", "<CR>", function()
    local line = vim.fn.getline('.')
    local col = vim.fn.col('.')
    local cur = line:sub(col - 1, col)
    if cur == "{}" or cur == "[]" or cur == "()" then
        return "<CR><C-c>O"
    end
    return "<CR>"
end, { noremap = true, expr = true, })

local o_brackets = { '(', '[', '{' }
local c_brackets = { ')', ']', '}' }

for i = 1, #o_brackets do
    local b = o_brackets[i]
    vim.keymap.set("i", b, function()
        return o_brackets[i] .. c_brackets[i] .. "<Left>"
    end, { noremap = true, expr = true, })
end

-- On closing brackets, move to the right if current character
-- is already that bracket
-- TODO: Remove later if too distracting

for i = 1, #c_brackets do
    local b = c_brackets[i]
    vim.keymap.set("i", b, function()
        local line = vim.fn.getline('.')
        local col = vim.fn.col('.')
        local cur = line:sub(col, col)
        if cur == b then
            return "<Right>"
        end
        return b
    end, { noremap = true, expr = true, })


end

vim.keymap.set("i", "<BS>", function()
    local line = vim.fn.getline('.')
    local col = vim.fn.col('.')
    local cur = line:sub(col - 1, col)
    for i = 1, #c_brackets do
        if cur == o_brackets[i] .. c_brackets[i] then
            return "<Right><BS><BS>"
        end
    end
    return "<BS>"
end, { noremap = true, expr = true, })

-- Do math
vim.keymap.set("x", "<Leader>m", "\"md\"=<C-r>m<CR>P")

-- The default mapping for exiting Terminal mode kind of sucks
-- Setting it to be Control-Backslash twice
vim.keymap.set("t", "<C-\\><C-\\>", "<C-\\><C-n>")

vim.keymap.set("n", "<Leader>'", function ()
    if vim.fn.exists("b:custom_term") == 0 then
        vim.cmd.new()
        vim.cmd.wincmd("J")
        vim.api.nvim_win_set_height(0, 12)
        vim.cmd.term()
        vim.b.custom_term = true
        vim.o.winfixheight = true
    else
        vim.cmd.wincmd("q")
    end
end)

-- Place the word under the cursor on the search register without moving the cursor
vim.keymap.set("n", "<C-,>", function ()
    vim.fn.setreg("/", vim.fn.expand('<cword>'))
    vim.opt.hlsearch = true -- The search highlight always appears when this option is set
end)

-- Place the word under the cursor on the / register and start a replace operation
-- that may be repeated on future matches with `.`
vim.keymap.set("n", "<C-.>", function ()
    if vim.fn.getreg("/") == vim.fn.expand('<cword>') then
        return "cgn"
    else
        vim.fn.setreg("/", vim.fn.expand('<cword>'))
        vim.opt.hlsearch = true -- The search highlight always appears when this option is set
    end
end, {
    expr = true,
})
