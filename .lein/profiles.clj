{:user {:plugins [[lein-kibit "0.1.2"]
                  [lein-bikeshed "0.2.0"]
                  [lein-cljfmt "0.2.0"]
                  [jonase/eastwood "0.2.1"]
                  [lein-pprint "1.1.1"]
                  [cider/cider-nrepl "0.9.1"]
                  [venantius/yagni "0.1.5-SNAPSHOT"]
                  [venantius/ultra "0.4.0"]

                  ]

        :dependencies [[cljfmt "0.2.0"]
                       [com.cemerick/piggieback "0.2.1"]
                       [org.clojure/tools.nrepl "0.2.10"]
                       [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]]

        :repl-options {:prompt (fn [ns] (str "[" ns "](\u001b[36mλ\u001b[0m)> "))
                       :nrepl-middleware [cemerick.piggieback/wrap-cljs-repl]}

        :ultra {:color-scheme :solarized_dark
                :stacktraces false}

        :eastwood {:exclude-linters [:constant-test :suspicious-expression :local-shadows-var]}}}

