return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		local verible_lint = {
			name = "verible_verilog_lint",
			method = null_ls.methods.DIAGNOSTICS,
			filetypes = { "systemverilog", "verilog" },
			generator = null_ls.generator({
				command = "verible-verilog-lint",
				args = { "$FILENAME" },
				to_temp_file = true,
				from_stderr = false,
				format = "line",
				check_exit_code = function(code)
					return code <= 1
				end,
				on_output = function(line, params)
					-- verible output: filename:line:col: message [rule]
					local row, col, message = line:match(":(%d+):(%d+): (.+)$")
					if row then
						return {
							row = tonumber(row),
							col = tonumber(col),
							message = message,
							severity = vim.diagnostic.severity.WARN,
							source = "verible-verilog-lint",
						}
					end
				end,
			}),
		}

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,
				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.pylint,
				-- C/C++
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.diagnostics.cppcheck,
				-- SystemVerilog
				null_ls.builtins.formatting.verible_verilog_format,
				verible_lint,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
