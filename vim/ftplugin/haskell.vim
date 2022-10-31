let b:package_root = fnamemodify(findfile('stack.yaml', '.;'), ':p:h')
autocmd BufEnter *.hs exec 'lcd ' . b:package_root

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
