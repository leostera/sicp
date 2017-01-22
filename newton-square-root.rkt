#lang racket

; newton's square root method

(define (improve guess x)
  (average guess (/ x guess)))

(define (newton-sqrt guess x)
  (if (good-enough? guess x)
      guess
      (newton-sqrt (improve guess x)
                   x)))

