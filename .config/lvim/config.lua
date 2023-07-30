-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Navigate to next/prev buffer with shift h and l
lvim.keys.normal_mode["<S-l>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":bprevious<CR>"

lvim.plugins = {
    { "ishan9299/nvim-solarized-lua" },
    {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
            vim.cmd 'highlight default link gitblame SpecialComment'
        end
    },
    { "git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git" }
}

lvim.colorscheme = "solarized"
lvim.format_on_save = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.scrolloff = 3
vim.opt.lazyredraw = true


-- Disable syntax highlighting with treesitter for perl. It doesn't work well
lvim.builtin.treesitter.highlight.disable = { 'perl' }
