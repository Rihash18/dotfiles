local M = {}

local theme_file = vim.fn.stdpath("data").."/last_theme"

--save the current theme in ~/.local/share/nvim/last_theme
function M.save(theme)
    local file = io.open(theme_file, "w")
    if file then 
        file:write(theme)
        file:close()
    end
end

--read the theme_file and load that theme 
function M.load()
    local file = io.open(theme_file, "r")

    if file then
        local theme = file:read("*l") --read one line
        file:close()
    end

    if theme then
        local ok = pcall(vim.cmd.colorscheme, theme)

        if ok then
            return
        end
    end

end

--if no theme is saved means load default koda theme
vim.cmd.colorscheme("koda")

return M


