return {
	"echasnovski/mini.surround",
	version = "*",
	opts = {
		mappings = {
			add = "Za",
			delete = "Zd",
			find = "Zf",
			find_left = "ZF",
			highlight = "Zh",
			replace = "Zr",
			update_n_lines = "Zn",
		},
		custom_surroundings = {
			["("] = { output = { left = "(", right = ")" } },
			[")"] = { output = { left = "(", right = ")" } },
			["["] = { output = { left = "[", right = "]" } },
			["]"] = { output = { left = "[", right = "]" } },
			["{"] = { output = { left = "{", right = "}" } },
			["}"] = { output = { left = "{", right = "}" } },
		},
	},
}
