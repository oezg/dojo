(ns homogenous.core
  (:gen-class))

(defn homogenous? [arr]
  (when (seq arr) (apply = (map type arr))))

(defn filter-homogenous [sq]
  (filter homogenous? sq))

(comment
  ((every-pred seq homogenous?) '())
  (apply = '())
  (apply = (map type '(1 2 3 4 5 6 "3")))
  (map type '(1 1 2 3 "er"))
  (apply = '(1 1 1 1))
  :rcf)