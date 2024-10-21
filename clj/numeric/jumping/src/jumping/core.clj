(ns jumping.core
  (:gen-class))

(defn digits
  ([number] (if (zero? number) '(0) (digits () number)))
  ([acc number] (if (zero? number) acc
                    (recur (conj acc (rem number 10)) (quot number 10)))))

(defn jumping-number? [number]
  (reduce (fn [acc cur] (if-not (= (Math/abs (- acc cur)) 1) (reduced false) cur))
          (digits number)))

(defn jumping-number
  "Jumping number is the number that all adjacent digits in it differ by 1."
  [number]
  (if (jumping-number? number) "Jumping!!" "Not!!"))


;; (jumping-number 987654322)