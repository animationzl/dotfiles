return {
  "folke/flash.nvim",
  opts = {
    modes = {
      char = {
        jump_labels = true, -- Show jump labels for character motions
        multi_line = false, -- Restrict f/t/F/T to single-line jumps by default
        label = { exclude = "hjkliardcy" }, -- When using jump labels, don't use these keys
      },
    },
  },
}
