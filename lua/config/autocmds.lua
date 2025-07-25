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