(ns disarium.core
  (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!"))

(defn power [e b]
  (letfn [(closure [a e] (if (zero? e) a
                             (recur (* a b) (dec e))))]
    (closure 1 (inc e))))

(defn digits
  ([number] (if (zero? number) '(0) (digits () number)))
  ([acc number] (if (zero? number) acc
                    (recur (conj acc (rem number 10)) (quot number 10)))))

(defn disarium [number]
  (->> number
       digits
       (map-indexed power)
       (apply +)))

(defn disarium-number? [number]
  (= number (disarium number)))

(defn disarium-number [number]
  (str (if (disarium-number? number) "Disarium" "Not") " !!"))

(disarium-number 89)