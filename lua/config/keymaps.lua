-- Key mappings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep cursor in place when joining lines
keymap("n", "J", "mzJ`z", opts)

-- Keep cursor centered when scrolling
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Clear search highlighting
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Diagnostics
keymap('n', '<space>e', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Better paste
keymap("x", "<leader>p", [["_dP]], opts)

-- FzfLua keymaps (updated from master branch)
keymap("n", "<leader>ff", "<cmd>FzfLua files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", opts) -- Updated to use FzfLua for buffers
keymap("n", "<leader>fh", "<cmd>FzfLua tags<cr>", opts)
keymap("n", "<leader>gf", "<cmd>FzfLua git_files<cr>", opts)
keymap("n", "<leader>sr", "<cmd>FzfLua lsp_references<cr>", opts)
keymap("n", "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", opts)
keymap("n", "<leader>sw", "<cmd>FzfLua lsp_workspace_symbols<cr>", opts)

-- Change to local subdirectory
keymap("n", "<leader>fD", function()
  require("fzf-lua").fzf_exec("fd --type d", {
    prompt = "CD> ",
    actions = {
      ["default"] = function(selected)
        vim.cmd("cd " .. selected[1])
      end,
    },
  })
end, { desc = "Change to local subdirectory" })

-- Telescope file browser
keymap("n", "<leader>fe", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", opts)

-- DAP (Debug Adapter Protocol) keymaps
keymap("n", "<leader>dn", function() require('dap-python').test_method() end, opts)
keymap("n", "<leader>df", function() require('dap-python').test_class() end, opts)
keymap("n", "<leader>db", function() require('dap').toggle_breakpoint() end, opts)
keymap("n", "<F5>", function() require('dap').continue() end, opts)
keymap("n", "<S-F5>", function() require('dap').terminate() end, opts)
keymap("n", "<F11>", function() require('dap').step_into() end, opts)
keymap("n", "<S-F12>", function() require('dap').step_out() end, opts)
keymap("n", "<F10>", function() require('dap').step_over() end, opts)
keymap("n", "<leader>dr", function() require('dap').repl.open() end, opts)

-- Visual mode DAP
keymap("v", "<leader>ds", "<ESC>:lua require('dap-python').debug_selection()<CR>", opts)

-- LeetCode keymaps
keymap("n", "<leader>ll", ":LeetCodeList<cr>", opts)
keymap("n", "<leader>lt", ":LeetCodeTest<cr>", opts)
keymap("n", "<leader>ls", ":LeetCodeSubmit<cr>", opts)
keymap("n", "<leader>li", ":LeetCodeSignIn<cr>", opts)

-- SQL keymaps (from nvimrc diff)
-- keymap('n', '<leader>bq', ':normal vip<CR><PLUG>(DBUI_ExecuteQuery)', { buffer = true, desc = "run query under cursor (mnemonic: Go)" })

-- Formatting keymap
keymap("n", "<leader>fm", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format file" })

-- CodeCompanion keymaps (from nvimrc diff)
keymap({ "n", "v" }, "<leader>ck", "<cmd>CodeCompanionActions<cr>", opts)
keymap({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", opts)
keymap("v", "ak", "<cmd>CodeCompanionChat Add<cr>", opts)

-- Git blame and navigation keymaps (gitsigns)
keymap("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle git blame" })
keymap("n", "<leader>gB", "<cmd>Gitsigns blame_line<cr>", { desc = "Show full blame info" })
keymap("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal({"]c", bang = true})
  else
    require('gitsigns').nav_hunk('next')
  end
end, { desc = "Next git hunk" })
keymap("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal({"[c", bang = true})
  else
    require('gitsigns').nav_hunk('prev')
  end
end, { desc = "Previous git hunk" })
keymap("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview git hunk" })
keymap("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset git hunk" })
keymap("v", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset git hunk" })
keymap("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset git buffer" })
keymap("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage git hunk" })
keymap("v", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage git hunk" })
keymap("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Stage git buffer" })
keymap("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo stage hunk" })