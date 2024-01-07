local function keymaps()
  vim.keymap.set('n', '<leader>fe', ':Neotree toggle filesystem left<CR>', {})
  vim.keymap.set('n', '<leader>fd', ":Neotree float reveal_file=<cfile> reveal_force_cwd<cr>")
  vim.keymap.set('n', '<leader>b', ":Neotree toggle show buffers right<cr>")
  -- vim.keymap.set('n', '<leader>/', ":Neotree toggle current reveal_force_cwd<cr>")
  -- vim.keymap.set('n', '<leader>|', ":Neotree reveal<cr>")
  -- vim.keymap.set('n', '<leader>gs', ":Neotree float git_status<cr>")
end
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    -- global keymaps
    keymaps()
    -- inside neotree
    require('neo-tree').setup({
      window = {
        mappings = {
          ['O'] = function(state)
            local node = state.tree:get_node()
            if require("neo-tree.utils").is_expandable(node) then
              state.commands["toggle_node"](state)
            else
              state.commands['open'](state)
              vim.cmd('Neotree reveal')
              vim.cmd('norm j')
              -- vim.cmd('Neotree float toggle reveal_force_cwd dir=' .. vim.fn.getcwd()) -- I use this one.
            end
          end,
          ["o"] = { "open", nowait = true },
          ["oc"] = "noop",
          ["od"] = "noop",
          ["og"] = "noop",
          ["om"] = "noop",
          ["on"] = "noop",
          ["os"] = "noop",
          ["ot"] = "noop",
          -- ['o'] = { "open", nowait = true },
          ['<c-p>'] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          ['h'] = { "close_node", nowait = true },
          ['l'] = { "open", nowait = true },
          -- ['E'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
          -- ['B'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
          -- ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
        },
      },
    })
  end
}


