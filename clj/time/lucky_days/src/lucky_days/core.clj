(ns lucky-days.core
  ;; (:require [java.time])
  (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!"))


(comment
  (.getDayOfWeek (java.time.LocalDate/now))
  (= (java.time.DayOfWeek/WEDNESDAY) (.getDayOfWeek (java.time.LocalDate/now))))

(defn- unlucky-day? [day]
  (= (java.time.DayOfWeek/FRIDAY) (.getDayOfWeek day)))

(defn- thirteenth [year month]
  (java.time.LocalDate/of year month 13))

(defn- thirteenths [year]
  (map (partial thirteenth year) (range 1 13)))

(defn unlucky-days
  "returns the number of Friday 13th in the given year."
  [year]
  (count (filter unlucky-day? (thirteenths year))))