const
  maxTouchpoints* = 8
  maxMousebuttons* = 3
  maxKeycodes* = 512
  maxIconimages* = 8

type
  EventType* {.pure.} = enum
    invalid
    keyDown
    keyUp
    `char`
    mouseDown
    mouseUp
    mouseScroll
    mouseMove
    mouseEnter
    mouseLeave
    touchesBegan
    touchesMoved
    touchesEnded
    touchesCancelled
    resized
    iconified
    restored
    focused
    unfocused
    suspended
    resumed
    updateCursor
    quitRequested
    clipboardPasted
    filesDropped
    num
    forceU32 = 0x7FFFFFFF

type
  Keycode* {.pure.} = enum
    invalid = 0
    space = 32
    apostrophe = 39
    comma = 44
    minus = 45
    period = 46
    slash = 47
    d0 = 48
    d1 = 49
    d2 = 50
    d3 = 51
    d4 = 52
    d5 = 53
    d6 = 54
    d7 = 55
    d8 = 56
    d9 = 57
    semicolon = 59
    equal = 61
    a = 65
    b = 66
    c = 67
    d = 68
    e = 69
    f = 70
    g = 71
    h = 72
    i = 73
    j = 74
    k = 75
    l = 76
    m = 77
    n = 78
    o = 79
    p = 80
    q = 81
    r = 82
    s = 83
    t = 84
    u = 85
    v = 86
    w = 87
    x = 88
    y = 89
    z = 90
    leftBracket = 91
    backslash = 92
    rightBracket = 93
    graveAccent = 96
    world1 = 161
    world2 = 162
    escape = 256
    enter = 257
    tab = 258
    backspace = 259
    insert = 260
    delete = 261
    right = 262
    left = 263
    down = 264
    up = 265
    pageUp = 266
    pageDown = 267
    home = 268
    `end` = 269
    capsLock = 280
    scrollLock = 281
    numLock = 282
    printScreen = 283
    pause = 284
    f1 = 290
    f2 = 291
    f3 = 292
    f4 = 293
    f5 = 294
    f6 = 295
    f7 = 296
    f8 = 297
    f9 = 298
    f10 = 299
    f11 = 300
    f12 = 301
    f13 = 302
    f14 = 303
    f15 = 304
    f16 = 305
    f17 = 306
    f18 = 307
    f19 = 308
    f20 = 309
    f21 = 310
    f22 = 311
    f23 = 312
    f24 = 313
    f25 = 314
    kp0 = 320
    kp1 = 321
    kp2 = 322
    kp3 = 323
    kp4 = 324
    kp5 = 325
    kp6 = 326
    kp7 = 327
    kp8 = 328
    kp9 = 329
    kpDecimal = 330
    kpDivide = 331
    kpMultiply = 332
    kpSubtract = 333
    kpAdd = 334
    kpEnter = 335
    kpEqual = 336
    leftShift = 340
    leftControl = 341
    leftAlt = 342
    leftSuper = 343
    rightShift = 344
    rightControl = 345
    rightAlt = 346
    rightSuper = 347
    menu = 348

type
  Touchpoint* {.bycopy.} = object
    identifier*: pointer
    posX*: cfloat
    posY*: cfloat
    changed*: bool

type
  Mousebutton* {.pure.} = enum
    left = 0x0
    right = 0x1
    middle = 0x2
    invalid = 0x100

type
  Modifiers* {.pure, size: sizeof(cint).} = enum
    shift = 0x1
    ctrl = 0x2
    alt = 0x4
    super = 0x8
    lmb = 0x100
    rmb = 0x200
    mmb = 0x400

type
  Event* {.bycopy.} = object
    frameCount*: uint64
    `type`*: EventType
    keyCode*: Keycode
    charCode*: uint32
    keyRepeat*: bool
    modifiers*: Modifiers
    mouseButton*: Mousebutton
    mouseX*: cfloat
    mouseY*: cfloat
    mouseDx*: cfloat
    mouseDy*: cfloat
    scrollX*: cfloat
    scrollY*: cfloat
    numTouches*: cint
    touches*: array[maxTouchpoints, Touchpoint]
    windowWidth*: cint
    windowHeight*: cint
    framebufferWidth*: cint
    framebufferHeight*: cint

