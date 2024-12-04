return {
  {
    'echasnovski/mini.nvim', 
    config = function()
      local statusline =  require 'mini.statusline'
      statusline.setup { useicons = true }
    end
  }
}
