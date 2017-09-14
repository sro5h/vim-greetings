"
" greetings.vim - 0.0.1
"
" Author:
"     Paul Meffle
"
" Summary:
"     Pick a random greeting from a file and combine it with a character.
"
" Changelog:
"     0.0.1 (14.09.2017) initial release
"
" License:
"     Zlib license

if exists('g:loaded_greetings')
        finish
endif
let g:loaded_greetings = 1

let s:cpo_save = &cpo
set cpo&vim

" Get the path of the plugin root directory
let s:script_directory = expand('<sfile>:p:h:h')

" Set a default character
if !exists("g:greetings_character")
        let g:greetings_character = "d[ o_0 ]b"
endif

" With 'g:greetings_file' the user can specify a custom file to read the
" greetings from.
if exists("g:greetings_file")
        let s:greetings_list = readfile(g:greetings_file)
else
        let s:greetings_list = readfile(s:script_directory . "/data/greetings")
endif

" Taken from this [question](stackoverflow.com/questions/12737977/native-vim-random-number-script#12739441fortunes list)
function! s:Random(limit) abort
        return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % (a:limit + 1)
endfunction

" Returns a greeting, consisting of the character a bubble an the greeting
" itself.
function! greetings#RandomGreeting() abort
        let random_number = s:Random(len(s:greetings_list) - 1)
        let greeting = s:greetings_list[l:random_number]
        return g:greetings_character . " <[\"" . l:greeting . "\"]"
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
