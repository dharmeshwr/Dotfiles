return {
  {
    'echasnovski/mini.nvim',
    config = function()
      local statusline =  require 'mini.statusline'
      statusline.setup { useicons = true }
      local completion =  require 'mini.completion'
      completion.setup {}
      local bracketed =  require 'mini.bracketed'
      bracketed.setup {}
      local comment =  require 'mini.comment'
      comment.setup {}
      local ai =  require 'mini.ai'
      ai.setup {}
    end
  }
}
