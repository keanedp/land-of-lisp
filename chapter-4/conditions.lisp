(if '()
    'i-am-true
    'i-am-false)

(if '(1)
    'i-am-true
    'i-am-false)

;; recursion

(defun my-length (list)
  (if list
      (progn
        (let ((result (1+ (my-length (cdr list)))))
          (write-line (concatenate 'string "result: " (write-to-string result)))
          result))
      0))

(my-length '(list with four symbols))

;; when & unless

(defvar *number-is-odd* nil)
(when (oddp 5)
  (setf *number-is-odd* t)
  'odd-number)

(unless (oddp 4)
  (setf *number-is-odd* nil)
  'even-number)

;; cond

(defvar *arch-enemy* nil)
(defun pudding-eater (person)
  (cond ((eq person 'henry)
         (setf *arch-enemy* 'stupid-lisp-alien)
         '(curse you lisp alien - you ate my pudding))
        ((eq person 'johnny)
         (setf *arch-enemy* 'useless-old-johnny)
         '(i hope you choked on my pudding johnny))
        (t '(why uo eat my pudding stranger?))))

(pudding-eater 'henry)
(pudding-eater 'johnny)
(pudding-eater 'daniel)

(if (find-if #'oddp '(2 4 5 6))
    'there-is-an-odd-number
    'tre-is-no-odd-number)

;; equality
;; functions: equal, eql, eq, =, string-equal and equalp

;; Use eq to compare symbols
(defparameter *fruit* 'apple)
(cond ((eq *fruit* 'apple) 'its-an-apple)
      ((eq *frit* 'orange) 'its-an-orange))

;; Use equal for everything else

;; symbols
(equal 'apple 'apple)
;; lists
(equal (list 1 2 3) (list 1 2 3))
;; lists created in different ways
(equal '(1 2 3) (list 1 2 3))
(equal '(1 2 3) (cons 1 (cons 2 (cons 3 nil))))
;; compare ints
(equal 5 5)
;; compare floats
(equal 2.5 2.5)
;; does notcompare ints and floats
(equal 10 10.0) => NIL
;; strings
(equal "foo" "foo")
;; characters
(equal #\a #\a)

;; equalp compare ints and floats + ignore case in strings

;;strings
(equalp "Test" "test")
(equalp '(Test) '(test))

;; numbers
(equalp 10 10.0)
