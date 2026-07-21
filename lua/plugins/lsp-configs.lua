return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright", "clangd", "lua_ls", "verible", "svlangserver" },
				automatic_enable = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})

			vim.lsp.config("verible", {
				cmd = { "verible-verilog-ls", "--rules_config_search" },
				filetypes = { "verilog", "systemverilog" },
				root_dir = function(bufnr)
					local fname = vim.api.nvim_buf_get_name(bufnr)
					return vim.fs.dirname(vim.fs.find({ ".git" }, { path = fname, upward = true })[1])
						or vim.fn.getcwd()
				end,
			})

			vim.lsp.config("svlangserver", {
				filetypes = { "verilog", "systemverilog" },
				settings = {
					svlangserver = {
						includeIndexing = { "**/*.{sv,svh,v,vh}" },
						excludeIndexing = { "test/**/*.{sv,svh}" },
						lintOnUnsaved = true,
						defines = {},
					},
				},
				root_dir = function(bufnr)
					local fname = vim.api.nvim_buf_get_name(bufnr)
					return vim.fs.dirname(vim.fs.find({ ".git" }, { path = fname, upward = true })[1])
						or vim.fn.getcwd()
				end,
			})

			vim.lsp.config("tinymist", {
				settings = {
					tinymist = {
						exportPdf = "onType",
						fontPaths = { "./fonts" },
					},
				},
			})
			vim.lsp.enable("tinymist")

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "typst",
				callback = function(ev)
					vim.keymap.set("n", "<leader>tp", function()
						local pdf = vim.fn.expand("%:p:r") .. ".pdf"
						vim.fn.jobstart({ "open", "-a", "Skim", pdf })
					end, { buffer = ev.buf, desc = "Open PDF in Skim" })
				end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
}
