--Line Numbers
vim.opt.number = true           --Show Line numbers
vim.opt.relativenumber = true	--show Relative line numbers

--Tabs & Indentation
vim.opt.tabstop = 4 	    	--Number of spaces a tab counts for
vim.opt.shiftwidth = 4		    --Size of an indent
vim.opt.softtabstop = 4     	--Spaces inserted when pressing Tab
vim.opt.expandtab = true	    --convert tabs to spaces
vim.opt.smartindent = true	    --Automatically indent new lines

--Searching
vim.opt.ignorecase = true   	--Ignore case while searching
vim.opt.smartcase = true 	    --Unless search contains uppercase
vim.opt.hlsearch = false	    --Don't keep search mathes highlighted
vim.opt.incsearch = true 	    --Show matches while typing

--Appearance
vim.opt.termguicolors = true 	--Enable 24-bit RGB colors
vim.opt.signcolumn = "yes"	    --Always show sign column
vim.opt.cursorline = true       --Highlight current line
vim.opt.wrap = false            --No Lines Wrap
vim.opt.scrolloff = 8           --keep 8 lines visible above/below cursor

--Mouse
vim.opt.mouse = "a"             --Enable mouse in all modes

--Clipboard
vim.opt.clipboard:append("unnamedplus")     --Use system clipboard

--Splits
vim.opt.splitbelow = true       --Horizontal splits open below
vim.opt.splitright = true       --Vertical splits open right

--Files
vim.opt.swapfile = false        --Disable swap files
vim.opt.backup = false          --Disable backup files
vim.opt.undofile = true         --Persistent undo history

--Completion
vim.opt.completeopt = {"menu", "menuone", "noselect"}

--COMMAND LINE
vim.opt.cmdheight = 1           --Command-Line height
vim.opt.showmode = false        --Hide "--INSERT--"

--WHITESPACE
vim.opt.list = true             --show whitespace characters
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
}

--MISCELLANEOUS
vim.opt.encoding = "utf-8"      --Internal encoding
vim.opt.fileencoding = "utf-8"  --File Encoding
vim.opt.confirm = true          --Ask before quitting unsaved buffers

--Netrw (Built-in File Explorer)
vim.g.netrw_banner = 0          --Hide banner
vim.g.netrw_liststyle = 3       --Tree view 

--FOLDING
vim.opt.foldmethod = "expr"     --Treesitter/LSP plugins may override this
vim.opt.foldlevel = 99          --Start with folds open













