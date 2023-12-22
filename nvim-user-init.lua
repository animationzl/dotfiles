return {
  options = {
    opt = {
      cmdheight = 1, -- number of screen lines to use for the command-line
      scrolloff = 99, -- make cursor line always be in the middle of the window
      shiftwidth = 4, -- number of space inserted for indentation
      tabstop = 4, -- number of space in a tab
      relativenumber = false, -- do not show relative numberline
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
  },
}
