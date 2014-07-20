(ns visualization.core
  (:require 
    [figwheel.client :as figwheel :include-macros true]))

(enable-console-print!)

(def chart-values [7 8 5 3])
(defn chart-frame [size]
  (-> js/document 
      (.getElementById "container")
      (aset "innerHTML" "<div id='chart'></div>"))
  (-> (d3/select "div#chart")
      (.style "border-left" "solid black")
      (.style "border-bottom" "solid black")
      (.style "width" (str size))
      (.style "height" (str size))))
(defn chart-line [values]
  ;; TODO: d3 svg graphics
  )

(figwheel/watch-and-reload
  ;; :websocket-url "ws://localhost:3449/figwheel-ws" default
  :jsload-callback (fn [] (print "reloaded"))) ;; optional callback
