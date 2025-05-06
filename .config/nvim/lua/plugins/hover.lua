return {
  "lewis6991/hover.nvim",
  config = function()
    require("hover").setup({
      init = function()
        -- Require providers
        require("hover.providers.lsp")
      end,
      preview_opts = {
        border = "single",
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = false,
      title = false,
      mouse_providers = {
        "LSP",
      },
      mouse_delay = 500,
    })

    -- Mouse support
    vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
    vim.o.mousemoveevent = true
  end,
}
