# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

when defined macosx:
  {. passc: "-DSOKOL_METAL" .}
  {. passL: "-framework Cocoa -framework QuartzCore -framework Metal -framework MetalKit" .}
  {. compile:"nim_sokol/sokol.m" .}
elif defined linux:
  discard
elif defined windows:
  discard

type SAppDesc {.bycopy.} = object
  width: cint
  height: cint

proc NimMain() {.importc.}

template sokolMain*(desc: untyped, body: untyped) =
  proc nimSokolMain(): SAppDesc {.exportc:"nim_sokol_main".} =
    NimMain()
    echo "Hello from Nim!"
    var desc: SAppDesc
    body
    return desc

proc add*(x, y: int): int =
  ## Adds two files together.
  return x + y
