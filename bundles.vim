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
    -- Shows LSP Status
    "j-hui/fidget.nvim",
    -- Manage LSPs
    "williamboman/mason.nvim",

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
    -- cd ~/.local/share/nvim/lazy/coc.nvim/ && yarn && yarn build
    { "neoclide/coc.nvim", merged = false },
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
    "numToStr/Comment.nvim",
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
    -- "madox2/vim-ai",
    -- "dpayne/CodeGPT.nvim",
    "MunifTanjim/nui.nvim",
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      branch = "canary",
      dependencies = {
        { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
      },
      opts = {
        debug = true, -- Enable debugging
        -- See Configuration section for rest
      },
      -- See Commands section for default commands if you want to lazy load on them
    },
    "MarcWeber/vim-addon-mw-utils",
    "tomtom/tlib_vim",
    "honza/vim-snippets",
    {
      "mg979/vim-visual-multi",
      lazy = false,
      init = function()
		    vim.g.VM_maps = { 
            ["Find Under"] = "<C-d>"
        }
	    end,
    },
    -- TODO: Comments
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("todo-comments").setup()
      end,
    },
    -- Run tests
    "haydenmeade/neotest-jest",
    "nvim-neotest/neotest-python",
    { 
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "haydenmeade/neotest-jest",
        "nvim-neotest/neotest-python",
      },
          opts = function()
      return {
        -- your neotest config here
        adapters = {
          require "neotest-python",
          require "neotest-jest",
        },
      }
    end,
    config = function(_, opts)
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup(opts)
    end,
    },
    "nvim-neotest/neotest-plenary",
    -- Debugging
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    "theHamsta/nvim-dap-virtual-text",
    "jay-babu/mason-nvim-dap.nvim",
    "folke/neodev.nvim",
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

 require('lspconfig').tsserver.setup({
    init_options = { 
      preferences = { 
        importModuleSpecifierPreference = 'non-relative', 
        importModuleSpecifierEnding = 'minimal', 
      },  
    } 
  }) 

  require'lspconfig'.pyright.setup{}
  require('Comment').setup()

  require("dapui").setup()
  -- require('telescope').load_extension('fzf')
  require("nvim-tree").setup()
  require("mason").setup()
  -- Testing
  require("neotest").setup({
    adapters = {
      require("neotest-python"),
      require('neotest-jest')({
        jestCommand = "jest --watch",
        jestConfig = "jest.config.js",
        env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      }),
    },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last Test",
      },
      {
        "<leader>tL",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Debug Last Test",
      },
      {
        "<leader>tw",
        "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
        desc = "Run Watch",
      },
    },
  })


END
