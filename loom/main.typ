#import "loom-wrapper.typ": *

// Define the component
#let note(title, color:auto, body) = content-motif(
  // The 'draw' phase determines how the component looks.
  draw: (ctx, evaluated-body) => {
    block(
      fill: color.transparentize(95%),
      stroke: (left: 4pt + color),
      inset: 1em,
      width: 100%
    )[
      *#title* \
      #evaluated-body
    ]
  },
  // Passing body to motif to allow for body ast evaluation.
  body
)


// Start the engine (Required!)
#show: weave.with()

// Use your component
#note("Tip", color: blue)[
  Loom components look just like normal Typst functions,
  but they are much more powerful under the hood.
]

#note("Warning", color: red)[
  Always remember to initialize the engine!
]