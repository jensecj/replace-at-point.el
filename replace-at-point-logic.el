;;; replace-at-point-logic.el --- Logic symbols for replace-at-point. -*- lexical-binding: t; -*-

(require 'replace-at-point)

;; https://en.wikipedia.org/wiki/List_of_logic_symbols

(replace-at-point-add
 '(
   ("and" . "∧")
   ("conj" . "∧")
   ("or" . "∨")
   ("disj" . "∨")
   ("xdisj" . "⊻")
   ("xor" . "⊕")
   ("not" . "¬")
   ("neg" . "¬")
   ("top" . "⊤")
   ("bot" . "⊥")
   ("forall" . "∀")
   ("exists" . "∃")
   ("nexists" . "∄")
   ("prov" . "⊢")
   ("tack" . "⊢")
   ("tee" . "⊢")
   ("entails" . "⊨")
   ("implies" . "⇒")
   ("iff" . "⇔")
   ("qed" . "∎")
   ("therefore" . "∴")
   ("thus" . "∴")
   ("so" . "∴")
   ))

(provide 'replace-at-point-logic)
