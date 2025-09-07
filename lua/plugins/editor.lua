return {
	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<F3>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
		},
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				disable_netrw = true,
				hijack_netrw = true,
				view = {
					width = 30,
					side = "left",
				},
				renderer = {
					icons = {
						glyphs = {
							default = "",
							symlink = "",
							folder = {
								arrow_closed = "",
								arrow_open = "",
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},
						},
					},
				},
				filters = {
					dotfiles = false,
				},
			})
		end,
	},

	-- Fuzzy finder
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({
				winopts = {
					height = 0.85,
					width = 0.80,
					preview = {
						default = "bat",
						border = "border",
						wrap = "nowrap",
						hidden = "nohidden",
						vertical = "down:45%",
						horizontal = "right:60%",
						layout = "flex",
						flip_columns = 120,
						file_ignore_patterns = { "%.venv/", "%.pixi/" },
					},
				},
			})
		end,
	},

	-- FZF binary
	{
		"junegunn/fzf",
		build = "./install --bin",
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					file_browser = {
						theme = "ivy",
						hijack_netrw = true,
					},
				},
			})
			require("telescope").load_extension("file_browser")
		end,
	},

	-- Toggle terminal
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "horizontal",
				close_on_exit = true,
				shell = vim.o.shell,
			})

			-- Manual keymap as backup
			vim.keymap.set(
				"n",
				"<C-\\>",
				"<cmd>ToggleTerm<cr>",
				{ noremap = true, silent = true, desc = "Toggle Terminal" }
			)
			vim.keymap.set(
				"t",
				"<C-\\>",
				"<cmd>ToggleTerm<cr>",
				{ noremap = true, silent = true, desc = "Toggle Terminal" }
			)

			-- Lazygit integration
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({
				cmd = "lazygit",
				hidden = true,
				direction = "float",
				float_opts = {
					border = "curved",
				},
			})

			function _lazygit_toggle()
				lazygit:toggle()
			end

			-- Lazygit keymap
			vim.keymap.set(
				"n",
				"<leader>lg",
				"<cmd>lua _lazygit_toggle()<CR>",
				{ noremap = true, silent = true, desc = "Toggle Lazygit" }
			)
		end,
	},

	-- Git integration
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signcolumn = true,
				numhl = false,
				linehl = false,
				word_diff = false,
				watch_gitdir = {
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = false,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 300,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil,
				max_file_length = 40000,
				preview_config = {
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					map("n", "[c", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					-- Actions
					map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
					map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
					map("v", "<leader>gs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Stage hunk" })
					map("v", "<leader>gr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Reset hunk" })
					map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
					map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
					map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
					map("n", "<leader>gh", gs.preview_hunk, { desc = "Preview hunk" })
					map("n", "<leader>gb", function()
						gs.blame_line({ full = false })
					end, { desc = "Git blame line" })
					map("n", "<leader>gB", function()
						gs.blame_line({ full = true })
					end, { desc = "Git blame line (full)" })
					map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
					map("n", "<leader>gd", gs.diffthis, { desc = "Diff this" })
					map("n", "<leader>gD", function()
						gs.diffthis("~")
					end, { desc = "Diff this ~" })
					map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle deleted" })

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
				end,
			})
		end,
	},

	{
		"jreybert/vimagit",
		cmd = "Magit",
	},

	{
		"akinsho/git-conflict.nvim",
		event = "BufReadPre",
		config = function()
			require("git-conflict").setup()
		end,
	},

	-- REPL integration
	{
		"Vigemus/iron.nvim",
		ft = { "python", "julia", "r", "scheme", "lisp" },
		config = function()
			local iron = require("iron.core")
			local view = require("iron.view")
			local common = require("iron.fts.common")
			iron.setup({
				config = {
					scratch_repl = true,
					should_map_plug = false,
					focus_on = "previous",
					repl_definition = {
						sh = {
							command = { "zsh" },
						},
						python = {
							command = { "ipython3" },
							format = require("iron.fts.common").bracketed_paste,
							block_dividers = { "# %%", "#%%" },
						},
						julia = {
							command = { "julia" },
						},
					},
					repl_open_cmd = view.split.botright(40),
				},
				keymaps = {
					toggle_repl = "<space>rr", -- toggles the repl open and closed.
					-- If repl_open_command is a table as above, then the following keymaps are
					-- available
					-- toggle_repl_with_cmd_1 = "<space>rv",
					-- toggle_repl_with_cmd_2 = "<space>rh",
					restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
					send_motion = "<space>sc",
					visual_send = "<space>sc",
					send_file = "<space>sf",
					send_line = "<space>sl",
					send_paragraph = "<space>sp",
					send_until_cursor = "<space>su",
					send_mark = "<space>sm",
					send_code_block = "<space>sb",
					send_code_block_and_move = "<space>sn",
					mark_motion = "<space>mc",
					mark_visual = "<space>mc",
					remove_mark = "<space>md",
					cr = "<space>s<cr>",
					interrupt = "<space>s<space>",
					exit = "<space>sq",
					clear = "<space>cl",
				},
				highlight = {
					italic = true,
				},
				ignore_blank_lines = true,
			})

			-- Ensure proper window navigation after REPL operations
			local function ensure_main_window_focus()
				vim.cmd("wincmd p")
			end

			-- Add autocommands to prevent focus stealing
			vim.api.nvim_create_autocmd("User", {
				pattern = "IronReplOpened",
				callback = function()
					vim.defer_fn(ensure_main_window_focus, 100)
				end,
			})

			-- Additional keymaps for explicit window navigation
			vim.keymap.set("n", "<C-w>j", "<C-w>j", { desc = "Move to window below" })
			vim.keymap.set("n", "<C-w>k", "<C-w>k", { desc = "Move to window above" })
			vim.keymap.set("n", "<C-w><C-j>", "<C-w>j", { desc = "Move to window below" })
			vim.keymap.set("n", "<C-w><C-k>", "<C-w>k", { desc = "Move to window above" })
		end,
	},

	-- Command line REPL
	{
		"jalvesaq/vimcmdline",
		ft = { "python", "julia", "r", "sh", "javascript" },
		config = function()
			vim.g.cmdline_map_start = "<LocalLeader>s"
			vim.g.cmdline_map_send = "<LocalLeader>t"
			vim.g.cmdline_map_send_and_stay = "<LocalLeader><LocalLeader>"
			vim.g.cmdline_map_source_fun = "<LocalLeader>f"
			vim.g.cmdline_map_send_paragraph = "<LocalLeader>p"
			vim.g.cmdline_map_send_block = "<LocalLeader>b"
			vim.g.cmdline_map_quit = "<LocalLeader>q"
		end,
	},

	-- Tmux integration
	{
		"jgdavey/tslime.vim",
		config = function()
			vim.g.tslime_ensure_trailing_newlines = 1
			vim.g.tslime_normal_mapping = "<localleader>t"
			vim.g.tslime_visual_mapping = "<localleader>t"
			vim.g.tslime_vars_mapping = "<localleader>T"
			vim.g.tslime_always_current_window = 1
			vim.g.tslime_always_current_session = 1
			vim.g.tslime_autoset_panel = 1

			-- Key mappings
			vim.keymap.set("v", "<C-c><C-c>", "<Plug>SendSelectionToTmux", { silent = true })
			vim.keymap.set("n", "<C-c><C-c>", "<Plug>NormalModeSendToTmux", { silent = true })
		end,
	},
}
