#define SOKOL_IMPL
#include "sokol/sokol_app.h"
#include "sokol/sokol_gfx.h"
#include "sokol/sokol_glue.h"

typedef struct {
    int32_t width;
    int32_t height;
} nim_sapp_desc_t;

extern nim_sapp_desc_t nim_sokol_main(void);

sapp_desc sokol_main(int argc, char* argv[]) {
    nim_sapp_desc_t desc = nim_sokol_main();
    return (sapp_desc) {
        .width = desc.width,
        .height = desc.height,
    };
}
