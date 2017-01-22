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

(define (newton-sqrt guess x)
  (if (good-enough? guess x)
      guess
      (newton-sqrt (improve guess x)
                   x)))

)
