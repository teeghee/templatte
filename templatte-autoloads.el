;;; templatte-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "templatte" "templatte.el" (0 0 0 0))
;;; Generated autoloads from templatte.el

(autoload 'templatte "templatte" "\
Command to run templatte.  It asks user to select a template
from the list AVAILABLE-TEMPLATES, which is determined by the
files in the template directory with the same filename extension
as the current file in the buffer.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "templatte" '("templatte-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; templatte-autoloads.el ends here
