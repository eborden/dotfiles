let b:ale_linters = ['hlint']
let g:ale_haskell_stack_build_options='--fast --ghc-options "-fwrite-interface -fno-code"'
if matchstr(expand("%:p:h"), "fancy-api") == "" && matchstr(expand("%:p:h"), "frontrow-entities") == ""
  let b:ale_fixers = ['brittany', 'stylish-haskell']
else
  let b:ale_fixers = ['stylish-haskell']
endif
