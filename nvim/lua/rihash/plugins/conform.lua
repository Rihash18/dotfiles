-- conform.nvim: runs external formatter binaries on your buffer before saving
return {
  "stevearc/conform.nvim",

  -- only load this plugin when a buffer is about to be written
  -- "BufWritePre" fires just before :w saves the file
  event = "BufWritePre",

  opts = {

    -- maps filetypes to the formatter binary that should handle them
    -- conform runs them in order if you list multiple (e.g. isort then black)
    -- if the binary isn't installed, conform silently skips it
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      java = { "google-java-format" },
    },

    -- automatically format when you save (:w)
    format_on_save = {
      -- if formatting takes longer than this, cancel it (in milliseconds)
      timeout_ms = 500,

      -- if no formatter is set for a filetype, try the LSP's built-in formatter
      -- useful for languages where the LSP itself can format (e.g. clangd for C)
      lsp_fallback = true,
    },

    -- per-formatter configuration
    -- this is where you set indentation, style rules, etc. per language
    formatters = {

      -- clang-format config for C/C++
      ["clang-format"] = {
        prepend_args = {
          "--style={IndentWidth: 4, TabWidth: 4, UseTab: Never}",
          -- IndentWidth: how many spaces per indent level
          -- UseTab: ForIndentation = use actual tab characters (set Never for spaces)
        },
      },

      -- stylua config for Lua
      stylua = {
        prepend_args = {
          "--indent-type",
          "Spaces", -- use spaces, not tabs
          "--indent-width",
          "2", -- 2 spaces per indent level
        },
      },

      -- prettier config for JS/TS/HTML/CSS/JSON
      prettier = {
        prepend_args = {
          "--tab-width",
          "2", -- 2 spaces per indent
          "--single-quote", -- use single quotes in JS
          "--trailing-comma",
          "all", -- trailing commas everywhere valid
        },
      },
    },
  },

  -- keybind to manually format without saving
  -- useful when you want to format but not write the file yet
  --keys = {
  --   {
  --     "<leader>f",
  --     function() require("conform").format({ async = true, lsp_fallback = true }) end,
  --     desc = "Format buffer",
  --   },
  -- },
}
