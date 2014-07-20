(ns visualization.core)

(enable-console-print!)

(-> (d3/select "body")
    (.style "background-color" "black"))
(println "Hello world!")
