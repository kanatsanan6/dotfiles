require("CopilotChat").setup({})

local keymap = vim.keymap
keymap.set({ "n", "v" }, "<leader>ct", ":CopilotChatTests<CR>")
keymap.set({ "n", "v" }, "<leader>cf", ":CopilotChatFix<CR>")
keymap.set({ "n", "v" }, "<leader>co", ":CopilotChatOptimize<CR>")
keymap.set({ "n", "v" }, "<leader>cd", ":CopilotChatDocs<CR>")
