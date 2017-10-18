;;; package --- my configuration files

;;; Commentary:

;;; Code:

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(setq package-archive-priorities
      '(("melpa-stable" .  10)
        ("melpa" . 9)
        ))

(add-to-list 'package-pinned-packages '(ensime . "melpa-stable") t)

(prelude-require-package 'gruber-darker-theme)

(setq prelude-theme 'gruber-darker)
(load-theme 'gruber-darker t)

(toggle-frame-fullscreen)

(prelude-require-package 'powerline)
(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))

;(setq sml/no-confirm-load-theme t)
;;(setq sml/theme 'powerline)
;;(sml/setup)

(powerline-center-theme)

;; Set up org mode

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-directory "~/Documents/notes")
(setq org-default-notes-file (concat org-directory "~/Documents/notes/notes.org"))

(setq org-agenda-files
      (list "~/Documents/notes/gtd.org"
            "~/Documents/notes/work.org"
            "~/Documents/notes/personal.org"
            "~/Documents/notes/notes.org"))

(setq org-refile-targets
      '((nil :maxlevel . 3)
        (org-agenda-files :maxlevel . 3)))


(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)


(provide 'myconfig)
;;; myconfig.el ends here
