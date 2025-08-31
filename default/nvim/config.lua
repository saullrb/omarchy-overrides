-- Enable line wrapping
vim.opt.wrap = true
vim.opt.showbreak = "↪"
vim.opt.breakindent = true

-- Disable the system clipboard integration
vim.opt.clipboard = ""

-- Disable all snacks animations
vim.g.snacks_animate = false

-- Yank to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
