local cmp = require("cmp")

-- PERF: setting up some helper functions

local function has_words_before()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local line = cursor[1]
	local col = cursor[2]
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local function feedkey(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- PERF: setting up the completion engine

cmp.setup({
	-- -PERF: setting up the window to be borderd

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	-- PERF: setting up keymaps for completion

	mapping = cmp.mapping.preset.insert({
		["<Escape>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	-- PERF: setting up completion sources

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}),

	-- PERF: setting up the completion symbols

	formatting = {
		format = function(entry, vim_item)
			local symbol_map = {
				Text = "",
				Method = "",
				Function = "𝒇",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "塞",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "פּ",
				Event = "",
				Operator = "",
				TypeParameter = "",
			}
			vim_item.kind = string.format("%s %s", symbol_map[vim_item.kind] or "", vim_item.kind)
			return vim_item
		end,
	},
})
