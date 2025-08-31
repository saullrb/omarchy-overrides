-- Enable line wrapping
vim.opt.wrap = true
vim.opt.showbreak = "↪"
vim.opt.breakindent = true

-- Disable all snacks animations
vim.g.snacks_animate = false

-- Disable global clipboard
vim.opt.clipboard = ""

-- always yank to system clipboard
local map = vim.keymap.set
map({ "n", "v" }, "y", '"+y')
map("n", "Y", '"+Y')

-- paste: if last op was yank, use system clipboard; else use default
map("n", "p", function()
	return vim.fn.reg_recording() == ""
			and vim.fn.getregtype("+") == vim.fn.getregtype('"')
			and vim.fn.getreg('"') == vim.fn.getreg("+")
			and '"+p'
		or "p"
end, { expr = true })

map("n", "P", function()
	return vim.fn.reg_recording() == ""
			and vim.fn.getregtype("+") == vim.fn.getregtype('"')
			and vim.fn.getreg('"') == vim.fn.getreg("+")
			and '"+P'
		or "P"
end, { expr = true })
