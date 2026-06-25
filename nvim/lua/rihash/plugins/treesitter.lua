return {
 "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local disable_markdown = vim.fn.has("nvim-0.12") == 1

    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.config")

    -- nvim-treesitter ships a Haskell parser, but not separate parsers for
    -- literate Haskell or Cabal files.
    vim.treesitter.language.register("haskell", "lhaskell")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
        disable = disable_markdown and { "markdown", "markdown_inline" } or {},
      },
      -- Treesitter indent can override normal `o`/`O` newline indent behavior.
      indent = { enable = false },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "cpp",
        "haskell",
        "gdscript",
        "gdshader",
        "godot_resource",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
