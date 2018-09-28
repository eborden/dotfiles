" ALE
let b:ale_linters = ['hlint']
let b:ale_fixers = ['hlint', 'brittany', 'stylish-haskell']
let b:ale_haskell_hlint_executable='stack'
let b:ale_haskell_brittany_executable='stack'
let b:ale_haskell_stylish_haskell_executable='stack'

" Tags
let b:ctags_command = 'find -name "*.hs" -exec fast-tags -v {} +'
let b:fzf_tags_command = 'fast-tags -v'
