return {
  "athar-qadri/scratchpad.nvim",
  config = function()
    require("scratchpad"):setup({
      settings = {
        sync_on_ui_close = true,
      },
    })
  end,
  keys = {
    {
      "<leader>n",
      function()
        require("scratchpad").ui:new_scratchpad()
      end,
      desc = "Open scratchpad",
    },
    {
      "<leader>n",
      function()
        require("scratchpad").ui:sync()
      end,
      mode = "v",
      desc = "Push selection to scratchpad",
    },
  },
}
