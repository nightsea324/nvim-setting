local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    initial_mode = "normal",
    mappings = {
      n = {
        ["<space>q"] = actions.close,
        ["<space>ef"] = actions.close,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      previewer = false,
      grouped = true,
      hidden = true,
      layout_config = { height = 40 },
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["a"] = fb_actions.create,
          ["r"] = fb_actions.rename,
          ["y"] = fb_actions.copy,
          ["d"] = fb_actions.remove,
          ["s"] = actions.select_horizontal,
          ["v"] = actions.select_vertical,
          ["l"] = actions.select_default,
          ["h"] = fb_actions.goto_parent_dir,
          ["<BackSpace>"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

vim.keymap.set('n', '<space>f',
  function()
    builtin.find_files({
      hidden = true
    })
  end)
vim.keymap.set('n', '<space>r', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)
vim.keymap.set('n', '<space>t', function()
  builtin.help_tags()
end)
vim.keymap.set('n', '<space>ee', function()
  builtin.resume()
end)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)
vim.keymap.set("n", "<space>ef", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
