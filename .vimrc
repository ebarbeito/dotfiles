"
"       .--.
"      |o_o |
"      |:_/ |       Vimfile : .vimrc
"     //   \ \      Version : 1.0
"    (| vim | )     Author  : Enrique Barbeito Garc�a
"   /'\_   _/`\	              enrique(at)barbeito.org
"   \___)=(___/
"
" ------------------------------------- 2003/05/13 00:01:10 ---

set background=dark             " colores para fondos negros
set ts=4                        " tama�o de tabulaci�n (4)
set noexpandtab                 " no convierte las tabulaciones a espacios
set sw=4                        " tama�o de indentado (igual que 'ts')
set pastetoggle=<f11>           " desactiva el autoindent al pegar texto

syntax on                       " colorea la sintaxis
set showmatch                   " autorelaciona los ( )'s, { }'s, etc...
set autoindent                  " habilita el autoindentado
set cindent                     " identacion c-style 
set nu                          " numeracion de filas
set ignorecase                  " ignora distinci�n entre may�sculas y min�sculas
set smartcase                   " cuando usamos may�sculas, las tiene en cuenta
set incsearch                   " nos sit�a autom�ticamente en la cadena que estemos buscando

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
"ab ebg Enrique Barbeito Garc�a
ab _nick neuronal
ab _mail1 enrique@barbeito.org
ab _mail2 neuronal@systemfailure.org
ab _miweb http://enrique.barbeito.org
ab _miserver http://www.systemfailure.org
iab _hora <C-R>=strftime("%H:%M")<CR>
iab _fecha <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
