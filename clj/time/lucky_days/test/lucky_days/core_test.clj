(ns lucky-days.core-test
  (:require [clojure.test :refer :all]
            [lucky-days.core :refer :all]))


(deftest unlucky-days-tests
  (is (= (unlucky-days 2015) 3))
  (is (= (unlucky-days 1986) 1)))