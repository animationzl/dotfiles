return {
  "folke/noice.nvim",
  opts = {
    routes = {
      {
        filter = {
          find = "No results found for `lsp_definitions`", -- 匹配提示中的关键词
        },
        opts = { skip = true }, -- 跳过这些消息
      },
    },
  },
}
