local options = {
    autoindent = true,
    smartindent = true,
    smarttab = true,
    laststatus = 2,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    wildmenu = true,
    incsearch = true,
    inccommand = "split",
    hlsearch = true,
    smartcase = true,
    listchars = "tab:>-",
    list = true,
    signcolumn = "yes",
    scroll = 10,
    scrolloff = 6,
    background = dark,
    splitright = true,
    mouse = "",
    completeopt = { "menu", "menuone", "noselect" },
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("auto_comment_off", { clear = true }),
    pattern = "*",
    command = "setlocal formatoptions-=ro"
})

require("plugins")
require("keybind")
