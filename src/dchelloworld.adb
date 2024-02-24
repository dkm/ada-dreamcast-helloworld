with Ada.Text_IO;  use Ada.Text_IO;

with System;
with System.Storage_Elements; use System.Storage_Elements;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Interfaces; use Interfaces;

with arch_types_h; use arch_types_h;
with dc_minifont_h; use dc_minifont_h;

procedure Dchelloworld is

   --  A frame buffer stored in row-major for 640x480.
   type Frame_Buffer is array
     (Storage_Offset range 1 .. 480,
      Storage_Offset range 1 .. 640)
     of aliased uint16 with Pack;

   --  This is the base address of the VRAM
   Vram_S : System.Address with
     Import,
     External_Name => "vram_s";

   --  This is the visible framebuffer
   FB : Frame_Buffer;
   for FB'Address use Vram_S;

   Ignore : Interfaces.C.int;

   function Get_Pixel_Color (Line : Storage_Offset; Col : Storage_Offset)
     return uint16
   is
      C : Unsigned_16 := (Unsigned_16 (Col) xor Unsigned_16 (Line)) mod 255;
   begin
      return uint16 (Shift_Left (Shift_Right (C, 3),  12)
           or Shift_Left ( Shift_Right (C, 2), 5)
           or Shift_Left ( Shift_Right (C, 3), 0));
   end Get_Pixel_Color;

begin
   Put_Line ("Hello from Ada!");
   Put_Line ("This is some Ada.Text_IO text :)");

   for Line in FB'Range (1) loop
      for Column in FB'Range (2) loop
         FB (Line, Column) := Get_Pixel_Color (Line, Column);
      end loop;
   end loop;

   Ignore := minifont_draw_str(FB(20, 20)'Access, 640,
      New_String ("Hello, World. This is Ada!!"));

   Ignore := minifont_draw_str(FB (80, 20)'Access, 640,
      New_String ("And Ada is older than this Dreamcast!!"));

   while True loop
      null;
   end loop;

end Dchelloworld;
