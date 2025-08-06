-- ~/.config/nvim/lua/plugins/lualine.lua

local colors = {
	black = "#09040A",
	yellow = "#fabd2f",
	cyan = "#008080",
	green = "#b9f27c",
	orange = "#FF8800",
	purple = "#5d4d7a",
	mid_blue = "#3a405e",
	deep_blue = "#232433",
	magenta = "#d16d9e",
	deep_grey = "#2C323C",
	grey = "#3E4452",
	light_grey = "#C3C3C5",
	blue = "#7da6ff",
	isr_bg = "#1A1B26",
	red = "#ec5f67",
}

-- Custom theme for Lualine to match Galaxyline colors
local galaxyline_theme = {
	normal = {
		a = { fg = colors.red, bg = colors.deep_blue, gui = "bold" },
		b = { fg = colors.grey, bg = colors.mid_blue },
		c = { fg = colors.light_grey, bg = colors.deep_grey },
		x = { fg = colors.light_grey, bg = colors.mid_blue },
		y = { fg = colors.light_grey, bg = colors.deep_blue },
		z = { fg = colors.blue, bg = colors.deep_blue },
	},
	insert = {
		a = { fg = colors.blue, bg = colors.deep_blue, gui = "bold" },
	},
	visual = {
		a = { fg = colors.magenta, bg = colors.deep_blue, gui = "bold" },
	},
	replace = {
		a = { fg = colors.purple, bg = colors.deep_blue, gui = "bold" },
	},
	command = {
		a = { fg = colors.red, bg = colors.deep_blue, gui = "bold" },
	},
	["default"] = {
		a = { fg = colors.green, bg = colors.deep_blue, gui = "bold" },
	},
	terminal = {
		a = { fg = colors.green, bg = colors.deep_blue, gui = "bold" },
	},
}

-- Function to get the current file icon and color
local function get_file_icon_and_color()
	local filename = vim.fn.expand("%:t")
	if vim.fn.empty(filename) == 1 then
		return " "
	end

	local success, file_icons = pcall(require, "nvim-web-devicons")
	if success then
		local icon, hl_group = file_icons.get_icon(filename)
		return icon
	end
	return ""
end

-- Função para obter o total de linhas do arquivo
local function get_total_lines()
	-- Verifica se o buffer existe e não está vazio
	if vim.api.nvim_buf_is_valid(0) and vim.api.nvim_buf_line_count(0) > 0 then
		return vim.api.nvim_buf_line_count(0)
	end
	return "0" -- Retorna '0' se o buffer estiver vazio ou inválido
end

-- Custom Git branch provider
local function get_git_branch_or_empty()
	local branch = vim.b.gitsigns_head or "" -- gitsigns_head is the recommended way to get branch from gitsigns
	if branch == "" or branch == " " then -- Also check for an explicit space, though it should be empty
		return ""
	end
	return branch
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "lewis6991/gitsigns.nvim" }, -- Add gitsigns as a dependency
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = galaxyline_theme, -- Use the custom theme
				component_separators = { left = " ", right = " " }, -- Match Galaxyline's less distinct separators
				section_separators = { left = "▌", right = "▌" }, -- Match Galaxyline's separators
				disabled_filetypes = {
					statusline = { "LuaTree", "vista", "dbui" }, -- Replicate short_line_list
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = false, -- Galaxyline doesn't explicitly have this, setting to false
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16,
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = {
					{
						function()
							return "▋"
						end,
						color = { fg = colors.deep_blue, bg = colors.deep_blue },
					},
					{
						"mode",
						fmt = function(str)
							-- Galaxyline uses a mapping, so we'll do something similar here
							local alias = {
								n = "NORMAL",
								i = "INSERT",
								c = "COMMAND",
								V = "VISUAL",
								["␖"] = "VISUAL",
								v = "VISUAL",
								["r?"] = ":CONFIRM",
								rm = "--MORE",
								R = "REPLACE",
								Rv = "VIRTUAL",
								s = "SELECT",
								S = "SELECT",
								["␓"] = "SELECT",
								t = "TERMINAL",
								["!"] = "SHELL",
								["r"] = "HIT-ENTER",
							}
							return alias[vim.fn.mode()] or str
						end,
						-- The colors for 'mode' are handled by the custom theme's 'a' section
					},
				},
				lualine_b = {
					{
						get_file_icon_and_color,
						cond = function()
							return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
						end,
						color = { fg = colors.light_grey, bg = colors.deep_grey }, -- Galaxyline's FileIcon highlight
					},
					{
						"filename",
						cond = function()
							return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
						end,
						color = { fg = colors.light_grey, bg = colors.deep_grey },
						padding = { left = 0, right = 1 }, -- Adjust padding to be closer to icon
					},
					{
						function()
							return " "
						end, -- Git icon
						cond = function()
							return get_git_branch_or_empty() ~= ""
						end, -- Only show icon if branch exists
						color = { fg = colors.orange, bg = colors.mid_blue },
						padding = { left = 1, right = 0 }, -- Adjust padding to be closer to icon
					},
					{
						"branch", -- Use custom provider for branch
						cond = function()
							return get_git_branch_or_empty() ~= ""
						end, -- Only show if branch exists
						color = { fg = colors.light_grey, bg = colors.mid_blue },
						padding = { left = 0, right = 1 }, -- Adjust padding to be closer to icon
					},
				},
				lualine_c = {}, -- Middle section is empty as per Galaxyline config
				lualine_x = {
					{
						"fileformat",
						color = { fg = colors.light_grey, bg = colors.mid_blue },
						padding = { left = 2, right = 1 },
					},
					{
						-- Este componente agora mostra "linha atual | total de linhas"
						function()
							local current_line = vim.fn.line(".")
							local total_lines = get_total_lines()
							return string.format("%s │ %s", current_line, total_lines)
						end,
						color = { fg = colors.light_grey, bg = colors.mid_blue },
						padding = { left = 0, right = 1 }, -- Adicione padding se desejar espaçamento
					},
				},
				lualine_y = {},
				lualine_z = {
					{
						"scrollprogress", -- Matches ScrollBar functionality
						color = { fg = colors.blue, bg = colors.deep_blue },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
