" put in ~/.config/nvim/bundle/nerdtree_plugin

call NERDTreeAddKeyMap({'key': 't', 'callback': 'NERDTreeMyOpenInTab', 'scope': 'FileNode', 'override': 1 })
function NERDTreeMyOpenInTab(node)
    call a:node.open({'reuse': "all", 'where': 't'})
endfunction