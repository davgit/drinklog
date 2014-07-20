(ns visualization.core)

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
