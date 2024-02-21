with Interfaces.C; use Interfaces.C;
with Interfaces; use Interfaces;

with arch_types_h; use arch_types_h;
with gl_gl_h; use gl_gl_h;
with gl_glkos_h; use gl_glkos_h;
with gl_glu_h; use gl_glu_h;
with gl_glext_h; use gl_glext_h;

procedure Gldemo2 is

   --  VQ 512x512 byte array
   type Texture_512x512 is array (Integer range 1 .. 67584) of uint8;

   Texture_Dc_Data : Texture_512x512
     with Import,
       Convention => C,
       External_Name => "tex_dc";
   Texture_Dc : aliased unsigned := 0;

   Texture_Ada1_Data : Texture_512x512
     with Import,
       Convention => C,
       External_Name => "tex_ada1";
   Texture_Ada1 : aliased unsigned := 0;

   Texture_Ada_Data : Texture_512x512
     with Import,
       Convention => C,
       External_Name => "tex_ada";
   Texture_Ada : aliased unsigned := 0;

   Texture_Dcwiki_Data : Texture_512x512
     with Import,
       Convention => C,
       External_Name => "tex_dcwiki";
   Texture_Dcwiki : aliased unsigned := 0;

   Texture_Gcc_Data : Texture_512x512
     with Import,
       Convention => C,
       External_Name => "tex_gcc";
   Texture_Gcc : aliased unsigned := 0;

   Texture_Kos_Data : Texture_512x512
     with Import,
       Convention => C,
       External_Name => "tex_kos";
   Texture_Kos : aliased unsigned := 0;

   GL_TEXTURE_2D: constant unsigned                     := 16#0001#;
   GL_COMPRESSED_RGB_565_VQ_TWID_KOS: constant unsigned := 16#eee8#;
   GL_COLOR_BUFFER_BIT: constant unsigned               := 16#4000#;
   GL_DEPTH_BUFFER_BIT: constant unsigned               := 16#0100#;
   GL_QUADS: constant unsigned                          := 16#0007#;
   GL_PROJECTION: constant unsigned                     := 16#1701#;
   GL_MODELVIEW: constant unsigned                      := 16#1700#;
   GL_SMOOTH: constant unsigned                         := 16#1d01#;
   GL_DEPTH_TEST: constant unsigned                     := 16#0b71#;
   GL_LEQUAL: constant unsigned                         := 16#0203#;

   X_Rot : Float := 0.0;
   Y_Rot : Float := 0.0;
   Z_Rot : Float := 0.0;

