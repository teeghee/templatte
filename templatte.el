;;; templatte.el

;; A simple emacs module for inserting template codes into your
;; buffer.

;; Copyright (C) 2019 Taekyung Kim

;; Author: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>
;; Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>
;; Created: 9 Aug 2019
;; Modified: 10 Aug 2019
;; Version: 20190810
;; Package-Requires: ((emacs "26.2"))
;; Keywords: template
;; URL: https://github.com/teeghee/templatte.git

;;; License Notice:

;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see
;; <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Please see README.md in the repository.

;;; Code:

(require 'ido)
(require 'seq)

(defvar templatte-templates-directory
  (concat user-emacs-directory
          (convert-standard-filename "templates/"))
  "Directory for the templates.")

(defun templatte-get-available-templates (extn)
  "Return the available templates (template file names without
extension) having the extension EXTN."
  (mapcar #'file-name-base
          (seq-filter #'(lambda (file)
                          (string= (file-name-extension file)
                                   extn))
                      (directory-files
                       templatte-templates-directory))))

(defun templatte-paste-template (template-filename)
  "Paste the chosen template given by the TEMPLATE-FILENAME into
the buffer."
  (insert-file-contents (concat templatte-templates-directory
                                template-filename)))

(defun templatte ()
  "Command to run templatte.  It asks user to select a template
from the list AVAILABLE-TEMPLATES, which is determined by the
files in the template directory with the same filename extension
as the current file in the buffer."
  (interactive)
  (let* ((current-extension (file-name-extension (buffer-file-name)))
         (available-templates (templatte-get-available-templates
                               current-extension)))
    (templatte-paste-template
     (concat
      (ido-completing-read "Template: " available-templates)
      "."
      current-extension))))

(unless (file-directory-p templatte-templates-directory)
  (make-directory templatte-templates-directory))


