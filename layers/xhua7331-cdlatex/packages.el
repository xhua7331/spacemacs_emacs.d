;   `xhua7331-cdlatex/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:
(defconst xhua7331-cdlatex-packages
  '(youdao-dictionary
    cdlatex

    )

  )


;; 初始化 package
;; 可以使用 , d m 快捷键, 然后按下 e 展开宏
(defun xhua7331-cdlatex/init-youdao-dictionary ()
  (use-package youdao-dictionary
    :defer t
    :init
    (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
    )
  )

(defun xhua7331-cdlatex/post-init-company()
  (setq company-minimum-prefix-length 1)
  )
;;
(defun xhua7331-cdlatex/init-cdlatex()
  (use-package cdlatex
    :defer t
    :init
    (progn
      (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)  
      (add-hook 'latex-mode-hook 'turn-on-cdlatex)
      
      )
    :config
    (progn
      (turn-on-cdlatex) ;; 加载cdlatex
      )
    )
  )
;; (defun xhua7331-cdlatex/open-file-with-projectile-or-counsel-git ()
;;   (interactive)
;;   (if (xhua7331-cdlatex/vcs-project-root)
;;       (counsel-git)
;;     (if (projectile-project-p)
;;         (projectile-find-file)
;;       (ido-find-file))))



;;; packages.el ends here
