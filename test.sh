#/bin/bash

test() {
    emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "~/projects/emacs/Emacs.org")'
    emacs -q -l .emacs.d/init.el
}

test
