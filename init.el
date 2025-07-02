(setq load-path (cons "~/.config/emacs/modules/" load-path))

(load "elpaca")

(elpaca elpaca-use-package
  (elpaca-use-package-mode))

(menu-bar-mode -1)
(tool-bar-mode -1)

(icomplete-mode t)

(which-key-mode t)

(global-display-line-numbers-mode 1)


(setq modus-themes-mode-line '(borderless accented padded))
(setq modus-themes-completions
      '((matches . (extrabold underline))
        (selection . (semibold italic))))
(load-theme 'modus-vivendi t)

(hl-line-mode t)

(blink-cursor-mode t)

(recentf-mode 1)

(setq history-length 25)
(savehist-mode 1)

(save-place-mode 1)

(global-auto-revert-mode 1)

(require 'use-package-ensure)
(setq use-package-always-ensure t)


(use-package evil
  :config
  (evil-mode 1))

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t)
  (doom-themes-org-config))

(use-package helpful)

(use-package rainbow-delimiters)

(use-package vterm)

(use-package general
  :config
  (general-auto-unbind-keys)
  (general-create-definer leader-def
    :prefix "SPC")
  (leader-def
   :keymaps 'normal
   "fs" 'save-buffer
   "b" "buffer"
   "bk" 'kill-buffer-and-window
   "be" 'eval-buffer
   "w" '("window" . ignore)
   "wq" '("Quit current window" . delete-window)
   
   "wv" '("New window | right" . (lambda ()
				   (interactive)
				   (split-window-right)
				   (other-window 1)
				   (dired-jump)))
   
   ":" '("Execute Emacs command" . execute-extended-command)
   "," '("Switch buffer" . switch-to-buffer )

   "t" '("Toggle vterm popup" . (lambda()
				  (interactive)
				  (let ((buffer (get-buffer "*vterm*")))
				    (if (and buffer (get-buffer-window buffer))
				      (delete-window (get-buffer-window buffer))
				     (popup #'vterm)))))))

(defun popup (callback)
  (split-window-below)
  (other-window 1)
  (funcall callback))

(defun make-child-frame ()
  "Wrapper around make-frame that creates a child frame with some defaults"
  (interactive)
  (make-frame `((parent-frame . ,(window-frame))
		(minibuffer . nil)
		(undecorated . t)
		(unsplittable . t)
		(modeline .  nil))))

