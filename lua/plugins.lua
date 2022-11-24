local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use {'jonathanfilip/vim-lucius', config = function()
    vim.cmd [[colorscheme lucius]]
  end}

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    end
  }

  -- LSP related
  use 'neovim/nvim-lspconfig'
  use {'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  }
  use {'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup()
    end
  }
  use {"hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
        })
      })
      vim.api.nvim_create_autocmd("ColorScheme", {
          group = vim.api.nvim_create_augroup("visible_cmp_kind", { clear = true }),
          pattern = "*",
          command = "highlight CmpItemKind guifg=blue"
      })
    end
  }
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use 'hrsh7th/cmp-path'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
