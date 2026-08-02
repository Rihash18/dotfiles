-- It can show:
-- 🔴 Diagnostics (errors and warnings from the LSP)
-- 🟢 Git changes (added, modified, deleted lines)
-- 🔍 Search matches
-- 📍 Current cursor position
-- 📌 Marks (if enabled)
-- scroll bar on the rightside 

return{
    "lewis6991/satellite.nvim",
    opts = {
        handlers = {
            cursor = {},
            diagnostic = {},
            search = {},
        },
    },
}
