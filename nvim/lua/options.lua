local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- set column marker at 80 chars
opt.colorcolumn = "80"

-- search
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"

opt.scrolloff = 8

-- clipboard
opt.clipboard:append("unnamedplus")

-- shell files: 4 space indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sh", "bash" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.cmd.colorscheme("monokai-pro")
