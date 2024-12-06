(ns maximum-rotations.core)

(defn digits
  "Return a sequence of digits of n maintaining order."
  ([n] (if (zero? n) '(0) (digits '() n)))
  ([acc n] (if (zero? n) acc (recur (cons (rem n 10) acc) (quot n 10)))))

(defn ten-to
  "Return the (e)th power of 10."
  [e]
  (apply * (repeat e 10)))

(defn undigits
  "Return the integer from a sequence of its digits."
  [s]
  (apply + (map-indexed #(* (ten-to %1) %2) (reverse s))))

(defn rotate
  "Return a new sequence rotated one to the left."
  [[h & t]]
  (if (nil? h) '() (concat t (list h))))

(defn less?
  "Return true if s1 has a smaller head, false otherwise."
  [[h1 & t1 :as s1] [h2 & t2 :as s2]]
  (cond
    (and (empty? s1) (empty? s2)) false
    (empty? s1) true
    (empty? s2) false
    (< h1 h2) true
    (< h2 h1) false
    :else (recur t1 t2)))

(defn rotation
  "Return a new sequence with i elements from the beginnning the same, the rest is rotated one to the left."
  [i s]
  (let [[a b] (split-at i s)]
    (concat a (rotate b))))

(defn max-rot
  "Return the maximum in the sequence of progressively rotated digits of n."
  [n]
  (let [digits (digits n)
        rotator #(let [rotated (rotation %2 %1)]
                   (if (less? rotated %1) (reduced (undigits %1)) rotated))]
    (reduce rotator digits (range (count digits)))))

;; (defn rotations
;;   ([s] (rotations 0 (list s) s))
;;   ([i acc s]
;;    (let [c (dec (count s))]
;;      (if (< i c)
;;        (let [[a b] (split-at i s)
;;              q (concat a (rotate b))]
;;          (recur (inc i) (cons q acc) q)) acc))))

;; (defn max-rot-1 [n]
;;   (apply max (map undigits (rotations (digits n)))))

(comment
  (less? '() '(1 2 4))
  (let [[h & t] (digits 123450)] t)
  (undigits '(1 3 4 8 9 0))
  (undigits [1 2 3 4])
  (concat '(8 9 0) '(1 2))
  (concat [1 2 4] [2 3 4])
  (ten-to 3)
  (cons 3 '())
  (rotate '(1 3 6))
  ;; (class (first (rotations '(1 3 6))))
  ;; (rotations '(1 3 5 7 9))
  (cons '(1 3 4) '((8 9) (7 8)))
  (max-rot 56789)
  (split-at 5 '(1 2 3))
  (rotate '())
  :rcf)