(setq doom-font
      (font-spec :family "CaskaydiaCove Nerd Font"
                 :size 18))

(setq doom-theme 'doom-tomorrow-night)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

(setq evil-want-minibuffer t)


(after! evil
  (evil-set-initial-state 'compilation-mode 'normal))

(setq fancy-splash-image (concat doom-user-dir "vagabond.png"))


(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

(setq display-time-day-and-date t
      display-time-24hr-format nil
      display-time-default-load-average nil
      display-time-format "%a, %b %d %I:%M%p")
(display-time-mode 1)

(unless (equal "Battery status not available"
               (battery))
  (display-battery-mode 1))

(after! dirvish
  (setq dirvish-preview-dispatchers
        (append dirvish-preview-dispatchers '(pdf image)))
  (setq dirvish-preview-window-size '(0.4 . 0.4)))

(set-popup-rule! "^\\*eww\\*" :side 'right :size 0.5 :select t)

;; Auto Formatting

(after! apheleia
  (set-formatter! 'isort '("isort" "-" "--profile" "black") :modes '(python-mode))
  (setq apheleia-mode-alist
        (cons '(python-mode . (isort black))
              (delete (assoc 'python-mode apheleia-mode-alist) apheleia-mode-alist)))
  (set-formatter! 'stylua '("stylua" "-") :modes '(lua-mode))
  (set-formatter! 'alejandra '("/run/current-system/sw/bin/alejandra" "-") :modes '(nix-mode))
  (set-formatter! 'clang-format "clang-format" :modes '(c-mode c++-mode)))
