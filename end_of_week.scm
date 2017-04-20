#lang racket

(require "adjust_days.scm")
(require gregor)

(provide end-of-week)

(define (weekday-adjust day week-start)
  (+ (if (< day week-start) -7 0) 6))

(define (get-weekday-diff date week-start)
  (let ([day (->wday date)])
    (let ([suffix (- day week-start)])
         (- (weekday-adjust day week-start) suffix))))

(define (get-week-start options)
  (if (null? options) 0 options))

(define (end-of-week date options)
  (let ([week-start (get-week-start options)])
    (adjust-days date (get-weekday-diff date week-start))))

