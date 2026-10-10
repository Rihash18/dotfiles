return {
    'rcarriga/nvim-notify',

    config = function()
        local notify = require("notify")
        vim.notify = notify     --replaces default vim.notify

        notify.setup({
            background_colour = "#000000",
            render = "simple",
            timeout = 3000,
            fps = 60,
            top_down = false,
            stages = "fade_in_slide_out",

            --notify does auto resizing, so no neeeded fixed width and height
            -- nvim_open_win = {
            --     message = {
            --         width = ,
            --         height = ,
            --     }
            -- }
        })

    end,
}

