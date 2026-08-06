" blossom.vim — a soft dark cherry-blossom colorscheme
"
" A low-chroma, soft dark palette for the blossom theme (rooted in the sakura color set).
" Main colors:
"   background #070707    text #C7B7BA    signature #B28D9E
"   error #A56661  warn #957F5F  ok #6C8778  info #7B76A5
"
" Requires a true-color terminal:  set termguicolors
"
" Install: drop into ~/.vim/colors/blossom.vim (or pack/.../colors/blossom.vim)
"   colorscheme blossom

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'blossom'
set background=dark

" ---- palette -----------------------------------------------------------
let s:bg0 = '#070707'   " background
let s:bg1 = '#252425'   " raised surface (floats, tab bar)
let s:bg2 = '#2D2B2D'   " hover / cursorline / statusline
let s:bg3 = '#5E585E'   " muted / comment / line numbers
let s:vs0 = '#3D393D'   " visual selection
let s:vs1 = '#211F21'   " subtle (EndOfBuffer) / error-bg text
let s:fg0 = '#C7B7BA'   " primary text
let s:fg1 = '#A6989B'   " secondary text
let s:fg8 = '#95888B'   " faint text / delimiters
let s:fg9 = '#96869A'   " function
let s:er0 = '#A56661'   " error / red
let s:er9 = '#3D2827'
let s:yl0 = '#957F5F'   " warn / yellow
let s:yl8 = '#514432'
let s:yl9 = '#3B3225'
let s:sr0 = '#AB7DAB'   " blossom magenta (search / accent)
let s:sr1 = '#936793'
let s:sr9 = '#3E2B3E'
let s:gr0 = '#6C8778'   " ok / green
let s:gr9 = '#28352E'
let s:gb0 = '#7B76A5'   " info / blue / string
let s:gb1 = '#6D6692'
let s:gb9 = '#2D293C'
let s:gp0 = '#807785'   " number / purple
let s:gp1 = '#8F8190'   " constant
let s:gp9 = '#352B3F'
let s:sa0 = '#B28D9E'   " signature pink / type
let s:sa1 = '#9F7082'   " deep rose / storage class
let s:sa2 = '#7F5E6A'   " operator
let s:pi0 = '#887A87'   " keyword / hint
let s:pi1 = '#6B5E6A'   " statement

" expose the palette so other plugins / configs can reuse it
let g:blossom_palette = {
      \ 'bg0': s:bg0, 'bg1': s:bg1, 'bg2': s:bg2, 'bg3': s:bg3,
      \ 'vs0': s:vs0, 'vs1': s:vs1,
      \ 'fg0': s:fg0, 'fg1': s:fg1, 'fg8': s:fg8, 'fg9': s:fg9,
      \ 'er0': s:er0, 'er9': s:er9,
      \ 'yl0': s:yl0, 'yl8': s:yl8, 'yl9': s:yl9,
      \ 'sr0': s:sr0, 'sr1': s:sr1, 'sr9': s:sr9,
      \ 'gr0': s:gr0, 'gr9': s:gr9,
      \ 'gb0': s:gb0, 'gb1': s:gb1, 'gb9': s:gb9,
      \ 'gp0': s:gp0, 'gp1': s:gp1, 'gp9': s:gp9,
      \ 'sa0': s:sa0, 'sa1': s:sa1, 'sa2': s:sa2,
      \ 'pi0': s:pi0, 'pi1': s:pi1,
      \ }

