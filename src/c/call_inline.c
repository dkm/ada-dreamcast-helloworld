#include <kos.h>
#include <math.h>
#include <plx/texture.h>
#include <plx/context.h>
#include <plx/prim.h>

void plx_vert_indm3_ADA(plx_dr_state_t * state, int flags, float x, float y, float z,
    uint32 color)
{
       plx_mat_tfip_3d(x, y, z);
       plx_vert_ind(state, flags, x, y, z, color);
}
