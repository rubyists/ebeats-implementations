(import '(java.util Calendar TimeZone))

(def beats 
	(let [now (. Calendar (getInstance (. TimeZone (getTimeZone "UTC"))))]
		(+ 
			(* (. now (get (. Calendar HOUR_OF_DAY))) (/ 1000.0 24.0))
			(* (. now (get (. Calendar MINUTE))) (/ 1000.0 (* 24.0 60.0)))
			(* (. now (get (. Calendar SECOND))) (/ 1000.0 (* 24.0 60.0 60.0))))))

(println (format "@%.2f" beats))