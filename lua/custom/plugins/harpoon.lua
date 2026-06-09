return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup({})
    -- REQUIRED

    -- Legacy Keymaps
    vim.keymap.set("n", "<leader>jj", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle Harpoon Menu" })

    vim.keymap.set("n", "<leader>jk", function()
        harpoon:list():add()
    end, { desc = "Mark File" })

    vim.keymap.set("n", "<leader>jl", function()
        harpoon:list():next()
    end, { desc = "Next Window" })

    vim.keymap.set("n", "<leader>jh", function()
        harpoon:list():prev()
    end, { desc = "Previous Window" })
  end
}
