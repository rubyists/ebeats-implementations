; 
; chicken scheme implementation of ebeats
;    requires the 'format' egg
;

(use format)

(define (beats n)
  (/ (*  (modulo n 86400) 1157) 100000))

(define (show-beats n)
	(print (format #f "@~,2F" (beats n))))

(show-beats (current-seconds))

