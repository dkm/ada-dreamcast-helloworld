with dc_biosfont_h;  use dc_biosfont_h;
with System;
with System.Storage_Elements; use System.Storage_Elements;
with Interfaces.C.Strings; use Interfaces.C.Strings;

procedure Dchelloword is
   type Uint16_T is mod 2 ** 16;
   type Vram_T is array (Storage_Offset range 0 .. 8 * 1024 * 1024)
     of Uint16_T;

   Vram_S : System.Address with
     Import,
     External_Name => "vram_s";

   Vram_Data : Vram_T;
   for Vram_Data'Address use Vram_S;

   Offset : Storage_Offset := (640 * BFONT_HEIGHT + BFONT_THIN_WIDTH * 2);

begin
   bfont_set_encoding (BFONT_CODE_ISO8859_1);
   bfont_draw_str (
     Vram_Data (Offset)'Address,
     --  Vram_S + Offset,
     -- b=0xa5007830
     640,
     1,
     New_String ("Test of basic ASCII")
   );

   while True loop
      null;
   end loop;

end Dchelloword;
