with dc_biosfont_h;  use dc_biosfont_h;
with System;
with System.Storage_Elements; use System.Storage_Elements;
with Interfaces.C.Strings; use Interfaces.C.Strings;

procedure Dchelloword is

   Vram_S : System.Address with
     Import,
     External_Name => "vram_s";

   Offset : Storage_Offset := 640 * BFONT_HEIGHT + BFONT_THIN_WIDTH * 2;

begin
   bfont_set_encoding (BFONT_CODE_ISO8859_1);
   bfont_draw_str (
     Vram_S + Offset,
     640,
     1,
     New_String ("Test of basic ASCII")
   );

   while True loop
      null;
   end loop;

end Dchelloword;
