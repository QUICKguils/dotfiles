atreplinit() do repl
    try
        @eval using OhMyREPL, Crayons
        @eval import OhMyREPL: Passes.SyntaxHighlighter
        @eval create_nord_colorscheme()
        @eval enable_autocomplete_brackets(false)
        @eval OhMyREPL.enable_pass!("RainbowBrackets", false)
    catch e
        @warn "error while configuring OhMyREPL" e
    end
end

function create_nord_colorscheme()
    Nord = SyntaxHighlighter.ColorScheme()
    SyntaxHighlighter.symbol!(Nord,       Crayon(foreground = 0xd08770))
    SyntaxHighlighter.comment!(Nord,      Crayon(foreground = 0x616e88))
    SyntaxHighlighter.string!(Nord,       Crayon(foreground = 0xa3be8c))
    SyntaxHighlighter.call!(Nord,         Crayon(foreground = 0x88c0d0))
    SyntaxHighlighter.op!(Nord,           Crayon(foreground = 0x81a1c1))
    SyntaxHighlighter.keyword!(Nord,      Crayon(foreground = 0x81a1c1))
    SyntaxHighlighter.function_def!(Nord, Crayon(foreground = 0x88c0d0))
    SyntaxHighlighter.error!(Nord,        Crayon(foreground = 0xbf616a))
    SyntaxHighlighter.argdef!(Nord,       Crayon(foreground = 0x8fbcbb))
    SyntaxHighlighter.macro!(Nord,        Crayon(foreground = 0x5e81ac))
    SyntaxHighlighter.number!(Nord,       Crayon(foreground = 0xb48ead))
    SyntaxHighlighter.add!("Nord", Nord)
    colorscheme!("Nord")
end

# function create_tokyonight_colorscheme()
#     Tokyonight = SyntaxHighlighter.ColorScheme()
#     SyntaxHighlighter.symbol!(Tokyonight,       Crayon(foreground = 0x2ac3de))
#     SyntaxHighlighter.comment!(Tokyonight,      Crayon(foreground = 0x565f89))
#     SyntaxHighlighter.string!(Tokyonight,       Crayon(foreground = 0x9ece6a))
#     SyntaxHighlighter.call!(Tokyonight,         Crayon(foreground = 0x7aa2f7))
#     SyntaxHighlighter.op!(Tokyonight,           Crayon(foreground = 0x89ddff))
#     SyntaxHighlighter.keyword!(Tokyonight,      Crayon(foreground = 0x7dcfff))
#     SyntaxHighlighter.function_def!(Tokyonight, Crayon(foreground = 0x7aa2f7))
#     SyntaxHighlighter.error!(Tokyonight,        Crayon(foreground = 0xdb4b4b))
#     SyntaxHighlighter.argdef!(Tokyonight,       Crayon(foreground = 0xe0af68))
#     SyntaxHighlighter.macro!(Tokyonight,        Crayon(foreground = 0x7dcfff))
#     SyntaxHighlighter.number!(Tokyonight,       Crayon(foreground = 0xff9e64))
#     SyntaxHighlighter.add!("Tokyonight", Tokyonight)
#     colorscheme!("Tokyonight")
# end
