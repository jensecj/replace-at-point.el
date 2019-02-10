;;; replace-at-point-logic.el --- Logic symbols for replace-at-point. -*- lexical-binding: t; -*-

(require 'replace-at-point)

(defvar replace-at-point-logic--symbols
  '(("and" . "∧")
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
    ("so" . "∴"))
  "List of replacements for logic symbols.")

(replace-at-point-add replace-at-point-logic--symbols)

(provide 'replace-at-point-logic)
