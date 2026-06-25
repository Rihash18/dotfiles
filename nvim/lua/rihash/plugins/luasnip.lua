return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  config = function()
    local luasnip = require("luasnip")
    -- jump to next argument
    vim.keymap.set({ "i", "s" }, "<Tab>", function()
      if luasnip.jumpable(1) then luasnip.jump(1) end
    end)
    -- jump to previous argument
    vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
      if luasnip.jumpable(-1) then luasnip.jump(-1) end
    end)
  end,
}
