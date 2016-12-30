"select text that is visully highlighted, what about gn
"Make sure you cannot switch buffer without saving
"; mapping does not work in visual block
"esc does not work when using tmux with colors

"for cppman
autocmd FileType cpp set keywordprg=cppman

inoremap ; <esc>A;<esc>
autocmd TermResponse * nnoremap <esc> :noh<CR>magg=G`azz
nnoremap % %zz

"inoremap {{ <CR>{<CR><esc>mz2k:.g/^\s*$/d<CR>`z2j:.g/^\s*$/d<CR>`zi

set ic "Ignore case when searching
"Used for auto indent
set shiftwidth=1
set hlsearch
set nowrap
set updatetime=3000
set noswapfile
set suffixesadd+=.java
set path=.,**
set clipboard=unnamedplus
"Allow persisten buffers
"set hidden
set textwidth=80

"Save a keystroke when moving across splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"noremap
noremap <Enter> o<ESC> "Put empty line after
noremap <S-Enter> O<ESC> "Put empty line before
noremap Y y$


" Disable Arrow keys in Escape mode

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"nnoremap
nnoremap <Space> <C-f>M
"nnoremap <S-Space> <C-b>M
nnoremap r<Space> <C-b>M
nnoremap * *zz
nnoremap # #zz
nnoremap // /\<\><left><left>
nnoremap ?? ?\<\><left><left>
nnoremap U <c-r>
nnoremap <c-r> :tab h 
nnoremap gt :update<cr>gt
nnoremap gT :update<cr>gT
nnoremap <c-w> <c-w><c-w>
noremap L Lzz
noremap H Hzz

autocmd BufWritePost _vimrc source ~/_vimrc
autocmd CursorHold * :silent update
":au FocusLost * :w
autocmd Filetype c,cpp nnoremap <leader>c :update <bar> !clear && g++ -Wall -std=c++11 % -o %:r && ./%:r && rm %:r<CR>

autocmd Filetype cs nnoremap <leader>c :update <bar> !clear && mcs % -out:%:r && ./%:r && rm %:r<CR>

autocmd Filetype sh nnoremap <leader>c :update <bar> !clear && bash %<CR>
autocmd Filetype java nnoremap <leader>c :update <bar> !clear && javac % && java %:r && rm %:r.class<CR>
nnoremap <leader>o :update<CR>:tabe ~/_vimrc<CR>
nnoremap <leader>m :update <bar> !clear && cd ../ && ./makefile<CR>
nnoremap : :<c-f>i

nnoremap <leader>e :update <bar> ls<cr>:b

nnoremap <leader>ha :update <bar> !clear && ./makefile<CR>

nnoremap <leader>d :update <bar> !clear && bash doesItCompile.sh<CR>
nnoremap <leader>b :update <bar> !clear && g++ -std=c++11 % -o %:r && rm %:r<CR>
nnoremap <leader>d :update <bar> !clear && g++ -std=c++11 -g % -o %:r && gdb -tui %:r && rm %:r<CR>

nnoremap <leader>g :update <bar> !clear && g++ -std=c++11 % -o work -I /home/banana_peel/Desktop/opengl/COMP477_A1_VS2013/COMP477_A1/include/ -Wno-write-strings -lm -lGLEW -lglut -lGL -lGLU && ./work && rm work<cr>

set <F1>=<c-v><f1>
nnoremap <F1> :echo "r" !date<CR>
noremap <leader>p "+p<CR>
noremap <leader>y "+y<CR>

syntax off

" Go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
\ execute("normal `\"") |
\ endif

"if has("autocmd")
"  au BufLeave * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

"if has("autocmd")
"  au TabLeave * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

"au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

autocmd Filetype java nnoremap <leader>c :update <bar> !clear && find /home/banana_peel/Desktop/COMP354Project/src/ -name "*.java" <bar> xargs javac -cp  "/usr/share/java/junit4-4.12.jar:/home/banana_peel/Desktop/COMP354Project/lib/*"   && java -cp "/home/banana_peel/Desktop/COMP354Project/lib/*:/home/banana_peel/Desktop/COMP354Project/src/:/home/banana_peel/Desktop/COMP354Project/jfx.db:/usr/share/java/junit4-4.12.jar" jfx.Application ; rm $(find /home/banana_peel/Desktop/COMP354Project/src/ -name "*.class")<CR>


"Can have many autocmd with same name, also no need for CR, also why is source not working?
"autocmd FocusLost  *.html :silent !xdotool  search  --onlyvisible --class "chromium" windowfocus key 'F5'
autocmd Filetype html nnoremap <leader>c :update <bar> !bash hoho<CR><CR>

"	let s:hidden_all = 0
"function! ToggleHiddenAll()
"	if s:hidden_all  == 0
"	let s:hidden_all = 1
"	set noshowmode
"	set noruler
"	set laststatus=0
"	set noshowcmd
"	else
"	let s:hidden_all = 0
"	set showmode
"	set ruler
"	set laststatus=2
"	set showcmd
"	endif
"	endfunction
"
"	nnoremap <S-h> :call ToggleHiddenAll()<CR>

hi VertSplit ctermfg=black
hi VertSplit ctermbg=black

 let g:UltiSnipsJumpForwardTrigger="<tab>" 
execute pathogen#infect()
