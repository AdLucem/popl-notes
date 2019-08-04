;; sources used:
;; https://www.masteringemacs.org/article/beginners-guide-to-emacs

;; Ido, short for “Interactively Do Things”, is a fantastic addon that is bundled with Emacs.
;; Basically it makes switching between buffers (and optionally files) really easy as you simply type
;; parts of a name and Ido will automatically narrow the list to just the ones matching the search text.
;; to activate ido-mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Emacs by default will pester you with a splash screen and a message in the echo area.
;; To disable both, and have emacs default to its *scratch* buffer, add this to your .emacs
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; emacs does not auto-indent automatically. to make it auto-indent:
(define-key global-map (kbd "RET") 'newline-and-indent)

;; links the MELPA package repository and allows you to download packages
;; load emacs 24's package system. Add MELPA repository.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;; package commands
;; M-x package-menu-refresh : refreshes list of packages from MELPA server
;; M-x list-packages : lists packages

;; theme
(load-theme 'wombat)
