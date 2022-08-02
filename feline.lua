-- feline is a status bar
-- local navic = require("nvim-navic")
-- local components = {
--     active = {},
--     inactive = {}
-- }
-- -- Insert three sections (left, mid and right) for the active statusline
-- table.insert(components.active, {})
-- table.insert(components.active, {})
-- table.insert(components.active, {})
--
-- -- Insert two sections (left and right) for the inactive statusline
-- table.insert(components.inactive, {})
-- table.insert(components.inactive, {})

-- Now you can add statusline components to each of those sections by adding elements to the sections. For example:
-- table.insert(components.active[1], {
--     provider = function()
--         return navic.get_location()
--     end,
--     enabled = function()
--         return navic.is_available()
--     end
-- })

-- require("feline").setup({components = components})
require("feline").setup()
