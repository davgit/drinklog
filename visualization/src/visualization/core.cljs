(ns visualization.core)

(enable-console-print!)

(defn chart-frame [x y size]
  (-> js/document 
      (.getElementById "container")
      (aset "textContent" "whaat")))

(.log js/console (chart-frame nil nil nil))
