-- Autocommands
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Close completion popup when done
autocmd("CompleteDone", {
  pattern = "*",
  callback = function()
    if vim.fn.pumvisible() == 0 then
      vim.cmd("pclose")
    end
  end,
})

-- Format indentation for lisp-like languages
autocmd("FileType", {
  pattern = { "lisp", "scheme", "art", "racket" },
  callback = function()
    vim.opt_local.equalprg = "scmindent.rkt"
  end,
})

-- Use LSP omni-completion in Rust files
autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
  end,
})

-- Auto-read file changes
local autoread_group = augroup("AutoRead", { clear = true })
autocmd("CursorHold", {
  group = autoread_group,
  callback = function()
    if vim.fn.mode() == "n" then
      vim.cmd("checktime")
    end
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Auto-resize splits when window is resized
autocmd("VimResized", {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Window navigation inside the Claude Code terminal
autocmd("TermOpen", {
  callback = function(event)
    local bufname = vim.api.nvim_buf_get_name(event.buf)
    if not bufname:match("claude") then
      return
    end
    local map_opts = { buffer = event.buf, silent = true }
    vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], map_opts)
    vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], map_opts)
    vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], map_opts)
    vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], map_opts)
-- Database completion setup for SQL files
autocmd("FileType", {
  pattern = { "sql", "mysql", "plsql" },
  callback = function()
    local cmp = require("cmp")
    cmp.setup.buffer({
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
      },
    })
  end,
})

-- Diff view highlight overrides
autocmd("ColorScheme", {
  callback = function()
    local colors = {
      '#1a1b26', -- [1] background
      '#f7768e', -- [2] red (deletions)
      '#9ece6a', -- [3] green (additions)
      '#7aa2f7', -- [4] blue (changes)
      '#e0af68', -- [5] yellow
      '#bb9af7', -- [6] purple (selected)
      '#7dcfff', -- [7] cyan
      '#ff9e64', -- [8] orange (untracked)
      '#565f89', -- [9] comment/dim (ignored/separator)
    }

    vim.api.nvim_set_hl(0, 'DiffAdd',    { bg = '#34462F' })
    vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#462F2F' })
    vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#2F4146' })
    vim.api.nvim_set_hl(0, 'DiffText',   { bg = '#463C2F' })

    vim.api.nvim_set_hl(0, 'DiffAdded',   { fg = colors[3], bold = true })
    vim.api.nvim_set_hl(0, 'DiffRemoved', { fg = colors[2], bold = true })
    vim.api.nvim_set_hl(0, 'DiffChanged', { fg = colors[4], bold = true })

    vim.api.nvim_set_hl(0, 'DiffviewWinSeparator',      { fg = colors[9] })
    vim.api.nvim_set_hl(0, 'DiffviewDiffDelete',         { fg = colors[9] })
    vim.api.nvim_set_hl(0, 'DiffviewFilePanelSelected',  { fg = colors[6] })

    vim.api.nvim_set_hl(0, 'DiffviewStatusAdded',     { fg = colors[3], bold = true })
    vim.api.nvim_set_hl(0, 'DiffviewStatusUntracked', { fg = colors[8], bold = true })
    vim.api.nvim_set_hl(0, 'DiffviewStatusModified',  { fg = colors[4], bold = true })
    vim.api.nvim_set_hl(0, 'DiffviewStatusRenamed',   { fg = colors[3], bold = true })
    vim.api.nvim_set_hl(0, 'DiffviewStatusDeleted',   { fg = colors[2], bold = true })
    vim.api.nvim_set_hl(0, 'DiffviewStatusIgnored',   { fg = colors[9], bold = true })
  end,
})

-- Close certain filetypes with q
autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
