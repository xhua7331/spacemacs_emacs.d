
  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  ;; define the refile targets
  (defvar org-agenda-dir "" "gtd org files location")
  (setq-default org-agenda-dir "~/.spacemacs.d/org-notes")
  (setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
  (setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))
  (setq org-agenda-file-journal (expand-file-name "journal.org" org-agenda-dir))
  (setq org-agenda-file-code-snippet (expand-file-name "snippet.org" org-agenda-dir))
  (setq org-default-notes-file (expand-file-name "gtd.org" org-agenda-dir))
  (setq org-agenda-files (list org-agenda-dir))

  (with-eval-after-load 'org-agenda
    (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
    (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
      "." 'spacemacs/org-agenda-transient-state/body)
    )
  ;; the %i would copy the selected text into the template
  ;;http://www.howardism.org/Technical/Emacs/journaling-org.html
  ;;add multi-file journal
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline org-agenda-file-gtd "Workspace")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)
          ("n" "notes" entry (file+headline org-agenda-file-note "Quick notes")
           "* %?\n  %i\n %U"
           :empty-lines 1)
          ("b" "Blog Ideas" entry (file+headline org-agenda-file-note "Blog Ideas")
           "* TODO [#B] %?\n  %i\n %U"
           :empty-lines 1)
          ("s" "Code Snippet" entry
           (file org-agenda-file-code-snippet)
           "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
          ("w" "work" entry (file+headline org-agenda-file-gtd "Cocos2D-X")
           "* TODO [#A] %?\n  %i\n %U"
           :empty-lines 1)
          ("c" "Chrome" entry (file+headline org-agenda-file-note "Quick notes")
           "* TODO [#C] %?\n %(zilongshanren/retrieve-chrome-current-tab-url)\n %i\n %U"
           :empty-lines 1)
          ("l" "links" entry (file+headline org-agenda-file-note "Quick notes")
           "* TODO [#C] %?\n  %i\n %a \n %U"
           :empty-lines 1)
          ("j" "Journal Entry"
           entry (file+datetree org-agenda-file-journal)
           "* %?"
           :empty-lines 1)
          ;; '("j" "Journal" entry (file+datetree "~/.emacs.d/org/journal.org")
            ;; "* %U - %^{heading}\n  %?")

          ))

  ;;An entry without a cookie is treated just like priority ' B '.
  ;;So when create new task, they are default 重要且紧急
  (setq org-agenda-custom-commands
        '(
          ("w" . "任务安排")
          ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
          ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
          ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
          ("b" "Blog" tags-todo "BLOG")
          ("p" . "项目安排")
          ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"cocos2d-x\"")
          ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"zilongshanren\"")
          ("W" "Weekly Review"
           ((stuck "") ;; review stuck projects as designated by org-stuck-projects
            (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
            ))))

;; 自动换行
(setq truncate-lines nil)  
;; 打开 org-indent mode
;; (setq org-startup-indented t)

;; 设置 bullet list
;; (setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))

;; ;; 设置 todo keywords
;; (setq org-todo-keywords
;;       '((sequence "TODO" "HAND" "|" "DONE")))
;; ;; 调试好久的颜色，效果超赞！todo keywords 增加背景色
;; (setf org-todo-keyword-faces '(("TODO" . (:foreground "white" :background "#95A5A6"   :weight bold))
;;                                ("HAND" . (:foreground "white" :background "#2E8B57"  :weight bold))
;;                                ("DONE" . (:foreground "white" :background "#3498DB" :weight bold))))

;;;;;;;;;;;;;;;;;;;;;set org-capture
;; 设置全局快捷键, 方便随时使用这个功能
;;(global-set-key (kbd "C-o c") 'org-capture)

;; 设置 org-agenda 打开快捷键
;;打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
;; rake remember
(global-set-key (kbd "C-c r") 'org-capture)
;; 我使用的 Spacemacs , 实际使用的是下面的快捷键
;; (evil-leader/set-key "oc" 'org-capture)

;; ;; 设置默认情况下, 添加的任务到哪个文件中
;; (setq org-default-notes-file "/Users/ljg/Library/Mobile Documents/com~apple~CloudDocs/org/gtd.org")
;;org-mode 对代码块进行高亮
(setq org-src-fontify-natively t)
;; 自动换行
;; (global-visual-line-mode 1) ; 1 for on, 0 for off.
;; visual-line-mode
;; global-visual-line-mode
;; truncate-lines
