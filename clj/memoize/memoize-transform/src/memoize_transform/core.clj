(ns memoize-transform.core)

(defn translate2d
  "Returns a function making use of a closure to
   perform a repeatable 2d translation of a coordinate pair."
  [dx dy]
  (fn [x y]  [(+ x dx) (+ y dy)]))

(defn scale2d
  "Returns a function making use of a closure to
   perform a repeatable 2d scale of a coordinate pair."
  [sx sy]
  (fn [x y] [(* sx x) (* sy y)]))

(defn compose-transform
  "Create a composition function that returns a function that 
   combines two functions to perform a repeatable transformation."
  [f g]
  (fn [x y]
    (let [f-outcome (f x y)]
      (g (first f-outcome) (last f-outcome)))))

(defn memoize-transform
  "Returns a function that memoizes the last result.
   If the arguments are the same as the last call,
   the memoized result is returned."
  [f]
  (let [mem (atom {:first_number nil :last_number nil :result nil})]
    (fn [& args]
      (if-let [e (and (= (first args) (:first_number @mem)) (= (last args) (:last_number @mem))
                      :result @mem)]
        e
        (let [ret (apply f args)]
          (swap! mem assoc :first-number (first args))
          (swap! mem assoc :last-number (last args))
          (swap! mem assoc :result ret)
          ret)))))

(defn memoize-transform2
  "Returns a function that memoizes the last result.
   If the arguments are the same as the last call,
   the memoized result is returned."
  [f]
  (let [mem (atom {:last-x nil
                   :last-y nil
                   :last-result nil})]
    (fn [& args]
      (if-let [e (and
                  (= (first args) (:last-x @mem))
                  (= (last args) (:last-y @mem))
                  (:last-result @mem))]
        e
        (let [ret (apply f args)]
          (swap! mem assoc :last-x (first args))
          (swap! mem assoc :last-y (last args))
          (swap! mem assoc :last-result ret)
          ret)))))