#lang racket

; newton's square root method

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt guess x)
  (if (good-enough? guess x)
      guess
      (sqrt (improve guess x)
            x)))

