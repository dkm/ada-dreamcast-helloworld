with System;
with System.Storage_Elements; use System.Storage_Elements;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Interfaces; use Interfaces;
with arch_types_h; use arch_types_h;
with kos_h; use kos_h;
with math_h; use math_h;
with plx_texture_h; use plx_texture_h;
with plx_context_h; use plx_context_h;
with plx_prim_h; use plx_prim_h;
with dc_matrix_h; use dc_matrix_h;
with plx_matrix_h; use plx_matrix_h;
with plx_dr_h; use plx_dr_h;
with dc_pvr_h; use dc_pvr_h;
with Ada.Unchecked_Conversion;
with System.Machine_Code; use System.Machine_Code;

procedure Gldemo is

   KOS_Init_Flags : Interfaces.Unsigned_32
     with Import,
       External_Name => "__kos_init_flags";


   procedure Draw_Cube is
      Color : uint32 := 16#FF808080#;
      Dr    : aliased plx_dr_state_t;

   function U32_To_Int is
      new Ada.Unchecked_Conversion (Source => uint32,
                                    Target => int);

   --  procedure plx_vert_indm3_i
   --    (state : access plx_dr_h.plx_dr_state_t;
   --     flags : int;
   --     x : float;
   --     y : float;
   --     z : float;
   --     color : arch_types_h.uint32) is
   --     RX : Float := x;
   --     RY : Float := y;
   --     RZ : Float := z;

   --     procedure mat_trans_single_i (x : in out Float; y : in out Float; z : in out Float) is
   --     begin
   --        Asm ("fldi1    fr3"   & ASCII.LF & ASCII.CR &
   --             "ftrv xmtrx,fv0" & ASCII.LF & ASCII.CR &
   --             "fldi1    %2"    & ASCII.LF & ASCII.CR &
   --             "fdiv fr3,%2"    & ASCII.LF & ASCII.CR &
   --             "fmul %2,%0"     & ASCII.LF & ASCII.CR &
   --             "fmul %2,%1"     & ASCII.LF & ASCII.CR,
   --             Outputs => (
   --               Float'Asm_Output ("=f", x), --  fr0
   --               Float'Asm_Output ("=f", y), --  fr1
   --               Float'Asm_Output ("=f", z)), --  fr2
   --             Inputs => (
   --               Float'Asm_Input ("0", x),
   --               Float'Asm_Input ("1", y),
   --               Float'Asm_Input ("2", z)),
   --             Clobber => "fr3");
   --     end mat_trans_single_i;

   --     procedure plx_vert_ind_i
   --       (state : access plx_dr_h.plx_dr_state_t;
   --        flags : int;
   --        x : float;
   --        y : float;
   --        z : float;
   --        color : arch_types_h.uint32)
   --     is
   --        procedure Dcache_Pref_Block (Src : System.Address) is
   --        begin
   --           Asm (
   --             "pref @%0" & ASCII.LF & ASCII.CR,
   --             Inputs => (System.Address'Asm_Input ("r", src)),
   --             Clobber => ("memory"));
   --        end Dcache_Pref_Block;

   --        function plx_dr_target (A : System.Address) return access plx_vertex_t
   --        is
   --        begin
   --           A := A xor 32;
   --        end plx_dr_target;

   --        vert : access plx_vertex_t;
   --     begin
   --        vert := plx_dr_target(state);
   --        vert.x := x;
   --        vert.y := y;
   --        vert.z := z;
   --        vert.u := 0.0;
   --        vert.v := 0.0;
   --        vert.argb := color;
   --        vert.oargb := 0;

   --        --  plx_dr_commit is inline wrapper for
   --        --  pvr_dr_commit, which is a macro for
   --        --  sq_flush, which is a macro for
   --        --  dcace_wback_sq, which is a macro for
   --        --  dcache_pref_block, wich is an inline asm.

   --        --  plx_dr_commit (vert);
   --        Dcache_Pref_Block (Vert'Address);
   --     end plx_vert_ind_i;

   --  begin
   --     mat_trans_single_i(RX, RY, RZ);
   --     plx_vert_ind_i(state, flags, x, y, z, color);
   --  end plx_vert_indm3_i;


      -- /home/dkm/barryallen/git/kos-ports/include/plx/prim.h:182
   procedure plx_vert_indm3_ADA
     (state : access plx_dr_h.plx_dr_state_t;
      flags : int;
      x : float;
      y : float;
      z : float;
      color : arch_types_h.uint32)  -- /home/dkm/barryallen/git/kos-ports/include/plx/prim.h:182
   with Import => True,
        Convention => C,
        External_Name => "plx_vert_indm3_ADA";

   begin
      --  the plx is an inline wrapper.
      --  plx_dr_init (Dr'Access);
      pvr_dr_init (Dr'Access);

    --  Left face
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), -3.0, -3.0, -3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), -3.0,  3.0, -3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), -3.0, -3.0,  3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX_EOL), -3.0,  3.0,  3.0, color);

    --  Right face
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), 3.0, -3.0, -3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), 3.0,  3.0, -3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), 3.0, -3.0,  3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX_EOL), 3.0,  3.0,  3.0, color);

    --  Front face
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), -3.0,  3.0, -3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), -3.0, -3.0, -3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX),  3.0,  3.0, -3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX_EOL),  3.0, -3.0, -3.0, color);

    --  Back face
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), -3.0,  3.0, 3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), -3.0, -3.0, 3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX),  3.0,  3.0, 3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX_EOL),  3.0, -3.0, 3.0, color);

    --  Top face
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), -3.0, -3.0, -3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), -3.0, -3.0,  3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX),  3.0, -3.0, -3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX_EOL),  3.0, -3.0,  3.0, color);

    --  Bottom face
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), -3.0, 3.0, -3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX), -3.0, 3.0,  3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX),  3.0, 3.0, -3.0, color);
    plx_vert_indm3_ADA(Dr'Access, U32_To_Int (PVR_CMD_VERTEX_EOL),  3.0, 3.0,  3.0, color);

    --plx_dr_finish;
   end Draw_Cube;


   Done : int;
   Theta : uint32;
   Stats : Pvr_Stats_T;

   Ignore_Ret : int;

   Plx_Null : aliased Plx_Texture;
   for Plx_Null'Address use System.Null_Address;

begin
   Ignore_Ret := Pvr_Init_Defaults;
   Pvr_Set_Bg_Color (0.8, 0.8, 0.8);

    --  Setup the context
    plx_cxt_init;
    plx_cxt_texture(Plx_Null'Access);
    plx_cxt_culling(PVR_CULLING_NONE);

    --  Init 3D stuff. mat3d is like KGL.
    plx_mat3d_init;
    plx_mat3d_mode(PLX_MAT_PROJECTION);
    plx_mat3d_identity;
    plx_mat3d_perspective(45.0, 640.0 / 480.0, 0.1, 100.0);
    plx_mat3d_mode(PLX_MAT_MODELVIEW);

    --  // Until the user hits start...
    while True loop
    --  for(done = 0, theta = 0; !done;) {
        --  // Check for start
        --  MAPLE_FOREACH_BEGIN(MAPLE_FUNC_CONTROLLER, cont_state_t, st)

        --  if(st->buttons & CONT_START)
        --      done = 1;

        --  MAPLE_FOREACH_END()

        -- Setup the frame
        Ignore_Ret := pvr_wait_ready;
        pvr_scene_begin;
        Ignore_Ret := pvr_list_begin(PVR_LIST_OP_POLY);

        --  // Submit the context
        plx_cxt_send(PVR_LIST_OP_POLY);

        --  // Setup some rotations/translations. These are "executed" from
        --  // bottom to top. So we rotate the cube in place on all three
        --  // axes a bit, then translate it to the left by 10, and rotate
        --  // the whole deal (so it zooms around the screen a bit). Finally
        --  // we translate the whole mess back by 30 so it's visible.
        plx_mat3d_identity;
        plx_mat3d_translate(0.0, 0.0, -30.0);
        plx_mat3d_rotate(Float (theta) * 0.3, 1.0, 0.0, 0.0);
        plx_mat3d_rotate(Float (theta) * 1.5, 0.0, 1.0, 0.0);
        plx_mat3d_translate(10.0, 0.0, 0.0);
        plx_mat3d_rotate(Float (theta), 1.0, 0.0, 0.0);
        plx_mat3d_rotate(Float (theta) * 0.5, 0.0, 0.1, 0.0);
        plx_mat3d_rotate(Float (theta) * 0.3, 0.0, 0.0, 0.1);

        --  // Draw a cube at our current position/rotation. We make a snapshot
        --  // of the full translation matrix after projection so that we can
        --  // just apply new modelview matrices for the delay cubes.
        mat_identity;
        plx_mat3d_apply(PLX_MAT_SCREENVIEW);
        plx_mat3d_apply(PLX_MAT_PROJECTION);
        plx_mat3d_apply(PLX_MAT_MODELVIEW);
        Draw_Cube;

        --  drawwave(theta);

        Ignore_Ret := pvr_scene_finish;

        --  // Move our counters
        theta := theta + 1;
    end loop;

   while True loop
      null;
   end loop;

end Gldemo;
