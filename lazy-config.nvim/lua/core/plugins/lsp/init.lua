local M = {}

local pwd = ...

require(pwd .. ".config")
-- require("core.plugins.lsp.signature")
-- require("core.plugins.lsp.inc-rename")
-- require("core.plugins.lsp.trouble")


M.spec = {
  {
    'junnplus/lsp-setup.nvim',
    requires = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim', -- optional
        'williamboman/mason-lspconfig.nvim', -- optional
    },
    config = function()
      require('lsp-setup').setup({
        default_mappings = false,
        inlay_hints = {
          enabled = true,
        },
        servers = {
          tsserver = {
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = 'all',
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = false,
                  includeInlayVariableTypeHints = false,
                  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                }
              },
            }
          },
          gopls = {
            settings = {
              gopls = {
                hints = {
                  rangeVariableTypes = true,
                  parameterNames = true,
                  constantValues = true,
                  assignVariableTypes = true,
                  compositeLiteralFields = true,
                  compositeLiteralTypes = true,
                  functionTypeParameters = true,
                },
              },
            },
          },
          rust_analyzer = {
            settings = {
              ['rust-analyzer'] = {
                inlayHints = {
                  bindingModeHints = { enable = false, },
                  chainingHints = { enable = true, },
                  closingBraceHints = { enable = true, minLines = 25, },
                  closureReturnTypeHints = { enable = 'never', },
                  lifetimeElisionHints = { enable = 'never', useParameterNames = false, },
                  maxLength = 25,
                  parameterHints = { enable = true, },
                  reborrowHints = { enable = 'never', },
                  renderColons = true,
                  typeHints = {
                    enable = true,
                    hideClosureInitialization = false,
                    hideNamedConstructor = false,
                  },
                }
              },
            },
          },
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = require(pwd .. ".setup").setup,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "b0o/SchemaStore.nvim",
      "jose-elias-alvarez/typescript.nvim",
      "simrat39/symbols-outline.nvim",
      "ray-x/lsp_signature.nvim",
      "smjonas/inc-rename.nvim",
      {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
      },
      "gpanders/editorconfig.nvim",
      "folke/trouble.nvim",
      "simrat39/rust-tools.nvim",
    }
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jayp0521/mason-null-ls.nvim",
    },
    -- config = require(pwd .. ".null-ls").setup
  },

  {
    'kosayoda/nvim-lightbulb',
    dependencies = {
      'antoinemadec/FixCursorHold.nvim',
    },
    config = function()
      require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
    end
  },

  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup()
    end,
  },

  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function ()
      require("barbecue").setup()
    end
  },
}

return M
