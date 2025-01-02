(ns directions-reversal.core-test
  (:require [clojure.test :refer :all]
            [directions-reversal.core :refer :all]))

(deftest sample-tests
  (is (= (solve ["Begin on Road A" "Right on Road B" "Right on Road C" "Left on Road D"])
         ["Begin on Road D" "Right on Road C" "Left on Road B" "Left on Road A"]))
  (is (= (solve ["Begin on 3rd Blvd" "Right on First Road" "Left on 9th Dr"])
         ["Begin on 9th Dr" "Right on First Road" "Left on 3rd Blvd"]))
  (is (= (solve ["Begin on Road A"]) ["Begin on Road A"]))
  (is (= (solve ["Begin on A" "Left on B" "Right on C" "Right on D" "Right on E"
                 "Left on F" "Right on G" "Right on H" "Left on I" "Left on J"])
         ["Begin on J" "Right on I" "Right on H" "Left on G" "Left on F"
          "Right on E" "Left on D" "Left on C" "Left on B" "Right on A"])))