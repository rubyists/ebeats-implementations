(load (compile-file "package.lisp"))
(in-package :ebeats)
(defun universal-to-ebeat (&optional (utime (get-universal-time)))
  (multiple-value-bind
    (second minute hour date month year day-of-week dst-p tz)
    (decode-universal-time utime 0)
    (let ( 
      (hours-per-beat (/ 1000 24)) 
      (minutes-per-beat (/ 1000 (* 24 60)))
      (seconds-per-beat (/ 1000 (* 24 60 60))))
      (format t "d~2d.~2,'0d.~4d@~d.beat"
            date
            month
            year
            (floor (+ 
              (* hours-per-beat hour) 
              (* minutes-per-beat minute) 
              (* seconds-per-beat second)))))))

(defun beat ()
    (universal-to-ebeat))
