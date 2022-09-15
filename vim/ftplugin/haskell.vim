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
