return {
  "neovim/nvim-lspconfig",

  -- Load before opening or creating a file
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    { "saghen/blink.cmp" },
  },

  config = function()
    local keymap = vim.keymap

    -- Tell every LSP server that Blink provides completion capabilities
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    ----------------------------------------------------------------------
    -- LSP Keymaps (available only when an LSP attaches to the current file)
    ----------------------------------------------------------------------
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),

      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        --------------------
        -- Navigation
        --------------------
        opts.desc = "Go to Definition"
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        opts.desc = "Go to Declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Hover Documentation"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Find References"
        keymap.set("n", "gr", vim.lsp.buf.references, opts)

        opts.desc = "Go to Implementation"
        keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

        --------------------
        -- Refactoring
        --------------------
        opts.desc = "Rename Symbol"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Code Actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        --------------------
        -- Diagnostics
        --------------------
        opts.desc = "Show Line Diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Previous Diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Next Diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        --------------------
        -- Utilities
        --------------------
        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
      end,
    })

    ----------------------------------------------------------------------
    -- Diagnostic signs shown in the sign column
    ----------------------------------------------------------------------
    local signs = {
      Error = "󰅚 ",
      Warn = "󰀪 ",
      Hint = "󰌶 ",
      Info = "󰋽 ",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type

      vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = "",
      })
    end

    ----------------------------------------------------------------------
    -- Diagnostic UI configuration
    ----------------------------------------------------------------------
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        spacing = 2,
      },
      signs = true,
      underline = true,
      severity_sort = true,
      update_in_insert = false,
      float = {
        border = "rounded",
        source = "if_many",
      },
    })

    ----------------------------------------------------------------------
    -- Helper function to reduce repetition
    ----------------------------------------------------------------------
    local function enable(server, opts)
      opts = opts or {}
      opts.capabilities = capabilities

      vim.lsp.config(server, opts)
      vim.lsp.enable(server)
    end

    ----------------------------------------------------------------------
    -- Language Servers
    ----------------------------------------------------------------------

    -- C / C++
    enable("clangd", {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--fallback-style=llvm",
      },
    })

    -- Python
    enable("pyright")

    -- Java
    enable("jdtls")

    -- JavaScript / TypeScript
    enable("ts_ls")

    -- HTML
    enable("html")

    -- CSS
    enable("cssls")

    -- Assembly
    enable("asm_lsp")
  end,
}
