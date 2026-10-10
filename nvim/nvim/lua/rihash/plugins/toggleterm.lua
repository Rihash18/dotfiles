return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 10,
        open_mapping = nil,
        direction = "horizontal",
        start_in_insert = true,
        persist_size = true,
        persist_mode = true,
        shell = vim.o.shell,
        hide_numbers = true,
        close_on_exit = false,
        shade_terminals = true,
        shading_factor = 2,
        float_opts = {
          border = "rounded",
        },
      })

      vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", {
        desc = "Toggle terminal",
        silent = true,
      })

      vim.keymap.set("t", "fj", [[<C-\><C-n>]], {
        desc = "Escape terminal mode",
        silent = true,
      })

      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {
        desc = "Exit terminal mode",
        silent = true,
      })
    end,
  },
}
