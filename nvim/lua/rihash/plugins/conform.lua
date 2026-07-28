return {
	"stevearc/conform.nvim",
    --Only load when these specific buffers are opened
    ft = { "lua", "c", "cpp", "sh" },
    cmd = { "ConformInfo" },

	keys = {
		{
			"<leader>fb",
			function()
	require("conform").format({ async = true }, function(err)
		if not err then
			local mode = vim.api.nvim_get_mode().mode
			if vim.startswith(string.lower(mode), "v") then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
			end
		end
	end)
			end,
			mode = { "n", "v" }, -- Normal and Visual modes
			desc = "Format code or selection",
		},
	},

	opts = {
		-- Default format options for all languages
		-- Uses LSP formatter if no dedicated formatter is installed
		default_format_opts = {
			lsp_format = "fallback",
		},

		-- Dedicated formatters by file type
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			sh = { "shfmt" },
		},

		-- Setup format on save (currently turned off/commented out)
		-- format_on_save = {
		--   timeout_ms = 500,
		-- },
	},

	--override the formatter settings for specific file type
	formatters = {
		stylua = {
			prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
		},

		shfmt = {
			append_args = { "-i", "2" },
		},
	},
}