type
  Range* {.bycopy.} = object
    `ptr`*: pointer
    size*: csize_t

type
  ImageDesc* {.bycopy.} = object
    width*: cint
    height*: cint
    pixels*: Range

type
  IconDesc* {.bycopy.} = object
    sokol_default*: bool
    images*: array[maxIconimages, ImageDesc]

type
  Desc* {.bycopy.} = object
    initCb*: proc () {.cdecl.}
    frameCb*: proc () {.cdecl.}
    cleanupCb*: proc () {.cdecl.}
    eventCb*: proc (event: ptr Event) {.cdecl.}
    failCb*: proc (reason: cstring) {.cdecl.}
    userData*: pointer
    initUserdataCb*: proc (userData: pointer) {.cdecl.}
    frameUserdataCb*: proc (userData: pointer) {.cdecl.}
    cleanupUserdataCb*: proc (userData: pointer) {.cdecl.}
    eventUserdataCb*: proc (event: ptr Event; userData: pointer) {.cdecl.}
    failUserdataCb*: proc (reason: cstring; userData: pointer) {.cdecl.}
    width*: cint
    height*: cint
    sampleCount*: cint
    swapInterval*: cint
    highDpi*: bool
    fullscreen*: bool
    alpha*: bool
    windowTitle*: cstring
    userCursor*: bool
    enableClipboard*: bool
    clipboardSize*: cint
    enableDragndrop*: bool
    maxDroppedFiles*: cint
    maxDroppedFilePathLength*: cint
    icon*: IconDesc
    glForceGles2*: bool
    win32ConsoleUtf8*: bool
    win32ConsoleCreate*: bool
    win32ConsoleAttach*: bool
    html5CanvasName*: cstring
    html5CanvasResize*: bool
    html5PreserveDrawingBuffer*: bool
    html5PremultipliedAlpha*: bool
    html5AskLeaveSite*: bool
    iosKeyboardResizesCanvas*: bool

type
  Html5FetchError* {.pure.} = enum
    noError
    bufferTooSmall
    other

  Html5FetchResponse* {.bycopy.} = object
    succeeded*: bool
    errorCode*: Html5FetchError
    fileIndex*: cint
    fetchedSize*: uint32
    bufferPtr*: pointer
    bufferSize*: uint32
    userData*: pointer

  Html5FetchRequest* {.bycopy.} = object
    droppedFileIndex*: cint
    callback*: proc (a1: ptr Html5FetchResponse) {.cdecl.}
    bufferPtr*: pointer
    bufferSize*: uint32
    userData*: pointer

