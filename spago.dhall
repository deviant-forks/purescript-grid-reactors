{ name = "grid-reactors"
, license = "MIT"
, repository = "https://github.com/Eugleo/purescript-grid-reactors.git"
, dependencies =
  [ "aff"
  , "arrays"
  , "canvas-action"
  , "colors"
  , "console"
  , "effect"
  , "exceptions"
  , "foldable-traversable"
  , "free"
  , "halogen"
  , "halogen-hooks"
  , "halogen-subscriptions"
  , "heterogeneous"
  , "integers"
  , "maybe"
  , "partial"
  , "prelude"
  , "psci-support"
  , "random"
  , "st"
  , "tailrec"
  , "transformers"
  , "tuples"
  , "web-events"
  , "web-html"
  , "web-uievents"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
