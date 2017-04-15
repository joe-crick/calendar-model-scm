(require racket/string)

(define (get-twelve-hour-time slot)
  (if (<= slot 12) 12 (- slot 12)))

(define (get-time-period slot)
  (if (and (< slot 12) (>= slot 0) ) "AM" "PM"))

(define (get-hour-from-time time)
 (string->number (if (> (string-length time) 4)
                     (substring time 0 2)
                     (substring time 0 1))))

(define (get-display-minutes time)
  (if (> (string-length time) 4)
                     (substring time 3 5)
                     (substring time 2 4)))

;;; To be moved to a different location later
(define (add-leading-zero-if-less-than-ten num)
  (if (< num 10) (string-append "0" (number->string num)) (number->string num)))

(define (get-display-hour time)
  (add-leading-zero-if-less-than-ten (get-twelve-hour-time (get-hour-from-time time))))

(define (twentyfour-to-twelve-hour-time time)
  (string-append* (list
                   (get-display-hour time) ":" (get-display-minutes time)
                   (get-time-period (get-hour-from-time time)))))
