--floating window for input prompts like renaming files & creating files
return {
  "stevearc/dressing.nvim",

  opts = {
    select = {
      enabled = false,
    },

    input = {
      enabled = true,

      mappings = {
        i = {
          ["esc"] = "Close",
        },
      },
    },
  },
}
