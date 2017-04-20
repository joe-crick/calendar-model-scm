#lang racket

(require gregor)

(provide adjust-days)

(define (adjust-days date amount)
  (+days date amount))