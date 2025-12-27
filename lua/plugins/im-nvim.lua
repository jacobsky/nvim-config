return {
  "keaising/im-select.nvim",
  config = function()
    require("im_select").setup({
      default_im_select = "1033",
      default_command = "/mnt/c/Tools/im-select.exe",
      set_default_events = { "InsertLeave", "CmdlineLeave" },
      set_previous_events = { "InsertEnter" },
      keep_quiet_on_no_binary = true,
      async_switch_im = true,
    })
  end,
  lazy = false,
}
