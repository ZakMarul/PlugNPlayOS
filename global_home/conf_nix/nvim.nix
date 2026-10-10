
{ pkgs, inputs, config, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;


    extraPackages = with pkgs; [
      ripgrep   # potreban za live_grep
    ];

    plugins = with pkgs.vimPlugins; [
      vim-tmux-navigator
      telescope-nvim
      telescope-fzf-native-nvim
      nvim-web-devicons
    ];

    extraLuaConfig = ''
      -- Leader
      vim.g.mapleader = " "

      -- Uvlačenje
      vim.opt.expandtab = true
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
      -- Edit refresh
      set -g focus-events on

      -- Općenito
      vim.opt.swapfile = false
      vim.opt.number = true

      -- Resize ponasanje
      vim.api.nvim_create_autocmd("VimResized", {
        command = "wincmd =",
      })

      vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>")

      -- vim-tmux-navigator
      vim.keymap.set("n", "<M-h>", "<cmd>TmuxNavigateLeft<CR>")
      vim.keymap.set("n", "<M-j>", "<cmd>TmuxNavigateDown<CR>")
      vim.keymap.set("n", "<M-k>", "<cmd>TmuxNavigateUp<CR>")
      vim.keymap.set("n", "<M-l>", "<cmd>TmuxNavigateRight<CR>")

      -- Telescope
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
      })
      telescope.load_extension("fzf")

      local tb = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", tb.find_files)                -- datoteke po imenu
      vim.keymap.set("n", "<leader>fg", tb.live_grep)                 -- tekst kroz projekt
      vim.keymap.set("n", "<leader>fs", tb.current_buffer_fuzzy_find) -- tekst u ovoj datoteci
      vim.keymap.set("n", "<leader>fb", tb.buffers)                   -- otvorene datoteke
      vim.keymap.set("n", "<leader>fh", tb.help_tags)                 -- dokumentacija
      vim.keymap.set("n", "<leader>fr", tb.registers)                 -- registri / clipboard
    '';
  };
}
