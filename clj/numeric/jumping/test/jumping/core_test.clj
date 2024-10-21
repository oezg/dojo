(ns jumping.core-test
  (:require [clojure.test :refer :all]
            [jumping.core :refer :all]))

(deftest basic-tests
  (is (= (jumping-number 1)         "Jumping!!"))
  (is (= (jumping-number 7)         "Jumping!!"))
  (is (= (jumping-number 9)         "Jumping!!"))
  (is (= (jumping-number 23)        "Jumping!!"))
  (is (= (jumping-number 32)        "Jumping!!"))
  (is (= (jumping-number 79)        "Not!!"))
  (is (= (jumping-number 98)        "Jumping!!"))
  (is (= (jumping-number 8987)      "Jumping!!"))
  (is (= (jumping-number 4343456)   "Jumping!!"))
  (is (= (jumping-number 98789876)  "Jumping!!"))
  (is (= (jumping-number 987654322) "Not!!")))