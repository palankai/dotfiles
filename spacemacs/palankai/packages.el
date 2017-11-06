;;; packages.el --- palankai layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Csaba Palankai <csaba@Csabas-MBP>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `palankai-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `palankai/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `palankai/pre-init-PACKAGE' and/or
;;   `palankai/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst palankai-packages
  '(sr-speedbar)
  "The list of Lisp packages required by the palankai layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(setq create-lockfiles nil)
(setq confirm-kill-emacs 'y-or-n-p)

(defun palankai/init-sr-speedbar ()
  (use-package sr-speedbar
    :config
    (spacemacs/set-leader-keys "os" 'sr-speedbar-toggle)
   )
)


(defun cs/runner (cmd)
  (interactive
   (let ((string (read-string (concat "Command: ") nil 'runner-history)))
     (list  string)))
  (save-some-buffers t)
  (let* ((default-directory cs-project-root)
         )
    (compile (concat "wrapws " cs-workspace " " cmd))))

(defun cs/rerunner ()
  (interactive)
  (save-some-buffers t)
  (let* ((default-directory cs-project-root)
         )

    (recompile)))

(defun cs/interactive ()
  (interactive)
  (comint-mode)
  (read-only-mode)
  )

;; Runner
(progn
  (define-prefix-command 'cs-runner-map)
  (define-key cs-runner-map (kbd "<f5>") 'cs/rerunner)
  (define-key cs-runner-map (kbd "r") 'cs/runner)
  (define-key cs-runner-map (kbd "i") 'cs/interactive)
  )

(global-set-key (kbd "<f5>") cs-runner-map)

;;; packages.el ends here
