-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("oil").setup()

-- personal config
vim.opt.undofile = false
-- vim.opt.makeprg = "g++ % -o %<"  --(for cpp)
-- vim.opt.makeprg = "gcc % -o %<"    --(for c)
vim.opt.wrap = true
vim.opt.linebreak = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt_local.makeprg = "g++ % -o %<"

    vim.keymap.set("n", "<leader>cc", function()
      vim.cmd("write")
      local file = vim.fn.expand("%")
      local exe = vim.fn.expand("%:r")
      local compile_cmd = string.format("g++ %s -o %s", file, exe)
      local run_cmd = string.format("foot sh -c './%s; echo; read -p \"Done...\"'", exe)
      
      local full_cmd = string.format("%s && %s", compile_cmd, run_cmd)
      vim.fn.jobstart(full_cmd, { detach = true })
      print("Compiling " .. file .. "...")
    end, { buffer = true, desc = "Compile and Run in foot" })
  end,
})

-- relative numbers

_G.stagger_numbers = function()
  local rnum = vim.v.relnum -- relative number
  local lnum = vim.v.lnum -- line number

  if rnum == 0 then
    return "%#CursorLineNr#" .. lnum .. " "
  else
    return "  %#LineNr#" .. rnum .. " "
  end
end

vim.opt.statuscolumn = "%{%v:lua.stagger_numbers()%}"
