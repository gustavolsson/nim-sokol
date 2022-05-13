# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

when defined macosx:
  {.passc: "-DSOKOL_METAL".}
  {.passL: "-framework Cocoa".}
  {.passL: "-framework QuartzCore".}
  {.passL: "-framework Metal".}
  {.passL: "-framework MetalKit".}
  {.compile:"nim_sokol/sokol.m".}
elif defined linux:
  discard
elif defined windows:
  discard

proc add*(x, y: int): int =
  ## Adds two files together.
  return x + y
