;; (tool-bar-mode t)
(menu-bar-mode t)
;; 汉字默认字体为Kaiti(楷体)，可改为其它字体
(set-fontset-font "fontset-default" 'han
                  "KaiTi")
;; 数学符号默认字体为Cambria Math
(set-fontset-font "fontset-default" 'symbol
                  "Cambria Math")



;; ------------------------------------------------------------------
;; display-buffer

;; The default behaviour of `display-buffer' is to always create a new
;; window. As I normally use a large display sporting a number of
;; side-by-side windows, this is a bit obnoxious.
;;
;; The code below will make Emacs reuse existing windows, with the
;; exception that if have a single window open in a large display, it
;; will be split horisontally.

;; (setq pop-up-windows nil)

;; (defun my-display-buffer-function (buf not-this-window)
;;   (if (and (not pop-up-frames)
;;            (one-window-p)
;;            (or not-this-window
;;                (not (eq (window-buffer (selected-window)) buf)))
;;            (> (frame-width) 162))
;;       (split-window-horizontally))
;;   ;; Note: Some modules sets `pop-up-windows' to t before calling
;;   ;; `display-buffer' -- Why, oh, why!
;;   (let ((display-buffer-function nil)
;;         (pop-up-windows nil))
;;     (display-buffer buf not-this-window)))

;; (setq display-buffer-function 'my-display-buffer-function)
(defun my-split-window-sensibly (&optional window)
  (let ((window (or window (selected-window))))
    (or (and (window-splittable-p window t)
             ;; Split window horizontally.
             (with-selected-window window
               (split-window-right)))
        (and (window-splittable-p window)
             ;; Split window vertically.
             (with-selected-window window
               (split-window-below)))
        (and (eq window (frame-root-window (window-frame window)))
             (not (window-minibuffer-p window))
             ;; If WINDOW is the only window on its frame and is not the
             ;; minibuffer window, try to split it horizontally disregarding
             ;; the value of `split-width-threshold'.
             (let ((split-width-threshold 0))
               (when (window-splittable-p window t)
                 (with-selected-window window
                   (split-window-right))))))))

(setq split-window-preferred-function 'my-split-window-sensibly)
;;或者只设置这一句
;; (setq split-height-threshold nil split-width-threshold nil)
;; ;;yasnippets保存地址设置
;; (setq yas-snippet-dirs
;;      '("~/.spacemacs.d/snippets";;personal snippets
;;        ))

;; ;; (setq yas-snippet-dirs
;; ;;       '("~/.spacemacs.d/fidding/local/yasnippet/snippets";;personal snippets
;; ;;         ))
;; ;; (yas-global-mode 1)

;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/snippets"                 ;; personal snippets
;;         "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
;;         "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
;;         ))

;; (yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

;; Aspell setting
;; aspell程序的目录到emacs的exec-path中
;; (add-to-list 'exec-path "D:/A_software/com_usepage/Aspell/bin")
;; 我们还需要告诉emacs使用aspell作为拼写检查的检查程序和你的字典目录

(setq ispell-program-name "aspell")
;; (setq ispell-personal-dictionary "C:/path/to/your/.ispell")
