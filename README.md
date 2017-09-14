# vim-greetings

`vim-greetings` picks a random greeting from a file and combines it with an
ascii character and a speech bubble.

## Example
`d[ o_0 ]b <["Oy mate!"]`

## Installation
Copy all the files into the appropriate directory under `~/.vim` or use your
favorite plugin manager. E.g. [vim-plug](https://github.com/junegunn/vim-plug):
```
Plug "sro5h/vim-greetings"
```

## Usage
The plugin provides a single function, `greetings#RandomGreeting`, that returns
the complete greeting as a string.  
E.g. to echo a greeting on startup put the following in your `vimrc`:
```
augroup Startup
        autocmd!
        autocmd VimEnter * echo greetings#RandomGreeting()
augroup END
```
The character can be customized by setting the `g:greetings_character` variable.
To use different greetings set `g:greetings_file` to the path to your file
containing the greetings separated by newlines.
