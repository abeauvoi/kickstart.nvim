local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

local cleanup_group = augroup("Cleanup", { clear = true })
autocmd({ "BufWritePre" }, {
	group = cleanup_group,
	pattern = "*",
	callback = function()
		local function strip_trailing_whitespaces()
			local current_view = vim.fn.winsaveview()
			vim.cmd([[keeppatterns %s/\s\+$//e]])
			vim.fn.winrestview(current_view)
		end

		vim.schedule(strip_trailing_whitespaces)
	end,
})

local colorcolumn_group = augroup("Colorcolumn", { clear = true })
autocmd({ "BufRead", "BufNewFile", "TextChanged", "TextChangedI" }, {
	group = colorcolumn_group,
	pattern = "*",
	callback = function()
		local filetype = vim.bo.filetype

		if filetype == "lua" then
			vim.fn.clearmatches()
			return
		end

		-- Clear matches before adding new ones
		vim.fn.clearmatches()
		vim.fn.matchadd("ExtraLongLines", "\\%>80v.\\+")
	end,
})

local function disableSyntaxTreesitter()
	local ts_disable_features = {
		"autotag",
		"highlight",
		"incremental_selection",
		"indent",
		"playground",
		"query_linter",
		"rainbow",
		"refactor.highlight_definitions",
		"refactor.navigation",
		"refactor.smart_rename",
		"refactor.highlight_current_scope",
		"textobjects.swap",
		"textobjects.move",
		"textobjects.lsp_interop",
		"textobjects.select",
	}

	-- Check if the TSBufDisable command exists
	if vim.fn.exists(":TSBufDisable") ~= 0 then
		for _, feature in ipairs(ts_disable_features) do
			vim.cmd(string.format("TSBufDisable %s", feature))
		end
	end

	vim.opt.foldmethod = "manual"
	vim.cmd("syntax clear")
	vim.cmd("syntax off")
	vim.cmd("filetype off")
	vim.opt.undofile = false
	vim.opt.swapfile = false
	vim.opt.loadplugins = false
end

local big_file_disable_group = augroup("BigFileDisable", { clear = true })
autocmd({ "BufWinEnter", "BufReadPre", "FileReadPre" }, {
	group = big_file_disable_group,
	pattern = "*",
	callback = function()
		local fileSize = vim.fn.getfsize(vim.fn.expand("%"))
		if fileSize > 512 * 1024 then
			disableSyntaxTreesitter()
		end
	end,
})
