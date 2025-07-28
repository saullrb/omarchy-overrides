-- Enable line wrapping
vim.opt.wrap = true
vim.opt.showbreak = "↪"
vim.opt.breakindent = true

-- Disable the system clipboard integration
vim.opt.clipboard = ""

-- Disable all snacks animations
vim.g.snacks_animate = false

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set("i", ";;", "<Esc>A;<Esc>")
vim.keymap.set("i", ",,", "<Esc>A,<Esc>")

-- Yank to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
