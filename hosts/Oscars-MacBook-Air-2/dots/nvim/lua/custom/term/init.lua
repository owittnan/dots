local M = {}

local term_buf = nil
local term_win = nil

M.terminal_toggle = function(height)
  if term_win ~= nil and vim.fn.win_gotoid(term_win) then
    if pcall(function(c)
      vim.cmd(c)
    end, 'hide') then
      return
    end
  end

  vim.cmd 'botright new'
  vim.cmd('resize' .. height)

  if term_buf == nil or not pcall(function(c)
    vim.cmd(c)
  end, 'buffer ' .. term_buf) then
    vim.fn.termopen(vim.env.SHELL, { detach = 0 })
    term_buf = vim.fn.bufnr()

    vim.wo.nu = false
    vim.wo.rnu = false
    vim.wo.signcolumn = 'no'
  end
  vim.cmd 'startinsert!'

  term_win = vim.fn.win_getid()
end

return M

-- vim: ts=2 sts=2 sw=2 et
