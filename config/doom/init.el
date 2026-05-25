(doom! :input

       :completion
       (corfu +orderless)
       vertico

       :ui
       doom
       doom-dashboard
       doom-quit
       hl-todo
       indent-guides
       ligatures
       modeline
       ophints
       (popup +defaults)
       (vc-gutter +pretty)
       vi-tilde-fringe
       workspaces

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       multiple-cursors
       snippets
       (whitespace +guess +trim)
       word-wrap
       (format +onsave)

       :emacs
       (dired +icons +dirvish)
       electric
       tramp
       vc

       :term
       eshell

       :checkers
       syntax

       :tools
       debugger
       docker
       (eval +overlay)
       lookup
       magit
       (pdf +icons)
       terraform
       tmux
       (env +lsp)

       :os
       (:if (featurep :system 'macos) macos)
       tty
       linux

       :lang
       (cc +lsp)
       emacs-lisp
       (go +lsp)
       (haskell +lsp)
       json
       (java +lsp)
       latex
       lua
       (markdown +grip)
       nix
       (org +roam2)
       python
       sh

       :config
       (default +bindings +smartparens))
