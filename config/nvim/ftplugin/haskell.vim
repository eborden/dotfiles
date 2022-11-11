let b:package_root = fnamemodify(findfile('stack.yaml', '.;'), ':p:h')
autocmd BufEnter *.hs exec 'lcd ' . b:package_root

" Haskell Vim
let b:haskell_enable_quantification = 1 " to enable highlighting of forall
let b:haskell_enable_recursivedo = 1 " to enable highlighting of mdo and rec
let b:haskell_enable_arrowsyntax = 1 " to enable highlighting of proc
let b:haskell_enable_pattern_synonyms = 1 " to enable highlighting of pattern
let b:haskell_enable_typeroles = 1 " to enable highlighting of type roles

" Haskell Indentation
let b:haskell_indent_before_where = 1
let b:haskell_indent_after_bare_where = 2
let b:haskell_indent_in = 0

" ALE
let b:ale_linters = ['hlint']
let b:ale_fixers = ['hlint', 'brittany', 'stylish-haskell']
let b:ale_haskell_hlint_executable='stack'
let b:ale_haskell_brittany_executable='stack'
let b:ale_haskell_stylish_haskell_executable='stack'

" Tags
let b:ctags_command = 'stack exec -- fast-tags -R --nomerge .'

" Remap tags to search stackage on failure
if !exists("*HaskellGoToTag")
  function! HaskellGoToTag ()
      let l:search_tag = expand('<cword>')
      try
          exe ':tag '.l:search_tag
      catch
          " echo v:exception
          " echo "Launching stackage..."
          exe ':silent !google-chrome "https://backend-hoogle.freckle.com/?scope=set:all&hoogle='.l:search_tag.'"'

      endtry
  endfunction
endif

nnoremap <buffer> <C-]> :call HaskellGoToTag()<CR>
