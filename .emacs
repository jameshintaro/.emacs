; install text-adjust.el, mell.el and cua-mode.el in lisp folder

; C:/home を初期ディレクトリにする
(cd "c:/home/")

;; load-path を追加
(add-to-list 'load-path "c:/home/.emacs.d/lisp/")

;; load *.el
(load "text-adjust")
(load "replaceNUM")
(load "insertTEMP")
(load "refresh")
(load "highlight")

;; バックアップを残さない
(setq make-backup-files nil)

;; 行数を表示させる
(require 'linum)
(global-linum-mode)

;; set language
(set-language-environment 'Japanese)
(prefer-coding-system 'shift_jis)

;; activate cua cut copy paste
(cua-mode t)

 ;;"yes or no"を"y or n"にする
(fset 'yes-or-no-p 'y-or-n-p)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; @ Colour
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 背景は黒主義です。
(set-background-color "black")
(set-foreground-color "white")

(if window-system (progn

  (set-face-foreground 'font-lock-comment-face "MediumSeaGreen")
; (set-face-foreground 'font-lock-string-face "purple")
; (set-face-foreground 'font-lock-keyword-face "blue")
; (set-face-foreground 'font-lock-function-name-face "blue")
; (set-face-bold-p 'font-lock-function-name-face t)
; (set-face-foreground 'font-lock-variable-name-face "orange")
; (set-face-foreground 'font-lock-type-face "LightSeaGreen")
; (set-face-foreground 'font-lock-builtin-face "purple")
; (set-face-foreground 'font-lock-constant-face "red")
; (set-face-foreground 'font-lock-warning-face "blue")
; (set-face-bold-p 'font-lock-warning-face nil)
))











;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; @ Windows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; windows position
(when window-system (set-frame-position (selected-frame) 280 15))

;; windows size
(setq default-frame-alist
  '((width . 100) (height . 30)))

;; startup scratch
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; james key map
;;(define-key global-map (kbd "C-j") 'james-mode)






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; @ custom <- dont touch
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes nil)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Arial" :foundry "outline" :slant normal :weight normal :height 143 :width normal)))))














;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; @ White Space
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; タブや全角空白などを強調表示
;; (global-whitespace-mode 1)

;;  全角スペース表示の切替
(global-set-key (kbd "M-w") 'global-whitespace-mode) 

;; whitespace-mode の 色設定
;;http://ergoemacs.org/emacs/whitespace-mode.html
(require 'whitespace)
(setq whitespace-style 
      '(face tabs tab-mark spaces space-mark newline newline-mark))

(setq whitespace-display-mappings
      '(
        (space-mark ?\u3000 [?□])  ; 全角スペース
        (space-mark ?\u0020 [?\xB7])  ; 半角スペース
        (newline-mark ?\n   [?$ ?\n]) ; 改行記号
        (tab-mark   ?\t   [?\xBB ?\t]) ; tab
        ) )

(setq whitespace-space-regexp "\\([\x0020\x3000]+\\)" )
;正規表現に関する文書。 Emacs Lispには、正規表現リテラルがないことへの言及
;http://www.mew.org/~kazu/doc/elisp/regexp.html
;
;なぜか、全体をグループ化 \(\) しておかないと、うまくマッチしなかった罠
;
(set-face-foreground 'whitespace-space "Goldenrod1")
(set-face-background 'whitespace-space 'nil)
(set-face-bold-p 'whitespace-space t)

(set-face-foreground 'whitespace-tab "DarkOliveGreen1")
(set-face-background 'whitespace-tab nil)
(set-face-underline  'whitespace-tab t)

(set-face-foreground 'whitespace-newline  "DimGray")
(set-face-background 'whitespace-newline 'nil)












;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  @ <f> keybinds
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; repeat button like <f4>
(define-key global-map (kbd "<f5>") 'repeat)

;; refresh button
(define-key global-map (kbd "<f6>") 'revert-buffer-no-confirm)

;; replace button
;(define-key global-map (kbd "<f9>") 'replace-jp)

;; translation
;(define-key global-map (kbd "<f10>") 'replace-en)

(define-key global-map (kbd "<f11>") 'text-adjust-space)
(define-key global-map (kbd "<f12>") 'text-adjust-hankaku)









;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; @ keybinds
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key global-map "\M-s" 'save-buffer)
(define-key global-map "\M-o" 'find-file)
(define-key global-map "\M-z" 'redo)
(define-key global-map "\M-c" 'kill-buffer)
(define-key global-map "\M-t" 'kill-emacs)  ;; exit button
(define-key global-map "\C-f" 'delete-backward-char)
(define-key global-map "\C-w" 'move-beginning-of-line)
(define-key global-map "\C-t" 'delete-other-windows)
(define-key global-map "\C-a" 'mark-whole-buffer)
(define-key global-map "\C-b" 'switch-to-buffer)
(define-key global-map "\C-q" 'beginning-of-buffer)
(define-key global-map "\M-b" 'list-buffers)
(define-key global-map "\C-p" 'split-window-horizontally)
(define-key global-map "\C-o" 'other-window)
(define-key global-map "\C-l" 'keep-highlight-regexp)
(define-key global-map "\C-k" 'cancel-highlight-regexp)
(define-key global-map "\C-i" 'query-replace)
(define-key global-map "\C-n" 'replace-number)
(define-key global-map "\C-@" 'replace-template)
(global-set-key (kbd "C-.") ctl-x-map)

; (define-key global-map "\C-." 'string-rectangle)
; (global-set-key "\C-," 'delete-rectangle)
;;  (global-set-key (kbd "M-.") 'text-scale-increase)
;;  (global-set-key (kbd "M-,") 'text-scale-decrease)


















;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; @ mouce
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (display-mouse-p)
  ;; フレーム外/モードラインでのホイール回しでエラーを出さない
  (dolist (pos '("nil" "mode-line" "right-fringe" "left-fringe"))
    (global-set-key (kbd (format "<%s> <%s>" pos mouse-wheel-down-event)) 'ignore)
    (global-set-key (kbd (format "<%s> <%s>" pos mouse-wheel-up-event)) 'ignore))

  ;; ミニバッファでもホイール回しでエラーを出さない
  (add-hook 'minibuffer-setup-hook
            (lambda ()
              (local-set-key (kbd (format "<%s>" mouse-wheel-down-event)) 'ignore)
              (local-set-key (kbd (format "<%s>" mouse-wheel-up-event)) 'ignore)))
  (define-key minibuffer-inactive-mode-map (kbd (format "<%s>" mouse-wheel-down-event)) 'ignore)
  (define-key minibuffer-inactive-mode-map (kbd (format "<%s>" mouse-wheel-up-event)) 'ignore)

  ;; ホイールクリックで貼り付けは使わない
  (dolist (key '("<mouse-2>" "<down-mouse-2>"
                 "<left-fringe> <mouse-2>" "<right-fringe> <mouse-2>"))
    (global-unset-key (kbd key)))
  (with-eval-after-load "ffap"
    (global-set-key (kbd "<mouse-2>") 'ffap-at-mouse))

  ;; 右クリックは編集メニュー表示
  (dolist (key '("<mouse-3>" "<down-mouse-3>" "<drag-mouse-3>"))
    (global-unset-key (kbd key)))
  (when (display-popup-menus-p)
    (global-set-key (kbd "<mouse-3>") menu-bar-edit-menu))

  ;; Ctrl+Wheel で文字サイズ変更
  (when (display-multi-font-p)
    (global-set-key (kbd (format "<C-%s>" mouse-wheel-down-event)) 'text-scale-increase)
    (global-set-key (kbd (format "<C-%s>" mouse-wheel-up-event)) 'text-scale-decrease)
    (global-unset-key (kbd "<C-down-mouse-2>"))
    (global-set-key (kbd "<C-mouse-2>") (defun init:text-scale-reset ()
                                          "テキストのスケーリングをリセットする."
                                          (interactive)
                                          (text-scale-set 0)))))



;; Left-Click
(global-set-key [drag-mouse-1] 'test-drag-mouse)
(global-set-key [double-drag-mouse-1] 'test-double-drag-mouse)
(global-set-key [triple-drag-mouse-1] 'test-triple-drag-mouse)


;; shift + click select region
(define-key global-map (kbd "<S-down-mouse-1>") 'ignore) ; turn off font dialog
(define-key global-map (kbd "<S-mouse-1>") 'mouse-set-point)
;; (put 'mouse-set-point 'CUA 'move)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; @Aspell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'exec-path "C:/Program Files/bin/")
(setq ispell-program-name "aspell")
    (setq ispell-personal-dictionary "c:/home/.emacs.d/dic/.ispell")

(require 'ispell)

(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-<f8>") 'flyspell-mode)








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   @ igrep
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;(autoload 'igrep "igrep"
;       "*Run `grep` PROGRAM to match REGEX in FILES..." t)
;    (autoload 'igrep-find "igrep"
;       "*Run `grep` via `find`..." t)
;    (autoload 'igrep-visited-files "igrep"
;       "*Run `grep` ... on all visited files." t)
;    (autoload 'dired-do-igrep "igrep"
;       "*Run `grep` on the marked (or next prefix ARG) files." t)
;    (autoload 'dired-do-igrep-find "igrep"
;       "*Run `grep` via `find` on the marked (or next prefix ARG) directories." t)
;    (autoload 'Buffer-menu-igrep "igrep"
;      "*Run `grep` on the files visited in buffers marked with '>'." t)
;    (autoload 'igrep-insinuate "igrep"
;      "Define `grep' aliases for the corresponding `igrep' commands." t)










;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; @eww
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "eww")

;; keybind
(define-key eww-mode-map "\z" 'eww-back-url)
(define-key eww-mode-map "\p" 'shr-previous-link)

;; highlight seached words
(setq eww-search-prefix "http://www.googl.com/search?q=")
(defun eww-search (term)
  (interactive "sSearch terms: ")
  (setq eww-hl-search-word term)
  (eww-browse-url (concat eww-search-prefix term)))
 
(add-hook 'eww-after-render-hook (lambda ()
           (highlight-regexp eww-hl-search-word)
           (setq eww-hl-search-word nil)))














;;;;;;;;;;;;;;;;;;;;;;;
;; TEST



