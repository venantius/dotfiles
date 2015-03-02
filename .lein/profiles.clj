{:user {:plugins [[lein-kibit "0.0.8"]
                  [lein-bikeshed "0.2.0"]
                  [lein-pprint "1.1.2"]
                  [lein-cljfmt "0.1.10"]
                  [jonase/eastwood "0.2.1"]
                  [venantius/ultra "0.3.0"]]
        :dependencies [[cljfmt "0.1.10"]
                       [jonase/eastwood "0.2.1" :exclusions  [org.clojure/clojure]]]
        :ultra {:color-scheme :solarized_dark}
        :eastwood {:exclude-linters [:constant-test :suspicious-expression :local-shadows-var]}
        }}
