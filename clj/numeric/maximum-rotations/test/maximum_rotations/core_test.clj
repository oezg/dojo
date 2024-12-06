(ns maximum-rotations.core-test
  (:require [clojure.test :refer :all]
            [maximum-rotations.core :refer :all]))


(defn test-assert [act exp]
  (is (= act exp)))

(deftest a-test1
  (testing "max-rot"
    (test-assert (max-rot 38458215) 85821534)
    (test-assert (max-rot 195881031) 988103115)
    (test-assert (max-rot 896219342) 962193428)
    (test-assert (max-rot 69418307) 94183076)))