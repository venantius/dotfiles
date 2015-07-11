{:user {:plugins [[lein-kibit "0.0.8"]
                  [lein-bikeshed "0.2.0"]
                  [lein-cljfmt "0.1.4"]
                  [jonase/eastwood "0.2.1"]
                  [lein-pprint "1.1.1"]
                  [venantius/yagni "0.1.2"]]

        :dependencies [[cljfmt "0.1.12"]
                       [jonase/eastwood "0.2.1" :exclusions  [org.clojure/clojure]]]

        :repl-options {:prompt (fn [ns] (str "[" ns "](\u001b[36mλ\u001b[0m)> "))}

        :ultra {:color-scheme :solarized_dark
                :stacktraces false}

        :eastwood {:exclude-linters [:constant-test :suspicious-expression :local-shadows-var]}}}

