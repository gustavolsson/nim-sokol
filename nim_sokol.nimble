# Package

version       = "0.1.0"
author        = "Gustav Olsson"
description   = "Nim bindings for the excellent sokol cross-platform libraries"
license       = "MIT"
srcDir        = "src"

task example, "Runs the hello_sokol example":
  exec "nim r --noMain examples/hello_sokol"

# Dependencies

requires "nim >= 1.6.6"