begin
   glKosInit;

   glMatrixMode(GL_PROJECTION);
   glLoadIdentity;
   gluPerspective(45.0, 640.0 / 480.0, 0.1, 100.0);
   glMatrixMode(GL_MODELVIEW);
   glLoadIdentity;

   glEnable(GL_TEXTURE_2D);
   glShadeModel(GL_SMOOTH);
   glClearColor(0.0, 0.0, 0.0, 0.5);
   glClearDepth(1.0);
   glEnable(GL_DEPTH_TEST);
   glDepthFunc(GL_LEQUAL);

   glGenTextures(1, Texture_Ada1'Access);
   glBindTexture(GL_TEXTURE_2D, Texture_Ada1);
   glCompressedTexImage2DARB
     (GL_TEXTURE_2D, 0, GL_COMPRESSED_RGB_565_VQ_TWID_KOS,
      512, 512, 0, Texture_Ada1_Data'Size,
      Texture_Ada1_Data'Address);

   glGenTextures (1, Texture_Dc'Access);
   glBindTexture (GL_TEXTURE_2D, Texture_Dc);
   glCompressedTexImage2DARB
     (GL_TEXTURE_2D, 0, GL_COMPRESSED_RGB_565_VQ_TWID_KOS,
      512, 512, 0, Texture_Dc_Data'Size,
      Texture_Dc_Data'Address);

   glGenTextures(1, Texture_Dcwiki'Access);
   glBindTexture(GL_TEXTURE_2D, Texture_Dcwiki);
   glCompressedTexImage2DARB
     (GL_TEXTURE_2D, 0, GL_COMPRESSED_RGB_565_VQ_TWID_KOS,
      512, 512, 0, Texture_Dcwiki_Data'Size,
      Texture_Dcwiki_Data'Address);

   glGenTextures(1, Texture_Gcc'Access);
   glBindTexture(GL_TEXTURE_2D, Texture_Gcc);
   glCompressedTexImage2DARB
     (GL_TEXTURE_2D, 0, GL_COMPRESSED_RGB_565_VQ_TWID_KOS,
      512, 512, 0, Texture_Gcc_Data'Size,
      Texture_Gcc_Data'Address);

   glGenTextures(1, Texture_Kos'Access);
   glBindTexture(GL_TEXTURE_2D, Texture_Kos);
   glCompressedTexImage2DARB
     (GL_TEXTURE_2D, 0, GL_COMPRESSED_RGB_565_VQ_TWID_KOS,
      512, 512, 0, Texture_Kos_Data'Size,
      Texture_Kos_Data'Address);

   glGenTextures(1, Texture_Ada'Access);
   glBindTexture(GL_TEXTURE_2D, Texture_Ada);
   glCompressedTexImage2DARB
     (GL_TEXTURE_2D, 0, GL_COMPRESSED_RGB_565_VQ_TWID_KOS,
      512, 512, 0, Texture_Ada_Data'Size,
      Texture_Ada_Data'Address);

   loop
       glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
       glLoadIdentity;
       glTranslatef(0.0, 0.0, -5.0);

       glRotatef(X_Rot, 1.0, 0.0, 0.0);
       glRotatef(Y_Rot, 0.0, 1.0, 0.0);
       glRotatef(Z_Rot, 0.0, 0.0, 1.0);

       --  Front face
       glBindTexture(GL_TEXTURE_2D, Texture_Ada1);
       glBegin(GL_QUADS);

       glColor3f(1.0, 1.0, 1.0);
       glTexCoord2f(1.0, 0.0);
       glVertex3f(-1.0, -1.0,  1.0);
       glTexCoord2f(0.0, 0.0);
       glVertex3f(1.0, -1.0,  1.0);
       glTexCoord2f(0.0, 1.0);
       glVertex3f(1.0,  1.0,  1.0);
       glTexCoord2f(1.0, 1.0);
       glVertex3f(-1.0,  1.0,  1.0);

       glEnd;

       --  Back face
       glBindTexture(GL_TEXTURE_2D, Texture_Gcc);
       glBegin(GL_QUADS);

       glColor3f(1.0, 1.0, 1.0);
       glTexCoord2f(0.0, 0.0);
       glVertex3f(-1.0, -1.0, -1.0);
       glTexCoord2f(0.0, 1.0);
       glVertex3f(-1.0,  1.0, -1.0);
       glTexCoord2f(1.0, 1.0);
       glVertex3f(1.0,  1.0, -1.0);
       glTexCoord2f(1.0, 0.0);
       glVertex3f(1.0, -1.0, -1.0);

       glEnd;

       --  Top face
       glBindTexture(GL_TEXTURE_2D, Texture_Dcwiki);
       glBegin(GL_QUADS);

       glColor3f(1.0, 1.0, 1.0);
       glTexCoord2f(1.0, 1.0);
       glVertex3f(-1.0,  1.0, -1.0);
       glTexCoord2f(1.0, 0.0);
       glVertex3f(-1.0,  1.0,  1.0);
       glTexCoord2f(0.0, 0.0);
       glVertex3f(1.0,  1.0,  1.0);
       glTexCoord2f(0.0, 1.0);
       glVertex3f(1.0,  1.0, -1.0);

       glEnd;

       --  Bottom face
       glBindTexture(GL_TEXTURE_2D, Texture_Kos);
       glBegin(GL_QUADS);

       glColor3f(1.0, 1.0, 1.0);
       glTexCoord2f(0.0, 1.0);
       glVertex3f(-1.0, -1.0, -1.0);
       glTexCoord2f(1.0, 1.0);
       glVertex3f(1.0, -1.0, -1.0);
       glTexCoord2f(1.0, 0.0);
       glVertex3f(1.0, -1.0,  1.0);
       glTexCoord2f(0.0, 0.0);
       glVertex3f(-1.0, -1.0,  1.0);

       glEnd;

       --  Right face
       glBindTexture(GL_TEXTURE_2D, Texture_Dc);
       glBegin(GL_QUADS);

       glColor3f(0.0, 1.0, 0.0);
       glTexCoord2f(0.0, 0.0);
       glVertex3f(1.0, -1.0, -1.0);
       glColor3f(0.3, 0.5, 1.0);
       glTexCoord2f(0.0, 1.0);
       glVertex3f(1.0,  1.0, -1.0);
       glColor3f(1.0, 0.3, 0.5);
       glTexCoord2f(1.0, 1.0);
       glVertex3f(1.0,  1.0,  1.0);
       glColor3f(0.5, 0.5, 0.5);
       glTexCoord2f(1.0, 0.0);
       glVertex3f(1.0, -1.0,  1.0);

       glEnd;

       --  Left face
       glBindTexture(GL_TEXTURE_2D, Texture_Ada);
       glBegin(GL_QUADS);

       glColor3f(1.0, 0.0, 0.0);
       glTexCoord2f(1.0, 0.0);
       glVertex3f(-1.0, -1.0, -1.0);
       glColor3f(1.0, 1.0, 0.0);
       glTexCoord2f(0.0, 0.0);
       glVertex3f(-1.0, -1.0,  1.0);
       glColor3f(0.0, 1.0, 1.0);
       glTexCoord2f(0.0, 1.0);
       glVertex3f(-1.0,  1.0,  1.0);
       glColor3f(0.0, 0.0, 1.0);
       glTexCoord2f(1.0, 1.0);
       glVertex3f(-1.0,  1.0, -1.0);

       glEnd;

       X_Rot := X_Rot + 1.4;
       Y_Rot := Y_Rot + 1.1;
       Z_Rot := Z_Rot + 1.8;

       glKosSwapBuffers;
   end loop;

   -- Clean up our textures
   glDeleteTextures(1, Texture_Ada1'Access);
   glDeleteTextures(1, Texture_Dc'Access);
   glDeleteTextures(1, Texture_Dcwiki'Access);
   glDeleteTextures(1, Texture_Gcc'Access);
   glDeleteTextures(1, Texture_Kos'Access);
   glDeleteTextures(1, Texture_Ada'Access);

end Gldemo2;
