import nim_sokol
import nim_sokol/app as sapp

proc init() {.cdecl.} =
  echo "init"

proc frame() {.cdecl.} =
  #echo "frame"
  discard

proc event(e: ptr sapp.Event) {.cdecl.} =
  if e.type == keyDown and e.keyCode == escape:
    sapp.requestQuit()

  case e.type
  of keyDown:
    echo "key down: ", e.keyCode
  of keyUp:
    echo "key up: ", e.keyCode
  of sapp.EventType.char:
    echo "char '", e.charCode, "'"
  of mouseMove:
    echo "mouse moved: ", e.mouseX, ", ", e.mouseY
  of mouseDown:
    echo "mouse down: ", $e.mouseButton
  of mouseUp:
    echo "mouse up: ", $e.mouseButton
  of mouseScroll:
    echo "mouse scroll: ", e.scrollX, ", ", e.scrollY
  else:
    discard

proc cleanup() {.cdecl.} =
  echo "cleanup"

sokolMain(desc):
  echo "Hello from sokol main"
  desc.initCb = init
  desc.frameCb = frame
  desc.eventCb = event
  desc.cleanupCb = cleanup
  desc.width = 400
  desc.height = 300