" ---- helper ------------------------------------------------------------
function! s:hi(group, fg, bg, attrs, ...) abort
  let l:sp = get(a:, 1, '')
  exe 'hi ' . a:group
        \ . ' guifg=' . (a:fg ==# '' ? 'NONE' : a:fg)
        \ . ' guibg=' . (a:bg ==# '' ? 'NONE' : a:bg)
        \ . ' gui='   . (a:attrs ==# '' ? 'NONE' : a:attrs)
        \ . ' guisp=' . (l:sp ==# '' ? 'NONE' : l:sp)
        \ . ' cterm=NONE'
endfunction

" ---- editor UI -----------------------------------------------------------
call s:hi('Normal',        s:fg0, s:bg0, '')
call s:hi('NormalFloat',   s:fg0, s:bg1, '')
call s:hi('FloatBorder',   s:fg1, s:bg1, '')
call s:hi('Terminal',      s:fg0, s:bg0, '')
call s:hi('Cursor',        s:bg0, s:fg0, '')
call s:hi('CursorLine',    '',    s:bg2, '')
call s:hi('CursorColumn',  '',    s:bg2, '')
call s:hi('ColorColumn',   '',    s:bg2, '')
call s:hi('LineNr',        s:bg3, '',    '')
call s:hi('CursorLineNr',  s:fg1, '',    'bold')
call s:hi('SignColumn',    s:bg3, s:bg0, '')
call s:hi('FoldColumn',    s:bg3, s:bg0, '')
call s:hi('Folded',        s:fg8, s:bg2, '')
call s:hi('VertSplit',     s:fg1, s:bg0, '')
call s:hi('WinSeparator',  s:sa0, s:bg0, '')
call s:hi('StatusLine',    s:fg0, s:bg2, '')
call s:hi('StatusLineNC',  s:fg8, s:bg1, '')
call s:hi('StatusLineTerm',    s:fg0, s:bg2, '')
call s:hi('StatusLineTermNC',  s:fg8, s:bg1, '')
call s:hi('WinBar',        s:fg0, s:bg1, '')
call s:hi('WinBarNC',      s:fg8, s:bg1, '')
call s:hi('TabLine',       s:fg1, s:bg1, '')
call s:hi('TabLineSel',    s:fg0, s:bg2, 'bold')
call s:hi('TabLineFill',   s:fg1, s:bg1, '')
call s:hi('Visual',        s:fg0, s:vs0, '')
call s:hi('VisualNOS',     s:fg0, s:vs0, '')
call s:hi('Search',        s:bg0, s:sr1, '')
call s:hi('CurSearch',     s:bg0, s:sr0, 'bold')
call s:hi('IncSearch',     s:bg0, s:sr0, 'bold')
call s:hi('MatchParen',    s:bg0, s:sa1, '')
call s:hi('Pmenu',         s:fg0, s:bg3, '')
call s:hi('PmenuSel',      s:bg0, s:pi0, '')
call s:hi('PmenuThumb',    '',    s:bg3, '')
call s:hi('PmenuSbar',     '',    s:bg1, '')
call s:hi('WildMenu',      s:bg0, s:pi0, '')
call s:hi('QuickFixLine',  s:fg0, s:bg2, 'bold')
call s:hi('Question',      s:fg0, '',    '')
call s:hi('Title',         s:fg0, '',    'bold')
call s:hi('Directory',     s:sa0, '',    '')
call s:hi('NonText',       s:fg8, '',    '')
call s:hi('SpecialKey',    s:fg8, '',    '')
call s:hi('Conceal',       s:fg8, '',    '')
call s:hi('EndOfBuffer',   s:vs1, '',    '')
call s:hi('ErrorMsg',      s:er0, '',    '')
call s:hi('WarningMsg',    s:yl0, '',    '')
call s:hi('ModeMsg',       s:pi0, '',    'bold')
call s:hi('MoreMsg',       s:pi0, '',    'bold')
call s:hi('Error',         s:vs1, s:er0, '')
call s:hi('Todo',          s:bg0, s:yl0, 'bold')
call s:hi('Underlined',    s:fg0, '',    'underline')

" ---- spell ----------------------------------------------------------------
call s:hi('SpellBad',   '',    '',    'undercurl', s:er0)
call s:hi('SpellCap',   '',    '',    'undercurl', s:gb0)
call s:hi('SpellLocal', '',    '',    'undercurl', s:gb1)
call s:hi('SpellRare',  '',    '',    'undercurl', s:sr0)

" ---- syntax ---------------------------------------------------------------
call s:hi('Comment',        s:bg3, '', '')
call s:hi('Constant',       s:gp1, '', '')
call s:hi('String',         s:gb0, '', '')
call s:hi('Character',      s:gb1, '', 'italic')
call s:hi('Number',         s:gp0, '', '')
call s:hi('Boolean',        s:gp1, '', '')
call s:hi('Float',          s:gp0, '', '')
call s:hi('Identifier',     s:fg0, '', '')
call s:hi('Function',       s:fg9, '', '')
call s:hi('Statement',      s:pi1, '', '')
call s:hi('Conditional',    s:pi0, '', '')
call s:hi('Repeat',         s:pi1, '', '')
call s:hi('Label',          s:pi1, '', '')
call s:hi('Operator',       s:sa2, '', '')
call s:hi('Keyword',        s:pi0, '', '')
call s:hi('Exception',      s:pi1, '', '')
call s:hi('PreProc',        s:pi0, '', '')
call s:hi('Define',         s:pi1, '', '')
call s:hi('Include',        s:pi0, '', '')
call s:hi('Macro',          s:pi0, '', '')
call s:hi('PreCondit',      s:pi0, '', '')
call s:hi('Type',           s:sa0, '', '')
call s:hi('StorageClass',   s:sa1, '', '')
call s:hi('Structure',      s:sa0, '', '')
call s:hi('Typedef',        s:sa1, '', '')
call s:hi('Special',        s:gp1, '', '')
call s:hi('SpecialChar',    s:gp1, '', '')
call s:hi('Tag',            s:gp1, '', '')
call s:hi('Delimiter',      s:fg8, '', '')
call s:hi('SpecialComment', s:bg3, '', 'italic')
call s:hi('Debug',          s:gp1, '', '')

" ---- diagnostics (LSP) -----------------------------------------------------
call s:hi('DiagnosticError',        s:er0, '', '')
call s:hi('DiagnosticWarn',         s:yl0, '', '')
call s:hi('DiagnosticInfo',         s:gb0, '', '')
call s:hi('DiagnosticHint',         s:pi0, '', '')
call s:hi('DiagnosticOk',           s:gr0, '', '')
call s:hi('DiagnosticUnderlineError', '', '', 'undercurl', s:er0)
call s:hi('DiagnosticUnderlineWarn',  '', '', 'undercurl', s:yl0)
call s:hi('DiagnosticUnderlineInfo',  '', '', 'undercurl', s:gb0)
call s:hi('DiagnosticUnderlineHint',  '', '', 'undercurl', s:pi0)
call s:hi('DiagnosticUnderlineOk',    '', '', 'undercurl', s:gr0)
call s:hi('DiagnosticVirtualTextError', s:er0, s:er9, '')
call s:hi('DiagnosticVirtualTextWarn',  s:yl0, s:yl9, '')
call s:hi('DiagnosticVirtualTextInfo',  s:gb0, s:gb9, '')
call s:hi('DiagnosticVirtualTextHint',  s:pi0, s:gp9, '')
call s:hi('DiagnosticVirtualTextOk',    s:gr0, s:gr9, '')
call s:hi('DiagnosticFloatingError', s:er0, s:bg1, '')
call s:hi('DiagnosticFloatingWarn',  s:yl0, s:bg1, '')
call s:hi('DiagnosticFloatingInfo',  s:gb0, s:bg1, '')
call s:hi('DiagnosticFloatingHint',  s:pi0, s:bg1, '')
call s:hi('DiagnosticSignError',     s:er0, '', '')
call s:hi('DiagnosticSignWarn',      s:yl0, '', '')
call s:hi('DiagnosticSignInfo',      s:gb0, '', '')
call s:hi('DiagnosticSignHint',      s:pi0, '', '')
call s:hi('DiagnosticSignOk',        s:gr0, '', '')

" ---- git / diff -------------------------------------------------------------
call s:hi('DiffAdd',    s:gr0, s:gr9, '')
call s:hi('DiffChange', s:yl0, s:yl9, '')
call s:hi('DiffDelete', s:er0, s:er9, '')
call s:hi('DiffText',   s:bg0, s:yl8, '')
call s:hi('diffAdded',   s:gr0, '', '')
call s:hi('diffChanged', s:yl0, '', '')
call s:hi('diffRemoved', s:er0, '', '')
call s:hi('diffFile',    s:sa0, '', '')
call s:hi('diffNewFile', s:gb0, '', '')
call s:hi('diffOldFile', s:pi0, '', '')
call s:hi('diffLine',    s:sr0, '', '')
call s:hi('GitSignsAdd',        s:gr0, '', '')
call s:hi('GitSignsChange',     s:yl0, '', '')
call s:hi('GitSignsDelete',     s:er0, '', '')
call s:hi('GitSignsAddLn',      s:gr0, '', '')
call s:hi('GitSignsChangeLn',   s:yl0, '', '')
call s:hi('GitSignsDeleteLn',   s:er0, '', '')
call s:hi('GitSignsAddNr',      s:gr0, '', '')
call s:hi('GitSignsChangeNr',   s:yl0, '', '')
call s:hi('GitSignsDeleteNr',   s:er0, '', '')

" ---- LSP ---------------------------------------------------------------------
call s:hi('LspReferenceText',            s:fg0, s:bg2, '')
call s:hi('LspReferenceRead',            s:fg0, s:bg2, '')
call s:hi('LspReferenceWrite',           s:fg0, s:bg2, '')
call s:hi('LspSignatureActiveParameter', s:sa0, '',    'underline')

" ---- terminal (vim :terminal buffers) ----------------------------------------
let g:terminal_color_0  = s:bg1
let g:terminal_color_1  = s:er0
let g:terminal_color_2  = s:gr0
let g:terminal_color_3  = s:yl0
let g:terminal_color_4  = s:gb0
let g:terminal_color_5  = s:sr0
let g:terminal_color_6  = s:pi0
let g:terminal_color_7  = s:fg1
let g:terminal_color_8  = s:bg3
let g:terminal_color_9  = s:er0
let g:terminal_color_10 = s:gr0
let g:terminal_color_11 = s:yl0
let g:terminal_color_12 = s:gb0
let g:terminal_color_13 = s:sr0
let g:terminal_color_14 = s:pi0
let g:terminal_color_15 = s:fg0

delfunction s:hi
