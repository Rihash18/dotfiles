return {
    "nvim-telescope/telescope.nvim",
    version = "*",

    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-ui-select.nvim",
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                prompt_prefix = "   ",
                selection_caret = " ",
                path_display = { "smart" },
                layout_config = {
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    },
                    -- n = {
                    --     ["<esc>"] = actions.close,
                    -- },
                }
            },

            pickers = {
                colorscheme = {
                    enable_preview = true, -- Live preview while moving
                },
            },

            extensions = {
                ["ui-select"] = require("telescope.themes").get_dropdown({
                    previewer = false,
                    winblend = 10,
                }),
            },
        })

        -- Load extensions
        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
        telescope.load_extension("notify")

        -- Keymaps
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })

        -- Theme picker with live preview
        vim.keymap.set("n", "<leader>ft", builtin.colorscheme, { desc = "Themes" })

        --Notification keymaps
        vim.keymap.set("n", "<leader>fn", "<cmd>Telescope notify<CR>", { desc = "Find Notifications" })
        vim.keymap.set("n", "<leader>cn", "<cmd>NotificationsClear<CR>", { desc = "Clear Notifications History" })
    end,
}
