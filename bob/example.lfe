(defmodule bob
  (export (response-for 1)))

(defun response-for (str)
  (first-match
   str
   `(#(,(fun all-spaces? 1) "Fine. Be that way!")
     #(,(fun shouting? 1)   "Whoa, chill out!")
     #(,(fun question? 1)   "Sure.")
     #(,(lambda (_) 'true)  "Whatever."))))

(defun first-match
  ((s (cons `#(,f ,res) fs))
   (case (funcall f s)
     ('true res)
     ('false (first-match s fs)))))

(defun shouting? (str)
  (andalso (: lists any (lambda (c) (andalso (>= c #\A) (=< c #\Z))) str)
           (=:= (: string to_upper str) str)))

(defun question? (str)
  (=:= (: lists last str) #\?))

(defun all-spaces? (str)
  (=/= (: re run str "^(\\h|\\v)*$" '(unicode)) 'nomatch))