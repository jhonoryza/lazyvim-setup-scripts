vim.keymap.set("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })

vim.keymap.set("i", "<c-;>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })

vim.keymap.set("i", "<c-,>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true })

vim.keymap.set("i", "<c-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true })

-- Maintain cursor position
vim.keymap.set("n", "gcap", "my<cmd>norm vip<bar>gc<cr>`y")
