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
    "junegunn/vim-easy-align",
    lazy = false,
    config = function()
      vim.keymap.set("v", "<cr>", "<Plug>(EasyAlign)")
    end,
  },
  plugins = {
    "easymotion/vim-easymotion",
    lazy = false,
    config = function()
      vim.g.EasyMotion_do_mapping = 0
      vim.g.EasyMotion_smartcase = 1
      vim.keymap.set({"n", "v"}, "f", "<Plug>(easymotion-sl)")
      vim.keymap.set({"n", "v"}, "s", "<Plug>(easymotion-s2)")
    end,
  },
}
