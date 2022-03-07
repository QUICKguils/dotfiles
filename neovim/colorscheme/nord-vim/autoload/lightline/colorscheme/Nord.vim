" Project:    Custom nord lightline theme
" Repository: https://github.com/QUICKguils/dotfiles

" License and credits {{{
"
" This file is a little tweak of the following project:
" Project:    Nord Vim
" Repository: https://github.com/arcticicestudio/nord-vim
" License:    MIT
" Copyright © 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright © 2016-present Sven Greb <development@svengreb.de>
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the “Software”), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.
" }}}

let s:nord_vim_version="0.18.0"
let s:p = {
	\'normal':  {}, 'inactive': {}, 'insert':  {},
	\'replace': {}, 'visual':   {}, 'tabline': {}
\}

let s:nord0  = ["#2E3440", "NONE"]
let s:nord1  = ["#3B4252", 0     ]
let s:nord2  = ["#434C5E", "NONE"]
let s:nord3  = ["#4C566A", 8     ]
let s:nord4  = ["#D8DEE9", "NONE"]
let s:nord5  = ["#E5E9F0", 7     ]
let s:nord6  = ["#ECEFF4", 15    ]
let s:nord7  = ["#8FBCBB", 14    ]
let s:nord8  = ["#88C0D0", 6     ]
let s:nord9  = ["#81A1C1", 4     ]
let s:nord10 = ["#5E81AC", 12    ]
let s:nord11 = ["#BF616A", 1     ]
let s:nord12 = ["#D08770", 11    ]
let s:nord13 = ["#EBCB8B", 3     ]
let s:nord14 = ["#A3BE8C", 2     ]
let s:nord15 = ["#B48EAD", 5     ]

let s:p.inactive.left   = [ [s:nord5, s:nord2],  [s:nord5, s:nord1] ]
let s:p.inactive.right  = [ [s:nord5, s:nord2],  [s:nord5, s:nord1] ]
let s:p.inactive.middle = [ [s:nord5, s:nord1]]

let s:p.normal.left     = [ [s:nord1, s:nord8],  [s:nord5, s:nord2] ]
let s:p.normal.right    = [ [s:nord1, s:nord8],  [s:nord5, s:nord2] ]
let s:p.normal.middle   = [ [s:nord5, s:nord1] ]

let s:p.insert.left     = [ [s:nord1, s:nord6],  [s:nord5, s:nord2] ]
let s:p.insert.right    = [ [s:nord1, s:nord6],  [s:nord5, s:nord2] ]
let s:p.insert.middle   = [ [s:nord5, s:nord1] ]

let s:p.replace.left    = [ [s:nord1, s:nord13], [s:nord5, s:nord2] ]
let s:p.replace.right   = [ [s:nord1, s:nord13], [s:nord5, s:nord2] ]
let s:p.replace.middle  = [ [s:nord5, s:nord1] ]

let s:p.visual.left     = [ [s:nord1, s:nord15], [s:nord5, s:nord2] ]
let s:p.visual.right    = [ [s:nord1, s:nord15], [s:nord5, s:nord2] ]
let s:p.visual.middle   = [ [s:nord5, s:nord1] ]

let s:p.tabline.left    = [ [s:nord5, s:nord2] ]
let s:p.tabline.right   = [ [s:nord1, s:nord8] ]
let s:p.tabline.middle  = [ [s:nord5, s:nord1] ]
let s:p.tabline.tabsel  = [ [s:nord1, s:nord8] ]

let s:p.normal.warning  = [ [s:nord1, s:nord13] ]
let s:p.normal.error    = [ [s:nord1, s:nord11] ]

let g:lightline#colorscheme#Nord#palette = lightline#colorscheme#flatten(s:p)
