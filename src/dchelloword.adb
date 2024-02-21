with System;
with System.Storage_Elements; use System.Storage_Elements;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Interfaces; use Interfaces;

with arch_types_h; use arch_types_h;
with dc_minifont_h; use dc_minifont_h;

procedure Dchelloword is
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

   C : Unsigned_16;
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
      New_String ("Hello, World. This is Ada!!"));

   Ignore := minifont_draw_str(Vram_Data_2 (Storage_Offset (80*640+20))'Access, 640,
      New_String ("And Ada is older than this Dreamcast!!"));

   while True loop
      null;
   end loop;

end Dchelloword;
