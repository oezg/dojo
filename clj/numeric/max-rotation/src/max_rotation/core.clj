(ns max-rotation.core)

(defn digits [n]
  (map #(Character/digit % 10) (str n)))

(defn rotate [lst] (reverse (conj (reverse (rest lst)) (first lst))))

(defn rotations [acc digits i]
  (let [[pre post] (split-at i digits)]
    (if (empty? post)
      acc
      (recur (conj acc (vector pre (rotate post))) digits (inc i)))))

(defn rot [digits] (apply concat (rotations [] digits 0)))

(defn max-rot [n]
  (first (sort > (rot (digits n)))))

(comment
  (Character/digit \3 16)
  (split-at 4 '(1 2 3 4))
  (compare [8 9] [1 2])
  (vec (mapcat identity ['(1 2 3) '(6 7 8)]))
  (map #(mapcat identity %) '([(1 2 3) (6 7 8)] [(5 6) (8 9)] [(2 3) (1 4)]))
  (apply concat '((1 2 3) (4 5 6)))
  :rcf)