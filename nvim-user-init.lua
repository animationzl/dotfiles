return {
  options = {
    opt = {
      cmdheight = 1, -- number of screen lines to use for the command-line
      shiftwidth = 4, -- number of space inserted for indentation
      tabstop = 4, -- number of space in a tab
      relativenumber = false, -- do not show relative numberline
    },
  },
  mappings = {
    n = {
      ["<s-leftmouse>"] = { function() require("telescope.builtin").lsp_definitions() end },
      ["<s-rightmouse>"] = { function() require("telescope.builtin").lsp_references() end },
    },
  },
  plugins = {
    {
      "junegunn/vim-easy-align",
      lazy = false,
      keys = {
        { "<cr>", "<Plug>(EasyAlign)", mode = { "v" } },
      },
    },
    {
      "ggandor/leap.nvim",
      lazy = false,
      config = function()
        vim.keymap.set({"n", "v"}, "s", function ()
          local current_window = vim.fn.win_getid()
          require('leap').leap { target_windows = { current_window } }
        end)
      end,
    },
    {
      "navarasu/onedark.nvim",
      name = "onedark",
      opts = {
        style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      },
    },
  },
  colorscheme = "onedark",
}
