let b:package_root = fnamemodify(findfile('package.json', '.;'), ':p:h')
autocmd BufEnter *.js exec 'lcd ' . b:package_root

let b:ale_linters = ['eslint', 'flow']
let b:ale_fixers = ['prettier']

" Tags
let b:ctags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=test --exclude=vendor'
