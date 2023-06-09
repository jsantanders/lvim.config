--
-- Lualine configuration
--
require "user.plugins.lualine"
--
-- Enable autopairs
lvim.builtin.autopairs.active = true

--
-- Additional plugins
--
lvim.plugins = {
  --
  -- Diagnostics
  --
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("user.plugins.trouble").config()
    end,
    event = "BufWinEnter",
    cmd = "TroubleToggle",
  },
  --
  -- The Primeagen: Harpoon
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("user.plugins.harpoon").config()
    end,
    event = "BufWinEnter",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
  },
  --
  -- Themes
  --
  --[[ Using Tokyonight for now
  {
    "andersevenrud/nordic.nvim",
    config = function()
      require("user.themes.nordic").config()
    end,
    conditions = function()
      return lvim.colorscheme == "nordic"
    end,
  },
  --]]
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
  {
    "PasiBergman/cmp-nuget",
    event = "BufWinEnter",
    config = function()
      local cmp_nuget = require "cmp-nuget"
      cmp_nuget.setup {}
      -- Insert 'nuget' source before 'buffer'
      table.insert(lvim.builtin.cmp.sources, 6, {
        name = "nuget",
        keyword_length = 0,
      })
      lvim.builtin.cmp.formatting.source_names["nuget"] = "[NuGet]"
    end,
  },
  {
    "David-Kunz/cmp-npm",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local cmp_npm = require "cmp-npm"
      cmp_npm.setup {}
      -- Insert 'npm' source before 'buffer'
      table.insert(lvim.builtin.cmp.sources, 7, {
        name = "npm",
        keyword_length = 3,
      })
      lvim.builtin.cmp.formatting.source_names["npm"] = "[NPM]"
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("user.plugins.todo-comments").config()
    end,
  },
  --
  -- Github Copilot
  --[[
  {
    "github/copilot.vim",
    config = function()
      require("user.plugins.copilot").config_vim()
    end,
  },
  --]]
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("user.plugins.copilot").config_lua()
      end, 100)
    end,
  },
  --
  -- LSP Overloads Nvim
  -- Native LSP signatureHelper handler doesn't provide an easy way to view all
  -- the possible overloads and parameter details for signatures
  --
  -- See lua/users/lsp/init.lua for configuration
  {
    event = "BufRead",
    "Issafalcon/lsp-overloads.nvim",
  },
  --
  -- fidget.nvim: Standalone UI for nvim-lsp progress.
  --
  {
    "j-hui/fidget.nvim",
    event = "BufRead",
    config = function()
      require("fidget").setup {}
    end,
  },
  --
  -- Undotree
  --
  {
    "mbbill/undotree",
    event = "BufRead",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  --
  -- EditorConfig support
  --
  {
    "gpanders/editorconfig.nvim",
    event = "BufRead",
    --[[
    config = function()
      -- Custom properties can be added through the properties table:
      require('editorconfig').properties.foo = function(bufnr, val)
        vim.b[bufnr].foo = val
      end
    end,
    --]]
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup(
        { "css", "scss", "sass", "html", "javascript", "lua", "vue", "astro", "typescriptreact", "javascriptreact" },
        {
          RGB = true,      -- #RGB hex codes
          RRGGBB = true,   -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true,   -- CSS rgb() and rgba() functions
          hsl_fn = true,   -- CSS hsl() and hsla() functions
          css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
        }
      )
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    version = 'v0.0.7',
    config = function()
      require('github-theme').setup({
        theme_style = "dark",
        function_style = "italic",
        sidebars = { "qf", "vista_kind", "terminal", "packer" },
      })
    end
  },
  {
    "catppuccin/nvim", name = "catppuccin"
  },
  {
    'wakatime/vim-wakatime'
  },
  {
    "f-person/git-blame.nvim"
  },
  {
    "fedepujol/move.nvim"
  },
}
