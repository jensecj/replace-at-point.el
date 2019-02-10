;;; replace-at-point.el --- Replace thing-at-point with something else. -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Jens Christian Jensen

;; Author: Jens Christian Jensen <jensecj@gmail.com>
;; Package-Version: 20190210
;; Version: 0.1
;; Package-Requires: ((emacs "25.1") (dash "2.14.1") (ht . "2.3"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Replace the thing-at-point with something else.

;;; Code:

(require 'subr-x)
(require 'dash)
(require 'ht)

(defvar replace-at-point--hashmap (ht)
  "Hashmap of replacement (KEY . VALUE) pairs.

KEY is the string at point to replace.
VALUE is what to replace it with.")

(defun replace-at-point--dotted-pair? (val)
  "Returns whether VAL is a dotted pair, (A . B)."
  (and (cdr val) (atom (cdr val))))

(defun replace-at-point-add (kvp-or-list)
  "Add one or more key-value pairs to the
`replace-at-point--hashmap'."
  (cond
   ((replace-at-point--dotted-pair? kvp-or-list)
    (ht-set replace-at-point--hashmap (car kvp-or-list) (cdr kvp-or-list)))
   ((listp kvp-or-list)
    (-map #'replace-at-point-add kvp-or-list))
   (t
    (error "unknown argument: %s" kvp-or-list))))

(defun replace-at-point-remove (key-or-list)
  "Remove one or more keys from the `replace-at-point--hashmap'."
  (cond
   ((stringp key-or-list)
    (ht-remove replace-at-point--hashmap key-or-list))
   ((listp key-or-list)
    (-map #'replace-at-point-remove key-or-list))
   (t
    (error "unknown argument: %s" key-or-list))))

(defun replace-at-point-get (key)
  "Return the value of KEY in `replace-at-point--hashmap', if
present."
  (ht-get replace-at-point--hashmap key))

(defun replace-at-point ()
  "Look at the thing at point, and replace it if there is a
suitable replacement found."
  (interactive)
  (let ((tap (thing-at-point 'word t))
        (bounds (bounds-of-thing-at-point 'word)))
    (if-let ((replacement (replace-at-point-get tap)))
        (progn
          (kill-region (car bounds) (cdr bounds))
          (insert replacement))
      (message "no replacement found for `%s'" tap))))

(defun replace-at-point-setup-defaults ()
  (require 'replace-at-point-greek)
  (require 'replace-at-point-logic)
  (require 'replace-at-point-math))

(provide 'replace-at-point)
