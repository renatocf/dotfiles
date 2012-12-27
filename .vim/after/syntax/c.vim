" Vim syntax file example
" Put it to ~/.vim/after/syntax/ and tailor to your needs.

let glib_deprecated_errors = 1
let gobject_deprecated_errors = 1
let gdk_deprecated_errors = 1
let gdkpixbuf_deprecated_errors = 1
let gtk_deprecated_errors = 1
let gimp_deprecated_errors = 1

if version < 600
  so <sfile>:p:h/glib.vim
  so <sfile>:p:h/gobject.vim
  so <sfile>:p:h/gdk.vim
  so <sfile>:p:h/gdkpixbuf.vim
  so <sfile>:p:h/gtk.vim
  so <sfile>:p:h/gimp.vim
else
  runtime! syntax/glib.vim
  runtime! syntax/gobjectintrospection.vim
  runtime! syntax/gdkpixbuf.vim
  runtime! syntax/gtk2.vim
  runtime! syntax/gtk3.vim
  runtime! syntax/gtkglext.vim
  runtime! syntax/gtksourceview.vim
  runtime! syntax/gimp.vim
endif

" vim: set ft=vim :
