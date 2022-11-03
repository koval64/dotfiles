
"
" DELAY FOR MENU
"
set timeoutlen=500

"
" WHICH KEY CONFIG
"

lua << EOF
require("which-key").setup {
    plugins = {
        marks     = false,
        registers = false,
        spelling = {
            enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
    },
    popup_mappings = {          -- :WhichKey '' v " show ALL mappings for visual mode
        scroll_down = '<c-e>',  -- binding to scroll down inside the popup
        scroll_up   = '<c-y>',  -- binding to scroll up inside the popup
    },
    window = {
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 2, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 7, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
    },
}
EOF

"
" MY KEYS
"

lua << EOF
local wk = require("which-key")
wk.register({

    -- Admin tasks
    [" a" ] = { name = "+admin" },
    [" ac"] = { ":checkhealth<cr>",             "vim checkhealth" },
    [" ad"] = { ":e $MYVIMRC<cr>",              "edit vimrc" },
    [" ar"] = { ":update | so $MYVIMRC<cr>",    "reload vim config" },

    -- WhichKey
    [" av" ] = { name = "+WhichKey mappings" },
    [" avc"] = { ":WhichKey<cr>",                "show all mapping" },
    [" avv"] = { ":WhichKey <leader><cr>",       "show all <leader> mappings" },
    [" avz"] = { ":WhichKey <leader> v<cr>",     "show all <leader> mapping for VISUAL mode" },
    [" avx"] = { ":WhichKey '' v<cr>",           "show ALL mapping for VISUAL mode" },

    -- DevOps
    [" f" ] = { name = "+file" },
    [" fs"] = { ":update<cr>",                                  "save buffer" },
    [" fq"] = { ":q<cr>",                                       "quit" },
    [" fx"] = { ":update | !bash %<cr>",                            ":bash %" },
    [" fp"] = { ":update | !python3 %<cr>",                         ":python3 %" },
    [" fe"] = { ":Fern . -drawer -reveal=% -toggle -width=35<cr>",  "filemanager" },

    -- Coc
    [" c" ] = { name = "+Coc Diagnostics" },
    [" ca"] = { ":<C-u>CocList diagnostics<cr>",        "Diagnostics" },
    [" ce"] = { ":<C-u>CocList extensions<cr>",         "Extensions" },
    [" cc"] = { ":<C-u>CocList commands<cr>",           "Commands" },
    [" co"] = { ":<C-u>CocList outline<cr>",            "Outline" },
    [" cs"] = { ":<C-u>CocList -I symbols<cr>",         "Symbols" },
    [" cj"] = { ":<C-u>CocNext<CR>",                    "CocNext" },
    [" ck"] = { ":<C-u>CocPrev<CR>",                    "CocPrev" },
    [" cp"] = { ":<C-u>CocListResume<CR>i",             "CocListResume" },

    -- TODO vim wiki
    [" n" ] = { name = "+notes" },
    [" nf"] = { "<cmd>Telescope find_files<cr>",    "tu bedzie vimwiki" },
    [" nr"] = { "<cmd>Telescope oldfiles<cr>",      "tu bedzie vimwiki" },
    [" nn"] = { "<cmd>enew<cr>",                    "tu bedzie vimwiki" },

})
EOF





