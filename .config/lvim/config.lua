-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Navigate to next/prev buffer with shift h and l
lvim.keys.normal_mode["<S-l>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":bprevious<CR>"

lvim.plugins = {
    { "ishan9299/nvim-solarized-lua" },
    { "jbob/vim-perltidy" },
    {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
            vim.cmd 'highlight default link gitblame SpecialComment'
        end
    }
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmd = {
    '/home/markus/work/gitlab-code-suggestions-language-server-experiment',
    'serve',
    '--name',
    'gitlab-code-suggestions-language-server-experiment',
    '--srcdir',
    vim.fn.getcwd(),
    '--timeout-seconds',
    '20'
}

local configs = require 'lspconfig.configs'
local util = require 'lspconfig.util'

if not configs.gitlab_ai_code_suggestions then
    configs.gitlab_ai_code_suggestions = {
        default_config = {
            cmd = cmd,
            -- the files fro which the language server is going to be activated
            filetypes = { 'python', 'ruby', 'perl', 'javascript' },
            root_dir = function(fname)
                return util.find_git_ancestor(fname)
            end,
            single_file_support = true,
            settings = {},
        },
    }
end

configs.gitlab_ai_code_suggestions.setup {
    capabilities = capabilities
}

-- Disable syntax highlighting with treesitter for perl. It doesn't work well
lvim.builtin.treesitter.highlight.disable = { 'perl' }
