#lang racket

(define beats (lambda () 
  (let ((now (seconds->date (current-seconds) #f)))
    (+ (* (date-hour now) (/ 1000 24))
       (* (date-minute now) (/ 1000 (* 24 60)))
       (* (date-second now) (/ 1000 (* 24 60 60)))))))

(printf "@~v" (beats))