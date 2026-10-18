-- syntax highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    -- Install parsers
    ts.install({
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "python",
      "javascript",
      "html",
      "css",
      "go",
      "markdown",
      "markdown_inline",
      "mermaid",
    })

    -- Enable Treesitter highlighting and indent on FileType
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        -- Disable for files larger than 100 KB
        local max_filesize = 100 * 1024
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
        if ok and stats and stats.size > max_filesize then
          return
        end

        -- Start Neovim's native treesitter highlighting
        pcall(vim.treesitter.start, args.buf)

        -- Enable treesitter indentation
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
