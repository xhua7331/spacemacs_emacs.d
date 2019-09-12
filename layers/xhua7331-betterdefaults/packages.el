


(defconst xhua7331-betterdefaults-packages
  '(
    (recentf :location built-in)
    ;; (vline :location (recipe :fetcher github "https://github.com/emacsmirror/vline"))
    )
    

  )

(defun xhua7331-betterdefaults/post-init-recentf ()
  (progn
    (setq recentf-exclude
          '("COMMIT_MSG"
            "COMMIT_EDITMSG"
            "github.*txt$"
            "/tmp/"
            "/ssh:"
            "/sudo:"
            "/TAGS$"
            "/GTAGS$"
            "/GRAGS$"
            "/GPATH$"
            "\\.mkv$"
            "\\.mp[34]$"
            "\\.avi$"
            "\\.pdf$"
            "\\.sub$"
            "\\.srt$"
            "\\.ass$"
            ".*png$"))
    (setq recentf-max-saved-items 2048)))

;; (defun xhua7331-betterdefaults/init-vline ()
;;   ;; "高亮当前列"
;;   (use-package vline
;;     :defer t
;;     :init
;;     (spacemacs/set-leader-keys
;;       "otc" #'vline-mode
;;       "otC" #'vline-global-mode)
;;     :config
;;     ;; 与默认的行高亮的颜色相同
;;     (set-face-background vline-face "#073642")))

(defun xhua7331-betterdefaults/post-init-flyspell-correct ()
  (use-package flyspell-correct
    :config (progn
              (setq ispell-program-name “aspell”)
              (setq exec-path '("d:/A_software/com_usepage/Aspell/bin/aspell.exe"))
              (setq ispell-personal-dictionary "d:/A_software/com_usepage/Aspell/dict/mydic.txt")
              ;; (setq ispell-process-directory “~/Aspell/”)
              (setq ispell-alternate-dictionary "d:/A_software/com_usepage/Aspell/dict/en-only.rws")
              (setq flyspell-correct-interface 'flyspell-correct-ivy)

              ;; (with-eval-after-load
              ;;     'flyspell (define-key flyspell-mode-map (kbd “C-\;”) 'flyspell-correct-previous-word-generic)
              ;;     )

             )))
