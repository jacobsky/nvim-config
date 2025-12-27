return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true

    vim.keymap.set({ "n", "x" }, "<leader>oa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask opencode" })
    vim.keymap.set("v", "<leader>oa", function()
      require("opencode").ask("@seletion: ", { submit = true })
    end, { desc = "Ask opencode about selection" })

    vim.keymap.set({ "n", "x", "v" }, "<leader>oe", function()
      require("opencode").prompt("explain @this and it's context", { submit = true })
    end, { desc = "Ask opencode model to explain this selection" })

    vim.keymap.set("n", "<leader>oi", function()
      require("opencode").ask("/implfunc @this", { submit = true })
    end, { desc = "Ask opencode to implement the function your cursor is in" })

    vim.keymap.set({ "v", "x" }, "<leader>oi", function()
      require("opencode").ask("/implfunc @selection", { submit = true })
    end, { desc = "Ask opencode to implement this selection" })

    vim.keymap.set({ "n", "x" }, "<leader>os", function()
      require("opencode").select()
    end, { desc = "Execute opencode action…" })

    vim.keymap.set("v", "<leader>os", function()
      return require("opencode").operator("@this ")
    end, { expr = true, desc = "Add range to opencode" })

    vim.keymap.set({ "n", "t" }, "<leader>ot", function()
      require("opencode").toggle()
    end, { desc = "Toggle opencode" })

    vim.keymap.set({ "n", "x" }, "<leader>og", function()
      return require("opencode").operator("@this ")
    end, { expr = true, desc = "Add range to opencode" })

    vim.keymap.set("n", "<leader>ogo", function()
      return require("opencode").operator("@this ") .. "_"
    end, { expr = true, desc = "Add line to opencode" })

    vim.keymap.set("n", "<leader>ou", function()
      require("opencode").command("session.half.page.up")
    end, { desc = "opencode half page up" })
    vim.keymap.set("n", "<leader>ou", function()
      require("opencode").command("session.half.page.down")
    end, { desc = "opencode half page down" })

    -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
    vim.keymap.set("n", "+", "<leader>o+", { desc = "Increment", noremap = true })
    vim.keymap.set("n", "-", "<leader>o-", { desc = "Decrement", noremap = true })
  end,
}
