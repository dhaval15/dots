require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    find_files = {
      theme = "ivy",
    },
    git_files = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
    },
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
		file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
  }
}

require("telescope").load_extension("ui-select")
require("telescope").load_extension("file_browser")

local opt = {
  noremap = true,
  silent = true,
}

local map = vim.api.nvim_set_keymap

map("n", "<leader>e", ":Telescope find_files<CR>", opt)
map("n", "<leader>f", ":Telescope file_browser<CR>", opt)
map("n", "<leader>b", ":Telescope buffers<CR>", opt)
map("n", "<leader>g", ":Telescope git_files<CR>", opt)
