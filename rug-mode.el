;;; rug-mode.el --- Rug language major mode

;;; Commentary:

;; Copyright (C) 2017 Atomist, Inc.

;; Author: Atomist, Inc. <oss@atomist.com>
;; URL: https://github.com/atomist/rug-emacs-mode
;; Version: 0.1.0
;; Keywords: languages

;; This file is distributed under the terms of the Apache License (version 2.0).

;; Add this to your .emacs:

;; (add-to-list 'load-path "~/.emacs.d/atomist/rug.el")
;; (require 'rug)

;;; History

;; January 23rd, 2017: Initial content

;;; Code:
(require 'ansi-color)

(defvar rug-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?' "\"" table)
    (modify-syntax-entry ?\" "\"" table)
    (modify-syntax-entry ?# "<" table)
    (modify-syntax-entry ?\n ">" table)
    (modify-syntax-entry ?/ ". 14b" table)
    (modify-syntax-entry ?* ". 23b" table)
    table))

(defvar rug-font-lock-keywords
  (list
   (list (concat
          "\\<" (regexp-opt '("with") t) "\\s-+\\([[:alpha:]][[:alnum:]_.-]*\\)\\s-+\\([[:alpha:]][[:alnum:]_]*\\)\\s-+"(regexp-opt '("when") t))
         '(1 font-lock-keyword-face)
         '(2 font-lock-type-face)
         '(3 font-lock-variable-name-face)
         '(4 font-lock-keyword-face))
   (list (concat
          "\\<" (regexp-opt '("scenario") t) "\\s-+\\(.*\\)")
         '(1 font-lock-keyword-face)
         '(2 font-lock-function-name-face))
   (list (concat
          "\\<" (regexp-opt '("with") t) "\\s-+\\([[:alpha:]][[:alnum:]_.-]*\\)")
         '(1 font-lock-keyword-face)
         '(2 font-lock-type-face))
   (list (concat
          "\\<" (regexp-opt '("with") t) "\\s-+\\([[:alpha:]][[:alnum:]_.-]*\\)\\s-+\\([[:alpha:]][[:alnum:]_]*\\)")
         '(1 font-lock-keyword-face)
         '(2 font-lock-type-face)
         '(3 font-lock-variable-name-face))
   (list (concat
          "\\<" (regexp-opt '("do") t) "\\s-+\\([[:alpha:]][[:alnum:]_]*\\)")
         '(1 font-lock-keyword-face)
         '(2 font-lock-function-name-face))
   (list (concat
          "\\<" (regexp-opt '("begin" "end" "when" "and" "given" "then") t) "\\>")
         '(1 font-lock-keyword-face))
   (list (concat
          (regexp-opt '("param") t) "\\s-+\\([[:alpha:]][[:alnum:]_]*\\):")
         '(1 font-lock-keyword-face)
         '(2 font-lock-variable-name-face))
   (list (concat
          "\\<" (regexp-opt '("param") t) "\\s-+\\([[:alpha:]][[:alnum:]_]*\\):\\s-\\(@[[:alpha:]][[:alnum:]_]*\\)")
         '(1 font-lock-keyword-face)
         '(2 font-lock-variable-name-face)
         '(3 font-lock-variable-name-face))
   (list (concat
          "\\<" (regexp-opt '("let") t) "\\s-+\\([[:alpha:]][[:alnum:]_]*\\)\\s-*=")
         '(1 font-lock-keyword-face)
         '(2 font-lock-variable-name-face))
   (list (concat
          "\\<" (regexp-opt '("let") t) "\\s-+\\([[:alpha:]][[:alnum:]_]*\\)\\s-*=\\s-*\\([[:alpha:]][[:alnum:]_]*\\)")
         '(1 font-lock-keyword-face)
         '(2 font-lock-variable-name-face)
         '(3 font-lock-variable-name-face))
   (list (concat
          "\\<" (regexp-opt '("editor" "generator" "reviewer" "precondition" "predicate" "executor") t) "\\s-+\\([[:upper:]][[:alnum:]_]*\\)")
         '(1 font-lock-keyword-face)
         '(2 font-lock-function-name-face))
   (list (concat
          "\\<" (regexp-opt '("uses") t) "\\s-+\\([[:alpha:]][[:alnum:]_.-]+\\)")
         '(1 font-lock-keyword-face)
         '(2 font-lock-function-name-face))
   (list (concat
          (regexp-opt '("@tag" "@description" "@optional" "@displayName" "@validInput" "@maxLength" "@minLength" "@generator" "@default") t))
         '(1 font-lock-preprocessor-face)))
  "Keyword highlighting specification for `rug-mode'.")

;;;###autoload
(define-derived-mode rug-mode prog-mode "Rug"
  "Simple Rug Mode"
  :syntax-table rug-mode-syntax-table
  (set (make-local-variable 'tab-width) 4)
  (setq major-mode 'rug-mode)
  (setq mode-name "Rug")
  (setq-local font-lock-defaults
       '(rug-font-lock-keywords)))

;;;###autoload
(add-to-list 'auto-mode-alist (cons (purecopy "\\.rug\\'")  'rug-mode))
(add-to-list 'auto-mode-alist '("\\.rt\\'" . rug-mode))

(provide 'rug-mode)

;; Local Variables:
;; coding: utf-8
;; indent-tabs-mode: nil
;; End:

;;; rug-mode.el ends here
