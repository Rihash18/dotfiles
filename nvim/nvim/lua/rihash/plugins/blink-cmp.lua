return {
  "saghen/blink.cmp",
  version = "1.*",

  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },

  opts = {
    keymap = {
      preset = "none",
        ['<S-K>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },

        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' }, -- shows arguments of functions
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },

      ghost_text = {
        enabled = true,
      },

      documentation = {
        auto_show = false,
        window = {
          border = "rounded",
        },
      },

      menu = {
        border = "rounded",

        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "source_name" },
          },

          components = {
            source_name = {
              width = { max = 8 },

              text = function(ctx)
                local labels = {
                  lsp = "󰒋 LSP",
                  buffer = "󰦨 BUF",
                  snippets = " SNIP",
                  path = "󰉋 PATH",
                }

                return labels[ctx.source_name] or ctx.source_name
              end,

              highlight = "Comment",
            },
          },
        },
      },
    },

    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },

    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
    },

    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
}
