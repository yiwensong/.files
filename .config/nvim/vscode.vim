if exists('g:vscode')
  nnoremap <silent> <leader>t <Cmd>call VSCodeCall('editor.action.revealDefinition')<CR>
  nnoremap <silent> ^o <Cmd>call VSCodeCall('workbench.action.navigateBack')<CR>
  nnoremap <silent> ^i <Cmd>call VSCodeCall('workbench.action.navigateForward')<CR>
endif
