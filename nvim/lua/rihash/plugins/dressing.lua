--floating window for input prompts like renaming files & creating files
return {
  "stevearc/dressing.nvim",
  opts = {
    select = { enabled = false }, -- disable dressing's select since telescope-ui-select already does it
    input = { enabled = true },   -- only use dressing for input prompts
  },
}
