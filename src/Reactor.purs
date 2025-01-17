-- | As the [Pyret documentation](https://www.pyret.org/docs/latest/reactors.html) puts it,
-- | a reactor is a value enabling the creation of time-based animations, simulations, and interactive programs.
-- | During the creation of a reactor, the user supplies a function for handling clock ticks,
-- | and functions for handling mouse and keyboard input events.
-- | The reactor calls these event handlers whenever the respective event occurs.
-- | From within the event handlers, the reactor's state — or, the _world_, as we call it —
-- | can be updated. After each world update, the reactor renders the new world with the supplied drawing function.
-- |
-- | You can read more in the documentation of the type `Reactor` below, under the documentation for the module `Reactor.Types`.
-- | The base Reactor module re-exports some useful functions, apart
-- | from the base color pallete which is best imported by `import Reactor.Graphics.Colors as Color`.
-- |
-- | In our implementation, the rendering is done using a hooks-based Halogen component.
-- | Also, the world needs to have at least a boolean field named `paused`, that signalizes
-- | to the reactor whether the internal clock should be ticking or not.

module Reactor
  ( runReactor
  , module Reactor.Reaction
  , module Reactor.Types
  , module Reactor.Internal.Helpers
  ) where

import Prelude

import Effect (Effect)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Reactor.Internal.Helpers (withJust)
import Reactor.Page (component) as Reactor.Page
import Reactor.Reaction
  ( executeDefaultBehavior
  , getW
  , modifyW
  , modifyW_
  , updateW
  , updateW_
  , dimensions
  )
import Reactor.Types (Reactor, Configuration)

-- | Start a `Reactor` and render it asynchronously as a Halogen component with the given `Configuration`.
-- | The reactor's world is required to have a field named `paused` that is used to decide
-- | whether the reactor's clock should be running (`paused: false`) or not (`paused: true`).
runReactor
  :: forall world
   . Reactor world
  -> Configuration
  -> Effect Unit
runReactor reactor config =
  HA.runHalogenAff do
    body <- HA.awaitBody
    runUI (Reactor.Page.component reactor config) unit body
