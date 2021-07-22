let g:startify_bookmarks = [
  \ { 'c': '~/Documents/Code' },
  \ { 'x': '~/.config/nvim/plug-config/startfy.vim' },
  \ { 'k': '~/.config/sxhkd/sxhkdrc' },
  \ ]

let g:startify_lists = [
      \ { 'header': ['   Bookmarks'],       'type': 'bookmarks' },
      \ { 'header': ['   LFO'],            'type': 'files' },
      \ { 'header': ['   LDO '. getcwd()], 'type': 'dir' },
      \ ]

let g:startify_fortune_use_unicode = 0
