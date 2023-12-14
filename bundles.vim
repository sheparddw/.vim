:lua << END

-- Plugin manager
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP support
    "neovim/nvim-lsp",
    "neovim/nvim-lspconfig",
    "kosayoda/nvim-lightbulb",

    -- Dev Containers
    "nvim-treesitter/nvim-treesitter",
    { "https://codeberg.org/esensar/nvim-dev-container" },

    -- Appearance
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
    "vim-airline/vim-airline",
    "vim-airline/vim-airline-themes",
    "edkolev/tmuxline.vim",
    "ryanoasis/vim-devicons",
    "tpope/vim-fugitive",
    "ruifm/gitlinker.nvim",
    "APZelos/blamer.nvim",
    "Yggdroot/indentLine",
    "Osse/double-tap",

    -- General Customization
    -- { "neoclide/coc.nvim", merged = false },
    "roxma/nvim-yarp",
    "roxma/vim-hug-neovim-rpc",
    "Shougo/neco-syntax",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    "kyazdani42/nvim-web-devicons",
    "mbbill/undotree",
    -- "scrooloose/nerdtree.git",
    "nvim-tree/nvim-tree.lua",
    "dominikduda/vim_current_word",

    -- Syntax
    "w0rp/ale",
    "rhysd/vim-lsp-ale",
    "mattn/emmet-vim",
    "Raimondi/delimitMate",
    "scrooloose/nerdcommenter",
    "Valloric/MatchTagAlways",
    "alvan/vim-closetag",
    "2072/PHP-Indenting-for-VIm",
    "StanAngeloff/php.vim",
    "elzr/vim-json",
    "pangloss/vim-javascript",
    "jelera/vim-javascript-syntax",
    "mtscout6/syntastic-local-eslint.vim",
    "xsbeats/vim-blade",
    { "mxw/vim-jsx", autoload = { filetypes = {"javascript"} } },
    "ianks/vim-tsx",
    "leafgarland/typescript-vim",
    "github/copilot.vim",
    "madox2/vim-ai",
    "MunifTanjim/nui.nvim",
    "dpayne/CodeGPT.nvim",
    "MarcWeber/vim-addon-mw-utils",
    "tomtom/tlib_vim",
    "honza/vim-snippets",
    -- Run tests
    { "nvim-neotest/neotest-plenary" },
    'haydenmeade/neotest-jest',
    { 
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim"
      }
    },
    -- Leader help
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {}
    },
})
-- 
  -- require("lazy").setup({
    -- spec = {
      -- {"neovim/nvim-lspconfig"}
    -- }
  -- })

  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.pyright.setup{}

  -- require('telescope').load_extension('fzf')
  require("nvim-tree").setup()
END
