
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-LaTeX-mode()
  ;; (turn-on-cdlatex) ;; 加载cdlatex
  (outline-minor-mode)  ;;加载outline-minor mode
  (turn-on-reftex)  ;; 加载reftex
  (auto-fill-mode) ;;自动换行
  (TeX-fold-mode t) ;; 加载TeX fold mode
  (outline-hide-body) ;; 打开文件时只显示章节标题

    ;;   (assq-delete-all 'output-pdf TeX-view-program-selection)
    ;; ;; ;; (assq-delete-all (quote output-pdf) TeX-view-program-selection) 
    ;;   (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))
      )

(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode)
;
(add-hook 'LaTeX-mode-hook #'outline-minor-mode)

;; ;;pdf正向搜索setting
;; (setq TeX-PDF-mode t) 
;; (setq TeX-source-correlate-start-server t);; 相当关键, pdf调回的成败在此一句 
;; (setq TeX-source-correlate-mode t) 
;; (setq TeX-source-correlate-method 'synctex)
;; (setq TeX-view-program-list 
;;       '(("Sumatra PDF" ("\"C:/Program Files/SumatraPDF/SumatraPDF.exe\" -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o")))) 
;; ;
;; (add-hook 'LaTeX-mode-hook
;; (lambda ()
;;   (assq-delete-all 'output-pdf TeX-view-program-selection)
;;   (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))))

;;以下为在surmatrapdf中设置:注意替换emacsclientw.exe的文件路径
 ;; 下面一行代码复制到Sumatra PDF的option中
 ;;"C:/Program Files (x86)/Emacs26/bin/emacsclientw.exe" -n +%l "%f"


 ;;设定outline minor mode的前缀快捷键为C-o
 ;;(setq outline-minor-mode-prefix [(control o)])
(setq-default TeX-master nil) ;; 编译时问询主文件名称
(setq TeX-auto-save t)
(setq TeX-parse-selt t) ;; 对新文件自动解析(usepackage, bibliograph, newtheorem等信息)
(setq TeX-save-query nil) ;;save the modified file when compiling
(setq TeX-engine 'xetex)  ;;set xetex to compile
 ;;(setq TeX-show-compilation t) ;display the compilation windows when compiling
;; set outline mode prefic to C-o
;;(setq outline-minor-mode-prefix "\C-o")
;; (setq outline-minor-mode-prefix [(control o)])
;;setting 当编译出错时，弹出错误buffer windows 不出错时不弹出
(defadvice TeX-LaTeX-sentinel
    (around mg-TeX-LaTeX-sentinel-open-output activate)
  "Open output when there are errors."
  ;; Run `TeX-LaTeX-sentinel' as usual.
  ad-do-it
  ;; Check for the presence of errors.
  (when
      (with-current-buffer TeX-command-buffer
        (plist-get TeX-error-report-switches (intern (TeX-master-file))))
    ;; If there are errors, open the output buffer.
    (TeX-recenter-output-buffer nil)))

