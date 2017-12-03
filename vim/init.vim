set number
set title
set noshowmode
set laststatus=2
set cursorline
set list

let g:mapleader = "\<Space>"

let g:python3_host_prog = '/usr/local/Cellar/python3/3.6.3/bin/python3'

noremap j gj
noremap k gk
noremap <S-h> ^
noremap <S-l> $
nnoremap x "_x
vnoremap > >gv
vnoremap < <gv
nnoremap <silent> <ESC> :nohlsearch<CR>
vnoremap Y y`]
"inoremap <C-c> <ESC>
"inoremap jj <ESC>
"noremap ; :
"noremap : ;

if has('vim_starting') && &encoding !=# 'utf-8'
   set encoding=utf-8
endif

if has('clipboard')
  set clipboard&
  if has('unnamedplus')
    set clipboard^=unnamedplus
  else
    set clipboard^=unnamed
  endif
endif

set mouse=a

set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround

set noswapfile
set nobackup
set noundofile

set iskeyword+=-

set splitright

"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(expand('~/.cache/dein'))
  call dein#begin(expand('~/.cache/dein'))

  " Let dein manage dein
  let g:dein_dir = expand('~/.config/nvim')
  let s:toml = g:dein_dir . '/dein.toml'
  let s:lazy_toml = g:dein_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  call dein#add('Shougo/denite.nvim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
syntax on
set background=dark
colorscheme hybrid

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"Denite
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#option('default', 'highlight_matched_char', 'Underlined')
call denite#custom#option('default', 'highlight_matched_range', 'cleared')

if executable('ag')
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep', '--hidden'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>')
call denite#custom#map('normal', '<C-s>', '<denite:do_action:split>')
call denite#custom#map('insert', '<C-s>', '<denite:do_action:split>')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>')

call denite#custom#source('file_old', 'matchers', ['matcher_project_files', 'matcher_cpsm'])

call denite#custom#option('default', 'vertical_preview', 1)

map <silent> <Leader>p :<C-u>Denite file_rec/git<CR>
map <silent> <Leader>f :<C-u>Denite file_rec<CR>
map <silent> <Leader>o :<C-u>Denite file_old<CR>
map <silent> <Leader>g :<C-u>Denite -no-empty grep<CR>
map <silent> <Leader>r :<C-u>Denite -resume<CR>
map <silent> <Leader>y :<C-u>Denite neoyank<CR>
map <silent> <Leader>w :<C-u>DeniteCursorWord grep<CR>
map <silent> <Leader>st :<C-u>Denite gitstatus<CR>

nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>m :NERDTreeFind<cr>
let g:NERDTreeShowHidden=1

let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.erb'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

au BufRead,BufNewFile /Users/ohkubo/Work/java/server_settings/ansible/roles/nginx/* set ft=nginx

let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
