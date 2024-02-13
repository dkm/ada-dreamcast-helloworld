-- with dc_biosfont_h;  use dc_biosfont_h;
with dc_minifont_h; use dc_minifont_h;
with System;
with System.Storage_Elements; use System.Storage_Elements;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Interfaces; use Interfaces;
with arch_types_h; use arch_types_h;

procedure Dchelloword is
--   type Uint16_T is mod 2 ** 16;

   --  Dreamcast VRAM is 8M and abstracted as uint16
   type Vram_T is array (Storage_Offset range 0 .. (8 * 1024 * 1024) / 2)
     of aliased Unsigned_16;

   Vram_S : System.Address with
     Import,
     External_Name => "vram_s";

   type Vram_2_T is array (Storage_Offset range 0 .. (8 * 1024 * 1024) / 2)
     of aliased uint16;

   Vram_Data : aliased Vram_T;
   for Vram_Data'Address use Vram_S;


   Vram_Data_2 : aliased Vram_2_T;
   for Vram_Data_2'Address use Vram_S;

   -- Offset : Storage_Offset := (640 * BFONT_HEIGHT + BFONT_THIN_WIDTH * 2);

   C : Unsigned_16;
   --  pragma Import (Intrinsic, Shift_Left);
   Ignore : Interfaces.C.int;

begin
   for Y in 0 .. 480 loop
      for X in 0 .. 640 loop
         C := (Unsigned_16 (X) xor Unsigned_16 (Y)) mod 255;
         Vram_Data (Storage_Offset (Y * 640 + X)) := Shift_Left (Shift_Right (C, 3),  12)
           or Shift_Left ( Shift_Right (C, 2), 5)
           or Shift_Left ( Shift_Right (C, 3), 0);
      end loop;
   end loop;

   Ignore := minifont_draw_str(Vram_Data_2 (Storage_Offset (20*640+20))'Access, 640,
      New_String ("Hello, World for Ada!!"));

   --  bfont_set_encoding (BFONT_CODE_ISO8859_1);
   --  bfont_draw_str (
   --    Vram_Data (Offset)'Address,
   --    --  Vram_S + Offset,
   --    -- b=0xa5007830
   --    640,
   --    1,
   --    New_String ("Test of basic ASCII")
   --  );

   while True loop
      null;
   end loop;

end Dchelloword;
