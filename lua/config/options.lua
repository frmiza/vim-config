local opt = vim.opt

opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Amount to indent with << and >>
opt.tabstop = 2 -- Insert 2 spaces for a tab/
opt.softtabstop = 2 -- How many spaces are applied when pressing Tab
opt.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
opt.joinspaces = false -- No double spaces with join

opt.smarttab = true
opt.autoindent = true -- Good auto indent
opt.smartindent = true -- Insert indents automatically
opt.shiftround = true -- Round indent

opt.clipboard = "unnamedplus" -- Copy and past to whatever u want
opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.mouse = "a"

opt.cursorline = false -- Highlight current line
opt.number = true -- Show line numbers
opt.numberwidth = 3 -- Make the gutter wider by default
opt.ruler = true -- Show the cursor position all the time

opt.wrap = true -- Display long lines as just one line
opt.linebreak = true -- Stop words being broken on wrap
opt.list = false -- Show some invisible characters
opt.backspace = { "indent", "eol", "start" }

opt.scrolloff = 4 -- Lines of context
opt.sidescrolloff = 8 -- Colums of context

opt.showmode = false -- Don't display mode
opt.hlsearch = true -- Highlight found searches
opt.incsearch = true -- Shows the match while typing
opt.inccommand = "split" -- Get a preview of replacements

opt.splitright = true -- Vertical split alway to the right

opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Do not ignore case with capitals

opt.timeoutlen = 450 -- By default timeoutlen is 1000 ms
opt.updatetime = 200 -- Faster completion

--opt.completeopt = "menuone,noselect"
--opt.foldenable = false
--opt.foldmethod = "indent" -- Set indent
--opt.hidden = true -- Enable background buffers
--opt.formatoptions = "cro"
