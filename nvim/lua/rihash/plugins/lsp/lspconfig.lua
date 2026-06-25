return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- connects LSP completions to nvim-cmp
  },
  config = function()
    local keymap = vim.keymap

    -- keymaps when LSP attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Go to definition"
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show documentation"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    -- tell LSP about nvim-cmp's extra capabilities
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- diagnostic icons in the sign column
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- how diagnostics look inline
    vim.diagnostic.config({
      virtual_text = { prefix = "●", spacing = 2 },
      signs = true,
      underline = true,
      update_in_insert = false, -- don't show errors while typing
      severity_sort = true,
    })

    -- clangd for C/C++
    vim.lsp.config("clangd", {
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--background-index", -- indexes your project in background
        "--clang-tidy", -- enables clang-tidy linting
        "--fallback-style=llvm", -- fallback indent style (we'll override below)
      },
    })
    vim.lsp.enable("clangd")

    -- Python
    vim.lsp.config("pyright", { capabilities = capabilities })
    vim.lsp.enable("pyright")

    -- Java
    vim.lsp.config("jdtls", { capabilities = capabilities })
    vim.lsp.enable("jdtls")

    -- JavaScript/TypeScript
    vim.lsp.config("ts_ls", { capabilities = capabilities })
    vim.lsp.enable("ts_ls")

    -- HTML
    vim.lsp.config("html", { capabilities = capabilities })
    vim.lsp.enable("html")
  end,
}
