(ns homogenous.core-test
  (:require [clojure.test :refer :all]
            [homogenous.core :refer :all :rename {filter-homogenous solution}]))

(deftest sample-tests
  (is (= (solution [[1 5 4] [\a 3 5] [\b] [] [\1 2 3]])
         [[1 5 4] [\b]]))
  (is (= (solution [[123 234 432] ["" "abc"] [""] ["" 1] ["" "1"] []])
         [[123 234 432] ["" "abc"] [""] ["" "1"]]))
  (is (= (solution [() [] ["a"] ["b"] ["c"]])
         [["a"] ["b"] ["c"]]))
  (is (= (solution (list [] [1 2 3] ["z" \z] ["z"])) (list [1 2 3] ["z"])))
  (is (= (solution [[{}] [#{} #{}]]) [[{}] [#{} #{}]])))