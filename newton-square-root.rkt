#lang racket

; newton's square root method

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; the problem with this is that each of the arguments
; will be evaluated before being passed in to the `cond`
; special form, and in the iteration function below
; (`sqrt-iteration`) that begins an infinite loop
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iteration guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iteration (improve guess x)
                   x)))

(define (newton-sqrt x)
  (sqrt-iteration 1.0 x))

(newton-sqrt 9)
(newton-sqrt 49)
(square (newton-sqrt 1000))
