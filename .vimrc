"
"       .--.
"      |o_o |
"      |:_/ |       Vimfile : .vimrc
"     //   \ \      Version : 1.0
"    (| vim | )     Author  : Enrique Barbeito García
"   /'\_   _/`\	              enrique(at)barbeito.org
"   \___)=(___/
"
" ------------------------------------- 2003/05/13 00:01:10 ---

set background=dark             " colores para fondos negros
set ts=4                        " tamaño de tabulación (4)
set noexpandtab                 " no convierte las tabulaciones a espacios
set sw=4                        " tamaño de indentado (igual que 'ts')
set pastetoggle=<f11>           " desactiva el autoindent al pegar texto

syntax on                       " colorea la sintaxis
set showmatch                   " autorelaciona los ( )'s, { }'s, etc...
set autoindent                  " habilita el autoindentado
set cindent                     " identacion c-style 
set nu                          " numeracion de filas
set ignorecase                  " ignora distinción entre mayúsculas y minúsculas
set smartcase                   " cuando usamos mayúsculas, las tiene en cuenta
set incsearch                   " nos sitúa automáticamente en la cadena que estemos buscando

set bs=2                        " backspace normal
set backspace=indent,eol,start  " permite usar el backspace en cualquier cosa
set showmode                    " muestra el estado (modo) en el que estamos
set ruler                       " muestra fila,columna actual
set nobackup                    " no genera copias de seguridad
set novisualbell                " No devuelve un flash (pantallazo de 1microsegundo) en caso de error
set noerrorbells                " No devuelve un pitido (beep) en caso de error

" Convierte el archivo a formato UNIX y establece por defecto este formato.
set ffs=unix
set ff=unix

" Para programacion
set comments=sl:/*,mb:\ *,elx:*

"
" Abreviaturas
"
"ab ebg Enrique Barbeito García
ab _nick neuronal
ab _mail1 enrique@barbeito.org
ab _mail2 neuronal@systemfailure.org
ab _miweb http://enrique.barbeito.org
ab _miserver http://www.systemfailure.org
iab _hora <C-R>=strftime("%H:%M")<CR>
iab _fecha <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
