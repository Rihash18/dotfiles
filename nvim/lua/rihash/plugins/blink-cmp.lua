return {
  "saghen/blink.cmp",
  version = "1.*",

  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },

  opts = {
    keymap = {
      preset = "super-tab",
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
