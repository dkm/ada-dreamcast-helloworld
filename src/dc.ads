with Interfaces.C;

package Dc is

   procedure Bfont_Set_Encoding (Interfaces.C.int : Encoding)
     with Import,
      External_Name => "bfont_set_encoding",
      Convention => C;

end Dc;
