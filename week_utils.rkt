#lang racket

(require "adjust_days.scm")

(define week-day-names
  (list "Sunday" "Monday" "Tuesday"
        "Wednesday" "Thursday" "Friday" "Saturday"))

(define get-next-week 
  (lambda (date [days-in-week 7])
    (adjust-days date days-in-week)))

(define get-next-week-day
  (lambda (date [days-in-week 7])
    (get-day(#:date (get-next-week date days-in-week)))))