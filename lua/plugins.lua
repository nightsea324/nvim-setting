-- ─── Bootstrap lazy.nvim ─────────────────────────────────────────────────────
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- ─── Icons ─────────────────────────────────────────────────────────────────
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- ─── Statusline ────────────────────────────────────────────────────────────
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function()
      require('lualine').setup({
        options = {
          theme = 'auto',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            },
            'encoding', 'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'location' },
        },
      })
    end,
  },

  -- ─── Dashboard ─────────────────────────────────────────────────────────────
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.header.val = {
        '                                ',
        '  ┌─┐┬┌─┐┬ ┬┌┬┐┌─┐┌─┐┌─┐      ',
        '  │││││ ┬├─┤ │ └─┐├┤ ├─┤      ',
        '  ┘└┘┴└─┘┴ ┴ ┴ └─┘└─┘┴ ┴      ',
        '                                ',
      }

      dashboard.section.buttons.val = {
        dashboard.button('f', '  Find file',       '<Cmd>Telescope find_files<CR>'),
        dashboard.button('r', '  Recent files',    '<Cmd>Telescope oldfiles<CR>'),
        dashboard.button('g', '  Live grep',       '<Cmd>Telescope live_grep<CR>'),
        dashboard.button('e', '  File browser',    '<Cmd>Telescope file_browser path=%:p:h<CR>'),
        dashboard.button('n', '  New file',        '<Cmd>ene<CR>'),
        dashboard.button('q', '  Quit',            '<Cmd>qa<CR>'),
      }

      dashboard.section.footer.val = ''

      dashboard.section.header.opts.hl = 'Function'
      dashboard.section.buttons.opts.hl = 'Keyword'

      require('alpha').setup(dashboard.config)
    end,
  },

  -- ─── Treesitter ────────────────────────────────────────────────────────────
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      ensure_installed = {
        'vue', 'typescript', 'javascript', 'tsx',
        'html', 'css', 'scss', 'json', 'yaml',
        'lua', 'bash',
        'graphql', 'go',
        'markdown', 'markdown_inline',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- ─── Auto tag & pairs ──────────────────────────────────────────────────────
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = true,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt' },
      })
    end,
  },

  -- ─── Color preview ─────────────────────────────────────────────────────────
  {
    'norcalli/nvim-colorizer.lua',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('colorizer').setup()
    end,
  },

  -- ─── Indent guides ─────────────────────────────────────────────────────────
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    main = 'ibl',
    config = function()
      require('ibl').setup({
        indent = { char = '▏' },
        scope = { enabled = true },
      })
    end,
  },

  -- ─── Comments ──────────────────────────────────────────────────────────────
  -- gcc → line comment, gc (visual) → block comment
  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gcc', mode = 'n' },
      { 'gc',  mode = { 'n', 'v' } },
    },
    config = true,
  },

  -- ─── Git ───────────────────────────────────────────────────────────────────
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('gitsigns').setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 150,
          virt_text_pos = 'eol',
        },
        current_line_blame_formatter = '<committer> - <summary>, <author_time:%Y/%m/%d %H:%M>.',
      })
    end,
  },

  -- ─── Telescope + File Browser ──────────────────────────────────────────────
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    cmd = 'Telescope',
    keys = {
      { '<space>f',  function() require('telescope.builtin').find_files() end,                                  desc = 'Find files' },
      { ';r',        function() require('telescope.builtin').live_grep() end,                                   desc = 'Live grep' },
      { '\\\\',      function() require('telescope.builtin').buffers({ initial_mode = 'normal' }) end,          desc = 'Buffers' },
      { ';;',        function() require('telescope.builtin').resume({ initial_mode = 'normal' }) end,           desc = 'Resume' },
      { ';e',        function() require('telescope.builtin').diagnostics({ initial_mode = 'normal' }) end,      desc = 'Diagnostics' },
      {
        '<space>ef',
        function()
          require('telescope').extensions.file_browser.file_browser({
            path = '%:p:h',
            cwd = vim.fn.expand('%:p:h'),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = 'normal',
            layout_strategy = 'center',
            layout_config = { height = 40, width = 90 },
          })
        end,
        desc = 'File browser (float)',
      },
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local fb_actions = require('telescope._extensions.file_browser.actions')

      telescope.setup({
        defaults = {
          scroll_strategy = 'limit',
          file_ignore_patterns = { 'node_modules', '.git/' },
          path_display = { 'tail' },
          mappings = {
            n = {
              ['q']     = actions.close,
              ['<Esc>'] = actions.close,
            },
          },
        },
        extensions = {
          file_browser = {
            theme = 'dropdown',
            previewer = false,
            initial_mode = 'normal',
            hidden = { file_browser = true, folder_browser = true },
            grouped = true,
            respect_gitignore = false,
            hide_parent_dir = true,
            path_display = { 'tail' },
            mappings = {
              ['i'] = {
                ['<C-w>'] = function() vim.cmd('normal vbd') end,
              },
              ['n'] = {
                ['a']      = fb_actions.create,
                ['r']      = fb_actions.rename,
                ['y']      = fb_actions.copy,
                ['d']      = fb_actions.remove,
                ['x']      = fb_actions.move,
                ['l']      = actions.select_default,   -- open / expand
                ['h']      = fb_actions.goto_parent_dir, -- close / parent
                ['<BS>']   = fb_actions.goto_parent_dir,
                ['v']      = actions.select_vertical,
                ['s']      = actions.select_horizontal,
                ['/']      = function() vim.cmd('startinsert') end,
                ['q']      = actions.close,
              },
            },
          },
        },
      })

      telescope.load_extension('file_browser')
    end,
  },

  -- ─── File Tree (sidebar) ───────────────────────────────────────────────────
  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' },
    init = function()
      -- Auto-open nvim-tree when nvim is started with a directory
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function(data)
          if vim.fn.isdirectory(data.file) == 1 then
            vim.cmd.cd(data.file)
            require('nvim-tree.api').tree.open()
          end
        end,
      })
    end,
    keys = {
      { '<space>ee', ':NvimTreeToggle<CR>', silent = true, desc = 'File tree (sidebar)' },
    },
    config = function()
      require('nvim-tree').setup({
        on_attach = function(bufnr)
          local api = require('nvim-tree.api')
          local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          -- Load default mappings first, then override
          api.config.mappings.default_on_attach(bufnr)

          vim.keymap.set('n', 'l', api.node.open.edit,            opts('Open'))
          vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
          vim.keymap.set('n', 'v', api.node.open.vertical,        opts('Open: Vertical Split'))
          vim.keymap.set('n', 's', api.node.open.horizontal,      opts('Open: Horizontal Split'))
          vim.keymap.set('n', 'q', api.tree.close,                opts('Close'))
          -- CRUD
          vim.keymap.set('n', 'a', api.fs.create,          opts('Create'))
          vim.keymap.set('n', 'r', api.fs.rename,          opts('Rename'))
          vim.keymap.set('n', 'd', api.fs.remove,          opts('Delete'))
          vim.keymap.set('n', 'c', api.fs.copy.node,       opts('Copy'))
          vim.keymap.set('n', 'x', api.fs.cut,             opts('Cut'))
          vim.keymap.set('n', 'p', api.fs.paste,           opts('Paste'))
        end,
        view = {
          width = 35,
          side = 'left',
        },
        renderer = {
          highlight_git = true,
          group_empty = true,
          indent_markers = { enable = true },
          icons = { show = { git = false } },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = { hint = '', info = '', warning = '', error = '' },
        },
        git = { enable = true },
        filters = { dotfiles = false },
      })
    end,
  },

  -- ─── Mason (LSP installer) ─────────────────────────────────────────────────
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    config = true,
  },

  -- mason-lspconfig v2: installs + auto-enables via vim.lsp.enable()
  -- nvim-lspconfig v2: provides server defaults via vim.lsp.config()
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = {
        'vue_ls',  -- Vue 3 (renamed from volar in lspconfig v2)
        'ts_ls',   -- TypeScript / JavaScript
        'eslint',
        'cssls',
        'html',
        'lua_ls',
      },
      -- automatic_enable = true (default): auto-calls vim.lsp.enable()
    },
  },

  -- ─── LSP config (nvim 0.11+ native API) ───────────────────────────────────
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Global: capabilities + disable formatting (conform handles it)
      vim.lsp.config('*', {
        capabilities = capabilities,
        on_attach = function(client, _)
          client.server_capabilities.documentFormattingProvider = false
        end,
      })

      -- ── Vue 3 (hybrid mode: vue_ls handles .vue, ts_ls handles TS in .vue) ──
      vim.lsp.config('vue_ls', {
        init_options = {
          vue = { hybridMode = true },
        },
      })

      -- ── TypeScript + @vue/typescript-plugin for .vue files ──
      local vue_plugin_path = vim.fn.stdpath('data')
        .. '/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin'

      vim.lsp.config('ts_ls', {
        init_options = {
          plugins = {{
            name = '@vue/typescript-plugin',
            location = vue_plugin_path,
            languages = { 'vue' },
          }},
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      })

      -- ── ESLint: fix all on save ──
      vim.lsp.config('eslint', {
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
          })
        end,
      })

      -- ── Lua ──
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
          },
        },
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = false,
        underline = true,
        update_in_insert = true,
      })
    end,
  },

  -- ─── LSP UI (lspsaga) ──────────────────────────────────────────────────────
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('lspsaga').setup({
        ui = {
          border = 'single',
          title = false,
          winblend = 0,
        },
        finder = {
          -- gh: floating window showing refs + defs
          -- v → vsplit, s → hsplit, t → new tab
          keys = {
            vsplit = 'v',
            split = 's',
            tabe = 't',
            quit = { 'q', '<ESC>' },
          },
        },
        rename = {
          in_select = false,
        },
        lightbulb = { enable = false },
        symbol_in_winbar = { enable = false },
      })

      local o = { noremap = true, silent = true }
      -- gh → finder (refs + definitions, pick file, v/s to split)
      vim.keymap.set('n', 'gh', '<Cmd>Lspsaga finder<CR>', o)
      -- gd → go to definition
      vim.keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', o)
      -- K → hover doc
      vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', o)
      -- F2 → rename across all references (like VSCode)
      vim.keymap.set('n', '<F2>', '<Cmd>Lspsaga rename<CR>', o)
      -- F3/F4 → diagnostics
      vim.keymap.set('n', '<F3>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', o)
      vim.keymap.set('n', '<F4>', '<Cmd>Lspsaga show_line_diagnostics<CR>', o)
    end,
  },

  -- ─── Completion ────────────────────────────────────────────────────────────
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim',
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-r>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<C-f>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
          }),
        },
      })

      vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
    end,
  },

  -- ─── Formatting (conform replaces null-ls + prettier.nvim) ────────────────
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          javascript      = { 'prettier' },
          typescript      = { 'prettier' },
          javascriptreact = { 'prettier' },
          typescriptreact = { 'prettier' },
          vue             = { 'prettier' },
          css             = { 'prettier' },
          scss            = { 'prettier' },
          html            = { 'prettier' },
          json            = { 'prettier' },
          lua             = { 'stylua' },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },

}, {
  change_detection = { notify = false },
})
