require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "dart", "lua", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

local kommentary_config =require('kommentary.config')

kommentary_config.configure_language("dart", {
  prefer_single_line_comments = true,
})

local opt = {
  noremap = true,
  silent = true,
}

local map = vim.api.nvim_set_keymap


map("n", "gcc", "<Plug>kommentary_line_default", {})
map("n", "gc", "<Plug>kommentary_motion_default", {})
map("v", "gc", "<Plug>kommentary_visual_default<C-c>", {})


local lsp = require("lspconfig")
local coq = require("coq")
lsp.dartls.setup(coq.lsp_ensure_capabilities())

map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opt)
map("n", "gm", ":lua vim.lsp.buf.code_action()<CR>", opt)
map("n", "gr", ":lua vim.lsp.buf.rename()<CR>", opt)
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opt)
map("n", "gf", ":lua vim.lsp.buf.formatting()<CR>", opt)
map("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opt)
