local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  auto_install = true,
  ensure_installed = {
    "tsx",
    "typescript",
    "javascript",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "css",
    "scss",
    "html",
    "lua",
    "graphql",
  },
  sync_install = false,
  autotag = {
    enable = true,
  },
}
