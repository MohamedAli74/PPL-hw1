#lang racket/base

; Signature:last-item(lst)
; Type: List(T) => T
; Purpose: given a list lst, returns the last item
; Pre-conditions: lst should not be empty
; Tests: *in the test folder*
(define last-item
    (lambda (lst)
    (if (eq? (cdr lst) '())
        (car lst)
        (last-item (cdr lst))
        )
))
;---------------------------------------------
; Signature: remove-last-item(lst)
; Type: List(T) => List(T)
; Purpose: given a list, returns the list without it's last element
; Pre-condition: lst should not be empty
; Tests: *in the test folder*
(define remove-last-item
    (lambda (lst)
     (if (eq? (cdr lst) '())
         '()
         (cons (car lst) (remove-last-item (cdr lst)))
         )
))
;----------------------------------------------
; Signature: rotate-nth(lst,n)
; Type: List(T) * number => List(T)
; Purpose: given a list, shifts the elements n times and return the list.
; Pre-condition: true
; Tests: *in the test folder*
(define rotate-nth
    (lambda (lst n)
      (let ((lst1 (cut-from lst (mod n (length lst) ))) (lst2 (cut-to lst (mod n (length lst) )) ) )
        (rotate-iter lst1 lst2)
      )
        )
)

(define length
  (lambda (lst)
    (if(eq? cdr '())
            1
            (+ 1 (length(cdr lst)))
            )
    )
   )

(define mod
  (lambda (toRotate n)
    (if (> n toRotate)
        toRotate
        (mod (- toRotate n) n )
        )
  )
 )

(define cut-from
 (lambda (lst n)
   (if (eq? n 0)
       (if (eq? (cdr lst) '())
           lst
           (cons (car lst) (cut-from (cdr lst) n))
       )
       (cut-from lst (- n 1) )
   )
  )
  )

(define cut-to
  (lambda (lst n)
    (if (eq? n 0)
        '()
        (cons (car lst) (cut-to (car lst) (- n 1)))
        )
    )
  )

(define rotate-iter
  (lambda (lst1 lst2)
    (if (eq? lst1 '())
        (if (eq? lst2 '())
            '()
            (cons (car lst2) (rotate-iter lst1 (cdr lst2)))
            )
        (cons (car lst1) (rotate-iter (cdr lst1) lst2) )
        )
      ))



(require rackunit)
(require rackunit/text-ui)

(define tests
    (test-suite "Assignment 1 - Part 4"
    
        (test-suite "last-item"
            (check-equal? (last-item '(1 2 3)) 3)
            (check-equal? (last-item '(a b c)) 'c)
            ; Your tests here (optinal)
        )

        (test-suite "remove-last-item"
            (check-equal? (remove-last-item '(1 2 3)) '(1 2))
            (check-equal? (remove-last-item '(a b c d)) '(a b c))
            ; Your tests here (optinal)
        )

        (test-suite "rotate-nth"
            (display (rotate-nth '(1 2 3) 1))
            (check-equal? (rotate-nth '(1 2 3) 1) '(3 1 2))
            (check-equal? (rotate-nth '(a b c d) 2) '(c d a b))
            ; Your tests here (optinal)
        )
    )
)

(run-tests tests)
