
local local_plugins = {
    {
        "ThePrimeagen/harpoon",
        config = function()
            local harpoon = require("harpoon")
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            harpoon.setup()

            vim.keymap.set("n", "<leader>a", mark.add_file) -- Add current file to harpoon
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu) -- Open harpoon menu

            -- Navigate to specific harpoon files
            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
        end
    },
    {
        "ThePrimeagen/vim-apm",
        config = function()
            -- Uncomment and configure if you want to use vim-apm
            -- local apm = require("vim-apm")
            -- apm.setup({})
            -- vim.keymap.set("n", "<leader>apm", function() apm:toggle_monitor() end)
        end
    },
    {
        "ThePrimeagen/vim-with-me",
        config = function()
            -- Additional configurations for vim-with-me can go here
        end
    },
}

return local_plugins
