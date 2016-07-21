;;; package --- summary
;;; Commentary:
;;; Code:
(set-face-attribute 'default nil :height 80)
(scroll-bar-mode 0)

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-w") 'kill-region)

(define-key helm-map [(control ?w)] #'backward-kill-word)

(setq split-height-threshold nil
      split-width-threshold 240)


; Ignores files in projectile project grep
(add-to-list 'grep-find-ignored-files "*.JPG")
(add-to-list 'grep-find-ignored-files "irodsServer")
(add-to-list 'grep-find-ignored-files "irodsReServer")
(add-to-list 'grep-find-ignored-files "irodsAgent")
(add-to-list 'grep-find-ignored-directories "external")


; cmake-ide
(require 'rtags) ;; optional, must have rtags installed
(require 'auto-complete-clang)
(setq ac-quick-help-delay 0.5)
(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
(define-key c-mode-base-map (kbd "M-.") 'rtags-find-symbol-at-point)
(define-key c-mode-base-map (kbd "M-*") 'rtags-location-stack-back)
(setq rtags-use-helm t)
(cmake-ide-setup)


; point at beginning of match during forward search
(defun my-goto-match-beginning ()
  (when (and isearch-forward isearch-other-end)
    (goto-char isearch-other-end)))
(add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)


; Error during download request: Not Found
; M-x package-refresh-contents


(provide 'prelude-personal-custom)
;;; prelude-personal-custom ends here
