return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    opts = {
        options = {
            mode = "buffers",
            separator_style = "thin",
            always_show_bufferline = true,
            sort_by = "insert_after_current",

            show_buffer_close_icons = true,
            show_close_icon = false,

            diagnostics = "nvim_lsp",
        },
    },
}
