(ns visualization.core)

(enable-console-print!)

(defn chart-frame [x y size]
  (-> js/document 
      (.getElementById "container")
      (aset "innerHTML" "<div id='chart'></div>"))
  (-> (d3/select "div#chart")
      (.style "border-left" "solid black")
      (.style "border-bottom" "solid black")
      (.style "width" (str size))
      (.style "height" (str size))))
      

(.log js/console (chart-frame nil nil 200))