proc isvalid*(): bool {.cdecl, importc: "sapp_isvalid".}
proc width*(): cint {.cdecl, importc: "sapp_width".}
proc widthf*(): cfloat {.cdecl, importc: "sapp_widthf".}
proc height*(): cint {.cdecl, importc: "sapp_height".}
proc heightf*(): cfloat {.cdecl, importc: "sapp_heightf".}
proc colorFormat*(): cint {.cdecl, importc: "sapp_color_format".}
proc depthFormat*(): cint {.cdecl, importc: "sapp_depth_format".}
proc sampleCount*(): cint {.cdecl, importc: "sapp_sample_count".}
proc highDpi*(): bool {.cdecl, importc: "sapp_high_dpi".}
proc dpiScale*(): cfloat {.cdecl, importc: "sapp_dpi_scale".}
proc showKeyboard*(show: bool) {.cdecl, importc: "sapp_show_keyboard".}
proc keyboardShown*(): bool {.cdecl, importc: "sapp_keyboard_shown".}
proc isFullscreen*(): bool {.cdecl, importc: "sapp_is_fullscreen".}
proc toggleFullscreen*() {.cdecl, importc: "sapp_toggle_fullscreen".}
proc showMouse*(show: bool) {.cdecl, importc: "sapp_show_mouse".}
proc mouseShown*(): bool {.cdecl, importc: "sapp_mouse_shown".}
proc lockMouse*(lock: bool) {.cdecl, importc: "sapp_lock_mouse".}
proc mouseLocked*(): bool {.cdecl, importc: "sapp_mouse_locked".}
proc userdata*(): pointer {.cdecl, importc: "sapp_userdata".}
proc queryDesc*(): Desc {.cdecl, importc: "sapp_query_desc".}
proc requestQuit*() {.cdecl, importc: "sapp_request_quit".}
proc cancelQuit*() {.cdecl, importc: "sapp_cancel_quit".}
proc quit*() {.cdecl, importc: "sapp_quit".}
proc consumeEvent*() {.cdecl, importc: "sapp_consume_event".}
proc frameCount*(): uint64 {.cdecl, importc: "sapp_frame_count".}
proc frameDuration*(): cdouble {.cdecl, importc: "sapp_frame_duration".}
proc setClipboardString*(str: cstring) {.cdecl, importc: "sapp_set_clipboard_string".}
proc getClipboardString*(): cstring {.cdecl, importc: "sapp_get_clipboard_string".}
proc setWindowTitle*(str: cstring) {.cdecl, importc: "sapp_set_window_title".}
proc setIcon*(icon_desc: ptr IconDesc) {.cdecl, importc: "sapp_set_icon".}
proc getNumDroppedFiles*(): cint {.cdecl, importc: "sapp_get_num_dropped_files".}
proc getDroppedFilePath*(index: cint): cstring {.cdecl, importc: "sapp_get_dropped_file_path".}
#proc run*(desc: ptr Desc) {.cdecl, importc: "sapp_run".}
proc gles2*(): bool {.cdecl, importc: "sapp_gles2".}
proc html5AskLeaveSite*(ask: bool) {.cdecl, importc: "sapp_html5_ask_leave_site".}
proc html5GetDroppedFileSize*(index: cint): uint32 {.cdecl, importc: "sapp_html5_get_dropped_file_size".}
proc html5FetchDroppedFile*(request: ptr Html5FetchRequest) {.cdecl, importc: "sapp_html5_fetch_dropped_file".}
proc metalGetDevice*(): pointer {.cdecl, importc: "sapp_metal_get_device".}
proc metalGetRenderpassDescriptor*(): pointer {.cdecl, importc: "sapp_metal_get_renderpass_descriptor".}
proc metalGetDrawable*(): pointer {.cdecl, importc: "sapp_metal_get_drawable".}
proc macosGetWindow*(): pointer {.cdecl, importc: "sapp_macos_get_window".}
proc iosGetWindow*(): pointer {.cdecl, importc: "sapp_ios_get_window".}
proc d3d11GetDevice*(): pointer {.cdecl, importc: "sapp_d3d11_get_device".}
proc d3d11GetDeviceContext*(): pointer {.cdecl, importc: "sapp_d3d11_get_device_context".}
proc d3d11GetSwapChain*(): pointer {.cdecl, importc: "sapp_d3d11_get_swap_chain".}
proc d3d11GetRenderTargetView*(): pointer {.cdecl, importc: "sapp_d3d11_get_render_target_view".}
proc d3d11GetDepthStencilView*(): pointer {.cdecl, importc: "sapp_d3d11_get_depth_stencil_view".}
proc win32GetHwnd*(): pointer {.cdecl, importc: "sapp_win32_get_hwnd".}
proc wgpuGetDevice*(): pointer {.cdecl, importc: "sapp_wgpu_get_device".}
proc wgpuGetRenderView*(): pointer {.cdecl, importc: "sapp_wgpu_get_render_view".}
proc wgpuGetResolveView*(): pointer {.cdecl, importc: "sapp_wgpu_get_resolve_view".}
proc wgpuGetDepthStencilView*(): pointer {.cdecl, importc: "sapp_wgpu_get_depth_stencil_view".}
proc androidGetNativeActivity*(): pointer {.cdecl, importc: "sapp_android_get_native_activity".}

proc NimMain() {.importc.}

template sokolMain*(desc: untyped, body: untyped) =
  proc sokol_main*(argc: cint; argv: ptr cstring): sapp.Desc {.cdecl, exportc: "sokol_main".} =
    NimMain()
    echo "Hello from Nim!"
    var desc: sapp.Desc
    body
    return desc
