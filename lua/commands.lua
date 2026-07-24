local command = vim.api.nvim_create_user_command

command("LspStatus", function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	if #clients == 0 then
		vim.notify(
			"No LSP client attached to the current buffer",
			vim.log.levels.INFO
		)
		return
	end

	for _, client in ipairs(clients) do
		print(client.name)
	end
end, {
	desc = "Show active LSP clients",
})


local zoom_tab = nil

command("Zoom", function()
  local curr_tab = vim.api.nvim_get_current_tabpage()

  if zoom_tab and vim.api.nvim_tabpage_is_valid(zoom_tab) then
    if curr_tab == zoom_tab then
      vim.cmd("tabclose")
      zoom_tab = nil
    else
      vim.api.nvim_set_current_tabpage(zoom_tab)
    end
  else
    vim.cmd("tab split")
    zoom_tab = vim.api.nvim_get_current_tabpage()
  end
end, {
  desc = "Toggle zoom window while keeping bufferline visible",
})
