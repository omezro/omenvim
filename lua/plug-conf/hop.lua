local status_ok, _ = pcall(require, "hop")
if not status_ok then
    require("util.notify").notify("cannot load plugin hop","error","Plugin")
	return
end

local M = {}

local function config_hop(config)
	config.setup({
		jump_on_sole_occurrence = false,
		case_insensitive = false,
		create_hl_autocmd = true,
		current_line_only = false,
		multi_windows = false,
	})
end

function M.setup()
	local hop = require("hop")
	config_hop(hop)
end

return M
