-- require('rose-pine').setup({
--     disable_background = true 
-- })
-- require("no-clown-fiesta").setup({
--   transparent = false, -- Enable this to disable the bg color
--   styles = {
--     -- You can set any of the style values specified for `:h nvim_set_hl`
--     comments = {},
--     keywords = {},
--     functions = {},
--     variables = {},
--     type = { bold = true },
--     lsp = { underline = true }
--   },
-- })
function ColorMyPencils(color) 
    color = color or "ayu"
	--color = color or "github_dark_default"
	vim.cmd.colorscheme(color)
    -- vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
    -- vim.cmd(set bg=dark)
end

ColorMyPencils()




