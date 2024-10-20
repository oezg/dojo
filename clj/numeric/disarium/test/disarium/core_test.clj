(ns disarium.core-test
  (:require [clojure.test :refer :all]
            [disarium.core :refer :all]))

(deftest disarium-tests
  (is (= (disarium-number 89)      "Disarium !!"))
  (is (= (disarium-number 518)     "Disarium !!"))
  (is (= (disarium-number 564)     "Not !!"))
  (is (= (disarium-number 1024)    "Not !!"))
  (is (= (disarium-number 1306)    "Disarium !!"))
  (is (= (disarium-number 1999)    "Not !!"))
  (is (= (disarium-number 2427)    "Disarium !!"))
  (is (= (disarium-number 64599)   "Not !!"))
  (is (= (disarium-number 136586)  "Not !!"))
  (is (= (disarium-number 1048576) "Not !!"))
  (is (= (disarium-number 2646798) "Disarium !!")))