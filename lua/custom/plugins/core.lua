return {
    { "NMAC427/guess-indent.nvim", config = function() require('guess-indent').setup {} end },
    { "lewis6991/gitsigns.nvim", config = function() require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      } end },
    { "folke/which-key.nvim", event = "VeryLazy", config = function() require('which-key').setup {
        delay = 0,
        icons = { mappings = vim.g.have_nerd_font },
        spec = {
          { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
          { '<leader>t', group = '[T]oggle' },
          { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
          { 'gr', group = 'LSP Actions', mode = { 'n' } },
        },
      } end },
    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
    { 'echasnovski/mini.nvim', config = function()
        require('mini.ai').setup { mappings = { around_next = 'aa', inside_next = 'ii' }, n_lines = 500 }
        require('mini.surround').setup()
        local statusline = require 'mini.statusline'
        statusline.setup { use_icons = vim.g.have_nerd_font }
        statusline.section_location = function() return '%2l:%-2v' end
      end
    },
    -- Telescope
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
      config = function()
        require('telescope').setup { extensions = { ['ui-select'] = { require('telescope.themes').get_dropdown() } } }
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')
      end },
    -- LSP
    { 'neovim/nvim-lspconfig', dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'WhoIsSethDaniel/mason-tool-installer.nvim', 'j-hui/fidget.nvim' },
      config = function()
        require('fidget').setup {}
        require('mason').setup {}
        require('mason-tool-installer').setup { ensure_installed = { 'stylua', 'lua_ls' } }
      end },
    { 'stevearc/conform.nvim', opts = { formatters_by_ft = {} } },
    -- Autocomplete
    { 'L3MON4D3/LuaSnip', version = '2.*' },
    { 'saghen/blink.cmp', version = '1.*', opts = { sources = { default = { 'lsp', 'path', 'snippets' } }, snippets = { preset = 'luasnip' } } },
    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function()
        require('nvim-treesitter.config').setup {
          ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
          highlight = { enable = true },
          auto_install = true,
        }
      end
    },
}
