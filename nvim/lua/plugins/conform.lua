return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        -- yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" }, -- config file: ~/.stylua.toml
        sh = { "shfmt" },
        -- python = { "black" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" }, -- 4 spaces indentation
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
