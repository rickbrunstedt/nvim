return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
    "isak102/telescope-git-file-history.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  lazy = false,
  opts = {
    pickers = {
      find_files = {
        hidden = false,
      },
      git_files = {
        hidden = false,
      },
    },
    defaults = {
      file_ignore_patterns = {
        "node_modules/*",
      },
    },
    extensions = {
      fzf = {},
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("undo")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("git_file_history")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fF", function()
      builtin.find_files({ hidden = true })
    end, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope help tags" })
  end,
  keys = {
    -- { "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
    -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find all files" },
    -- { "<leader>fa", "<cmd>Telescope find_files<cr>", desc = "Find all files" },
    -- { "<leader>fi", "<cmd>Telescope live_grep<cr>", desc = "Find in files" },
    -- { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find in files" },
  },
}
