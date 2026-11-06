return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	keys = {
		{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: toggle breakpoint" },
		{
			"<leader>dB",
			function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end,
			desc = "DAP: conditional breakpoint",
		},
		{ "<leader>dc", function() require("dap").continue() end, desc = "DAP: continue / start" },
		{ "<leader>di", function() require("dap").step_into() end, desc = "DAP: step into" },
		{ "<leader>do", function() require("dap").step_over() end, desc = "DAP: step over" },
		{ "<leader>dO", function() require("dap").step_out() end, desc = "DAP: step out" },
		{ "<leader>du", function() require("dapui").toggle() end, desc = "DAP: toggle UI" },
		{ "<leader>dx", function() require("dap").terminate() end, desc = "DAP: terminate" },
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()
		require("nvim-dap-virtual-text").setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
		vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticOk", linehl = "Visual" })

		-- Apple's lldb-dap matches Apple clang's debug info; Homebrew's is the fallback
		local xcode_dap = "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap"
		dap.adapters.lldb = {
			type = "executable",
			command = vim.fn.executable(xcode_dap) == 1 and xcode_dap or "/opt/homebrew/opt/llvm/bin/lldb-dap",
			name = "lldb",
		}

		local build_dir = vim.fn.stdpath("cache") .. "/leetcode-dbg"
		local base_flags = { "-std=c++26", "-I/opt/homebrew/include", "-g", "-O0" }
		local asan_flags = { "-fsanitize=address,undefined", "-fno-omit-frame-pointer" }

		-- Builds the current file into the cache dir; returns the binary path or nil on failure
		local function build(extra_flags, suffix)
			vim.cmd("silent! write")
			local src = vim.fn.expand("%:p")
			local out = build_dir .. "/" .. vim.fn.fnamemodify(src, ":h:t") .. suffix
			vim.fn.mkdir(build_dir, "p")

			local cmd = { "clang++", src, "-o", out }
			vim.list_extend(cmd, base_flags)
			vim.list_extend(cmd, extra_flags)
			local res = vim.system(cmd, { text = true }):wait()
			if res.code ~= 0 then
				vim.notify(res.stderr, vim.log.levels.ERROR, { title = "DAP build failed" })
				return nil
			end
			return out
		end

		-- Most solutions read their input from stdin: prompt once per run, replay it through a file.
		-- A literal "\n" in the prompt starts a new line, for inputs that span several lines.
		local last_input = {}
		local function stdin_commands()
			local key = vim.fn.expand("%:p")
			local input = vim.fn.input("stdin: ", last_input[key] or "")
			last_input[key] = input
			local path = build_dir .. "/stdin.txt"
			vim.fn.writefile(vim.split(input, "\\n", { plain = true }), path)
			return { "settings set target.input-path " .. path }
		end

		local function config(name, extra_flags, suffix, env)
			return {
				name = name,
				type = "lldb",
				request = "launch",
				cwd = "${fileDirname}",
				stopOnEntry = false,
				env = env,
				program = function()
					return build(extra_flags, suffix) or dap.ABORT
				end,
				preRunCommands = stdin_commands,
			}
		end

		dap.configurations.cpp = {
			config("cpp (debug)", {}, "", {}),
			-- abort_on_error stops lldb at the failing access; leak detection is unsupported on Apple Silicon
			config("cpp (asan + ubsan)", asan_flags, "-asan", { "ASAN_OPTIONS=abort_on_error=1:detect_leaks=0" }),
		}
	end,
}
