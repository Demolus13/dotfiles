return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = true,
        hide_during_completion = vim.g.ai_cmp,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = "<A-]>",
          prev = "<A-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "DeepSeek-R1", -- Set the default model to deepseek
    },
    keys = {
      { "<C-c>c", ":CopilotChatToggle<CR>", mode="n", desc="Chat with Copilot" },
      { "<C-c>m", ":CopilotChatModels<CR>", mode="n", desc="Select Copliot Model" },
      { "<C-c>a", ":CopilotChatAgents<CR>", mode="n", desc="Select Copilot Agent" },
      { "<C-c>e", ":CopilotChatExplain<CR>", mode="v", desc="Explain Copilot" },
      { "<C-c>r", ":CopilotChatReview<CR>", mode="v", desc="Review Code" },
      { "<C-c>f", ":CopilotChatFix<CR>", mode="v", desc="Fix Code Issues" },
      { "<C-c>o", ":CopilotChatOptimize<CR>", mode="v", desc="Optimize Code" },
      { "<C-c>d", ":CopilotChatDocs<CR>", mode="v", desc="Generate Docs" },
      { "<C-c>t", ":CopilotChatTests<CR>", mode="v", desc="Generate Tests" },
    }
  },
}

