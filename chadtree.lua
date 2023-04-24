vim.api.nvim_set_var("chadtree_settings", {
  ["view.open_direction"] = "right"
})


vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("CHADTREE") ~= nil then
      vim.cmd "quit"
    end
  end
})

local function open_nvim_tree(data)
  vim.cmd "CHADopen --nofocus"
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
