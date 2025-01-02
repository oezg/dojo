(ns directions-reversal.core
  (:require [clojure.string :as string])
  (:gen-class))

(defn solve [dirs]
  (let [two-lists (map #(string/split % #" on ") dirs)
        directs (->> two-lists (map first) rest reverse (replace {"Right" "Left" "Left" "Right"}))]
    (map #(str %1 " on " %2) (cons "Begin" directs) (reverse (map second two-lists)))))

(comment
  (solve ["Begin on Road A" "Right on Road B" "Right on Road C" "Left on Road D"])
  :rcf)

(defn -main []
  (println (solve ["Begin on Road A" "Right on Road B" "Right on Road C" "Left on Road D"])))
