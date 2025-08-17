local M = {}

local spell_mode_active = true
local spell_ns = vim.api.nvim_create_namespace("spell-mode")

function M.correct_current_word()
	local word = vim.fn.expand("<cword>")
	local suggestions = vim.fn.spellsuggest(word)

	require("fzf-lua").fzf_exec(suggestions, {
		prompt = "Mean > ",
		winopts = {
			title = "Sugestions: " .. word,
			border = "rounded",
			width = 0.5,
			height = 0.3,
		},
		actions = {
			["default"] = function(selected_words)
				local selected_word = selected_words[1]
				if selected_word then
					vim.api.nvim_command("normal! ciw" .. selected_word)
				end
			end,
		},
	})
end

function M.show_spell_suggestions()
	M.correct_current_word()
end

function M.enter_spell_mode()
	vim.keymap.set("n", "]n", "]s", { buffer = 0, noremap = true, silent = true, desc = "Next Wrong Word" })
	vim.keymap.set("n", "[n", "[s", { buffer = 0, noremap = true, silent = true, desc = "Previus Word Word" })

	vim.keymap.set(
		"n",
		"<CR>",
		M.correct_current_word,
		{ buffer = 0, noremap = true, silent = true, desc = "Correct actual misspell word" }
	)

	vim.keymap.set("n", "<Esc>", function()
		spell_mode_active = false
		vim.api.nvim_buf_clear_namespace(0, spell_ns, 0, -1)

		for _, key in ipairs({ "]n", "[n", "<CR>", "<Esc>" }) do
			pcall(vim.keymap.del, "n", key, { buffer = 0 })
		end
	end, { buffer = 0, noremap = true, silent = true, desc = "Exit Correctness Mode" })
end

function M.select_spell_lang()
	local langs = { "pt_br", "en_us" }

	require("fzf-lua").fzf_exec(langs, {
		prompt = "Select Idiom > ",
		winopts = {
			title = "Spell-Checker Idiom",
			border = "rounded",
			width = 0.4,
			height = 0.3,
		},
		actions = {
			["default"] = function(selected)
				local lang = selected[1]
				if lang then
					vim.opt.spelllang = lang
					vim.notify("Current Idiom: " .. lang, vim.log.levels.INFO)
				end
			end,
		},
	})
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "tex", "text" },
	callback = function()
		vim.opt.spelllang = "pt_br"
		vim.opt.spell = true
	end,
})

return M
