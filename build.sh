#!/bin/bash
build() {
    echo "Building system..."
    rm -r ~/projects/emacs/dist
    emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "~/projects/arch/Emacs.org")'
    cp -r ~/projects/emacs/.emacs.d/ ~/projects/emacs/dist/
}

