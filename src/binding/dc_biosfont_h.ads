pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with arch_types_h;
with System;
with Interfaces.C.Strings;

package dc_biosfont_h is

   BFONT_THIN_WIDTH : constant := 12;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:33
   --  unsupported macro: BFONT_WIDE_WIDTH BFONT_THIN_WIDTH * 2

   BFONT_HEIGHT : constant := 24;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:35

   JISX_0208_ROW_SIZE : constant := 94;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:38

   BFONT_NARROW_START : constant := 0;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:42
   --  unsupported macro: BFONT_OVERBAR BFONT_NARROW_START
   --  unsupported macro: BFONT_ISO_8859_1_33_126 BFONT_NARROW_START+( 1*BFONT_THIN_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_YEN BFONT_NARROW_START+(95*BFONT_THIN_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_ISO_8859_1_160_255 BFONT_NARROW_START+(96*BFONT_THIN_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_WIDE_START (288*BFONT_THIN_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_JISX_0208_ROW1 BFONT_WIDE_START
   --  unsupported macro: BFONT_JISX_0208_ROW16 BFONT_WIDE_START+(658*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_JISX_0208_ROW48 BFONT_JISX_0208_ROW16+((32*JISX_0208_ROW_SIZE)*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_DREAMCAST_SPECIFIC BFONT_WIDE_START+(7056*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_CIRCLECOPYRIGHT BFONT_DREAMCAST_SPECIFIC+(0*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_CIRCLER BFONT_DREAMCAST_SPECIFIC+(1*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_TRADEMARK BFONT_DREAMCAST_SPECIFIC+(2*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_UPARROW BFONT_DREAMCAST_SPECIFIC+(3*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_DOWNARROW BFONT_DREAMCAST_SPECIFIC+(4*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_LEFTARROW BFONT_DREAMCAST_SPECIFIC+(5*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_RIGHTARROW BFONT_DREAMCAST_SPECIFIC+(6*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_UPRIGHTARROW BFONT_DREAMCAST_SPECIFIC+(7*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_DOWNRIGHTARROW BFONT_DREAMCAST_SPECIFIC+(8*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_DOWNLEFTARROW BFONT_DREAMCAST_SPECIFIC+(9*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_UPLEFTARROW BFONT_DREAMCAST_SPECIFIC+(10*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_ABUTTON BFONT_DREAMCAST_SPECIFIC+(11*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_BBUTTON BFONT_DREAMCAST_SPECIFIC+(12*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_CBUTTON BFONT_DREAMCAST_SPECIFIC+(13*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_DBUTTON BFONT_DREAMCAST_SPECIFIC+(14*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_XBUTTON BFONT_DREAMCAST_SPECIFIC+(15*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_YBUTTON BFONT_DREAMCAST_SPECIFIC+(16*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_ZBUTTON BFONT_DREAMCAST_SPECIFIC+(17*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_LTRIGGER BFONT_DREAMCAST_SPECIFIC+(18*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_RTRIGGER BFONT_DREAMCAST_SPECIFIC+(19*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_STARTBUTTON BFONT_DREAMCAST_SPECIFIC+(20*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)
   --  unsupported macro: BFONT_VMUICON BFONT_DREAMCAST_SPECIFIC+(21*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)

   BFONT_ICON_DIMEN : constant := 32;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:80
   --  unsupported macro: BFONT_VMU_DREAMCAST_SPECIFIC BFONT_DREAMCAST_SPECIFIC+(22*BFONT_WIDE_WIDTH*BFONT_HEIGHT/8)

   BFONT_ICON_INVALID_VMU : constant := 16#00#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:92
   BFONT_ICON_HOURGLASS_ONE : constant := 16#01#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:93
   BFONT_ICON_HOURGLASS_TWO : constant := 16#02#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:94
   BFONT_ICON_HOURGLASS_THREE : constant := 16#03#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:95
   BFONT_ICON_HOURGLASS_FOUR : constant := 16#04#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:96
   BFONT_ICON_VMUICON : constant := 16#05#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:97
   BFONT_ICON_EARTH : constant := 16#06#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:98
   BFONT_ICON_SATURN : constant := 16#07#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:99
   BFONT_ICON_QUARTER_MOON : constant := 16#08#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:100
   BFONT_ICON_LAUGHING_FACE : constant := 16#09#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:101
   BFONT_ICON_SMILING_FACE : constant := 16#0A#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:102
   BFONT_ICON_CASUAL_FACE : constant := 16#0B#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:103
   BFONT_ICON_ANGRY_FACE : constant := 16#0C#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:104
   BFONT_ICON_COW : constant := 16#0D#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:105
   BFONT_ICON_HORSE : constant := 16#0E#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:106
   BFONT_ICON_RABBIT : constant := 16#0F#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:107
   BFONT_ICON_CAT : constant := 16#10#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:108
   BFONT_ICON_CHICK : constant := 16#11#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:109
   BFONT_ICON_LION : constant := 16#12#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:110
   BFONT_ICON_MONKEY : constant := 16#13#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:111
   BFONT_ICON_PANDA : constant := 16#14#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:112
   BFONT_ICON_BEAR : constant := 16#15#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:113
   BFONT_ICON_PIG : constant := 16#16#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:114
   BFONT_ICON_DOG : constant := 16#17#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:115
   BFONT_ICON_FISH : constant := 16#18#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:116
   BFONT_ICON_OCTOPUS : constant := 16#19#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:117
   BFONT_ICON_SQUID : constant := 16#1A#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:118
   BFONT_ICON_WHALE : constant := 16#1B#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:119
   BFONT_ICON_CRAB : constant := 16#1C#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:120
   BFONT_ICON_BUTTERFLY : constant := 16#1D#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:121
   BFONT_ICON_LADYBUG : constant := 16#1E#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:122
   BFONT_ICON_ANGLER_FISH : constant := 16#1F#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:123
   BFONT_ICON_PENGUIN : constant := 16#20#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:124
   BFONT_ICON_CHERRIES : constant := 16#21#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:125
   BFONT_ICON_TULIP : constant := 16#22#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:126
   BFONT_ICON_LEAF : constant := 16#23#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:127
   BFONT_ICON_SAKURA : constant := 16#24#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:128
   BFONT_ICON_APPLE : constant := 16#25#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:129
   BFONT_ICON_ICECREAM : constant := 16#26#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:130
   BFONT_ICON_CACTUS : constant := 16#27#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:131
   BFONT_ICON_PIANO : constant := 16#28#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:132
   BFONT_ICON_GUITAR : constant := 16#29#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:133
   BFONT_ICON_EIGHTH_NOTE : constant := 16#2A#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:134
   BFONT_ICON_TREBLE_CLEF : constant := 16#2B#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:135
   BFONT_ICON_BOAT : constant := 16#2C#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:136
   BFONT_ICON_CAR : constant := 16#2D#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:137
   BFONT_ICON_HELMET : constant := 16#2E#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:138
   BFONT_ICON_MOTORCYCLE : constant := 16#2F#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:139
   BFONT_ICON_VAN : constant := 16#30#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:140
   BFONT_ICON_TRUCK : constant := 16#31#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:141
   BFONT_ICON_CLOCK : constant := 16#32#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:142
   BFONT_ICON_TELEPHONE : constant := 16#33#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:143
   BFONT_ICON_PENCIL : constant := 16#34#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:144
   BFONT_ICON_CUP : constant := 16#35#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:145
   BFONT_ICON_SILVERWARE : constant := 16#36#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:146
   BFONT_ICON_HOUSE : constant := 16#37#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:147
   BFONT_ICON_BELL : constant := 16#38#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:148
   BFONT_ICON_CROWN : constant := 16#39#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:149
   BFONT_ICON_SOCK : constant := 16#3A#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:150
   BFONT_ICON_CAKE : constant := 16#3B#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:151
   BFONT_ICON_KEY : constant := 16#3C#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:152
   BFONT_ICON_BOOK : constant := 16#3D#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:153
   BFONT_ICON_BASEBALL : constant := 16#3E#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:154
   BFONT_ICON_SOCCER : constant := 16#3F#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:155
   BFONT_ICON_BULB : constant := 16#40#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:156
   BFONT_ICON_TEDDY_BEAR : constant := 16#41#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:157
   BFONT_ICON_BOW_TIE : constant := 16#42#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:158
   BFONT_ICON_BOW_ARROW : constant := 16#43#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:159
   BFONT_ICON_SNOWMAN : constant := 16#44#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:160
   BFONT_ICON_LIGHTNING : constant := 16#45#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:161
   BFONT_ICON_SUN : constant := 16#46#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:162
   BFONT_ICON_CLOUD : constant := 16#47#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:163
   BFONT_ICON_UMBRELLA : constant := 16#48#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:164
   BFONT_ICON_ONE_STAR : constant := 16#49#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:165
   BFONT_ICON_TWO_STARS : constant := 16#4A#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:166
   BFONT_ICON_THREE_STARS : constant := 16#4B#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:167
   BFONT_ICON_FOUR_STARS : constant := 16#4C#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:168
   BFONT_ICON_HEART : constant := 16#4D#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:169
   BFONT_ICON_DIAMOND : constant := 16#4E#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:170
   BFONT_ICON_SPADE : constant := 16#4F#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:171
   BFONT_ICON_CLUB : constant := 16#50#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:172
   BFONT_ICON_JACK : constant := 16#51#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:173
   BFONT_ICON_QUEEN : constant := 16#52#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:174
   BFONT_ICON_KING : constant := 16#53#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:175
   BFONT_ICON_JOKER : constant := 16#54#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:176
   BFONT_ICON_ISLAND : constant := 16#55#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:177
   BFONT_ICON_0 : constant := 16#56#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:178
   BFONT_ICON_1 : constant := 16#57#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:179
   BFONT_ICON_2 : constant := 16#58#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:180
   BFONT_ICON_3 : constant := 16#59#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:181
   BFONT_ICON_4 : constant := 16#5A#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:182
   BFONT_ICON_5 : constant := 16#5B#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:183
   BFONT_ICON_6 : constant := 16#5C#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:184
   BFONT_ICON_7 : constant := 16#5D#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:185
   BFONT_ICON_8 : constant := 16#5E#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:186
   BFONT_ICON_9 : constant := 16#5F#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:187
   BFONT_ICON_A : constant := 16#60#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:188
   BFONT_ICON_B : constant := 16#61#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:189
   BFONT_ICON_C : constant := 16#62#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:190
   BFONT_ICON_D : constant := 16#63#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:191
   BFONT_ICON_E : constant := 16#64#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:192
   BFONT_ICON_F : constant := 16#65#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:193
   BFONT_ICON_G : constant := 16#66#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:194
   BFONT_ICON_H : constant := 16#67#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:195
   BFONT_ICON_I : constant := 16#68#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:196
   BFONT_ICON_J : constant := 16#69#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:197
   BFONT_ICON_K : constant := 16#6A#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:198
   BFONT_ICON_L : constant := 16#6B#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:199
   BFONT_ICON_M : constant := 16#6C#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:200
   BFONT_ICON_N : constant := 16#6D#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:201
   BFONT_ICON_O : constant := 16#6E#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:202
   BFONT_ICON_P : constant := 16#6F#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:203
   BFONT_ICON_Q : constant := 16#70#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:204
   BFONT_ICON_R : constant := 16#71#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:205
   BFONT_ICON_S : constant := 16#72#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:206
   BFONT_ICON_T : constant := 16#73#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:207
   BFONT_ICON_U : constant := 16#74#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:208
   BFONT_ICON_V : constant := 16#75#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:209
   BFONT_ICON_W : constant := 16#76#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:210
   BFONT_ICON_X : constant := 16#77#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:211
   BFONT_ICON_Y : constant := 16#78#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:212
   BFONT_ICON_Z : constant := 16#79#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:213
   BFONT_ICON_CHECKER_BOARD : constant := 16#7A#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:214
   BFONT_ICON_GRID : constant := 16#7B#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:215
   BFONT_ICON_LIGHT_GRAY : constant := 16#7C#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:216
   BFONT_ICON_DIAG_GRID : constant := 16#7D#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:217
   BFONT_ICON_PACMAN_GRID : constant := 16#7E#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:218
   BFONT_ICON_DARK_GRAY : constant := 16#7F#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:219
   BFONT_ICON_EMBROIDERY : constant := 16#80#;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:220

   BFONT_CODE_ISO8859_1 : constant := 0;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:257
   BFONT_CODE_EUC : constant := 1;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:258
   BFONT_CODE_SJIS : constant := 2;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:259
   BFONT_CODE_RAW : constant := 3;  --  /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:260

  -- KallistiOS ##version##
  --   dc/biosfont.h
  --   (c)2000-2001 Megan Potter
  --   Japanese Functions (c)2002 Kazuaki Matsumoto
  --   (c)2017 Donald Haase
  -- 

  --* \file   dc/biosfont.h
  --    \brief  BIOS font drawing functions.
  --    This file provides support for utilizing the font built into the Dreamcast's
  --    BIOS. These functions allow access to both the western character set and
  --    Japanese characters.
  --    \author Megan Potter
  --    \author Kazuaki Matsumoto
  --    \author Donald Haase
  -- 

  --* \defgroup bfont_size  Dimensions of the Bios Font
  --    @{
  -- 

  --* @}  
  --* \defgroup bfont_indicies Structure of the Bios Font
  --    @{
  -- 

  -- JISX-0208 Rows 1-7 and 16-84 are encoded between BFONT_WIDE_START and BFONT_DREAMCAST_SPECIFIC.
  --    Only the box-drawing characters (row 8) are missing.  

  --* @}  
  --* \defgroup vmu_icons Builtin VMU Icons
  --    \ingroup  bfont_indicies
  --    Builtin VMU volume user icons. The Dreamcast's
  --    BIOS allows the user to set these when formatting the VMU.
  --    @{
  -- 

  --* @}  
  --* \brief  Set the font foreground color.
  --    This function selects the foreground color to draw when a pixel is opaque in
  --    the font. The value passed in for the color should be in whatever pixel
  --    format that you intend to use for the image produced.
  --    \param  c               The color to use.
  --    \return                 The old foreground color.
  -- 

   function bfont_set_foreground_color (c : arch_types_h.uint32) return arch_types_h.uint32  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:232
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_set_foreground_color";

  --* \brief  Set the font background color.
  --    This function selects the background color to draw when a pixel is drawn in
  --    the font. This color is only used for pixels not covered by the font when
  --    you have selected to have the font be opaque.
  --    \param  c               The color to use.
  --    \return                 The old background color.
  -- 

   function bfont_set_background_color (c : arch_types_h.uint32) return arch_types_h.uint32  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:243
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_set_background_color";

  --* \brief  Set the font to draw 32-bit color.
  --    This function changes whether the font draws colors as 32-bit or 16-bit. The
  --    default is to use 16-bit.
  --    \param  on              Set to 0 to use 16-bit color, 32-bit otherwise.
  --    \return                 The old state (1 = 32-bit, 0 = 16-bit).
  -- 

   function bfont_set_32bit_mode (on : int) return int  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:253
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_set_32bit_mode";

  -- Constants for the function below  
  --* \brief  Set the font encoding.
  --    This function selects the font encoding that is used for the font. This
  --    allows you to select between the various character sets available.
  --    \param  enc             The character encoding in use
  --    \see    BFONT_CODE_ISO8859_1
  --    \see    BFONT_CODE_EUC
  --    \see    BFONT_CODE_SJIS
  --    \see    BFONT_CODE_RAW
  -- 

   procedure bfont_set_encoding (enc : arch_types_h.uint8)  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:273
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_set_encoding";

  --* \brief  Find an ISO-8859-1 character in the font.
  --    This function retrieves a pointer to the font data for the specified
  --    character in the font, if its available. Generally, you will not have to
  --    use this function, use one of the bfont_draw_* functions instead.
  --    \param  ch              The character to look up
  --    \return                 A pointer to the raw character data
  -- 

   function bfont_find_char (ch : arch_types_h.uint32) return access arch_types_h.uint8  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:284
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_find_char";

  --* \brief  Find an full-width Japanese character in the font.
  --    This function retrieves a pointer to the font data for the specified
  --    character in the font, if its available. Generally, you will not have to
  --    use this function, use one of the bfont_draw_* functions instead.
  --    This function deals with full-width kana and kanji.
  --    \param  ch              The character to look up
  --    \return                 A pointer to the raw character data
  -- 

   function bfont_find_char_jp (ch : arch_types_h.uint32) return access arch_types_h.uint8  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:297
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_find_char_jp";

  --* \brief  Find an half-width Japanese character in the font.
  --    This function retrieves a pointer to the font data for the specified
  --    character in the font, if its available. Generally, you will not have to
  --    use this function, use one of the bfont_draw_* functions instead.
  --    This function deals with half-width kana only.
  --    \param  ch              The character to look up
  --    \return                 A pointer to the raw character data
  -- 

   function bfont_find_char_jp_half (ch : arch_types_h.uint32) return access arch_types_h.uint8  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:310
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_find_char_jp_half";

  --* \brief Draw a single character of any sort to the buffer.
  --    This function draws a single character in the set encoding to the given
  --    buffer. This function sits under draw, draw_thin, and draw_wide, while
  --    exposing the colors and bitdepths desired. This will allow the writing
  --    of bfont characters to palletted textures.
  --    \param buffer       The buffer to draw to.
  --    \param bufwidth     The width of the buffer in pixels.
  --    \param fg           The foreground color to use.
  --    \param bg           The background color to use.
  --    \param bpp          The number of bits per pixel in the buffer.
  --    \param opaque       If non-zero, overwrite background areas with black,
  --                            otherwise do not change them from what they are.
  --    \param c            The character to draw.
  --    \param wide         Draw a wide character.
  --    \param iskana       Draw a half-width kana character.
  --    \return             Amount of width covered in bytes.
  -- 

   function bfont_draw_ex
     (buffer : access arch_types_h.uint8;
      bufwidth : arch_types_h.uint32;
      fg : arch_types_h.uint32;
      bg : arch_types_h.uint32;
      bpp : arch_types_h.uint8;
      opaque : arch_types_h.uint8;
      c : arch_types_h.uint32;
      wide : arch_types_h.uint8;
      iskana : arch_types_h.uint8) return unsigned_char  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:331
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_draw_ex";

  --* \brief  Draw a single character to a buffer.
  --    This function draws a single character in the set encoding to the given
  --    buffer. Calling this is equivalent to calling bfont_draw_thin() with 0 for
  --    the final parameter.
  --    \param  buffer          The buffer to draw to (at least 12 x 24 pixels)
  --    \param  bufwidth        The width of the buffer in pixels
  --    \param  opaque          If non-zero, overwrite blank areas with black,
  --                            otherwise do not change them from what they are
  --    \param  c               The character to draw
  --    \return                 Amount of width covered in bytes.
  -- 

   function bfont_draw
     (buffer : System.Address;
      bufwidth : arch_types_h.uint32;
      opaque : arch_types_h.uint8;
      c : arch_types_h.uint32) return unsigned_char  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:348
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_draw";

  --* \brief  Draw a single thin character to a buffer.
  --    This function draws a single character in the set encoding to the given
  --    buffer. This only works with ISO-8859-1 characters and half-width kana.
  --    \param  buffer          The buffer to draw to (at least 12 x 24 pixels)
  --    \param  bufwidth        The width of the buffer in pixels
  --    \param  opaque          If non-zero, overwrite blank areas with black,
  --                            otherwise do not change them from what they are
  --    \param  c               The character to draw
  --    \param  iskana          Set to 1 if the character is a kana, 0 if ISO-8859-1
  --    \return                 Amount of width covered in bytes.
  -- 

   function bfont_draw_thin
     (buffer : System.Address;
      bufwidth : arch_types_h.uint32;
      opaque : arch_types_h.uint8;
      c : arch_types_h.uint32;
      iskana : arch_types_h.uint8) return unsigned_char  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:363
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_draw_thin";

  --* \brief  Draw a single wide character to a buffer.
  --    This function draws a single character in the set encoding to the given
  --    buffer. This only works with full-width kana and kanji.
  --    \param  buffer          The buffer to draw to (at least 24 x 24 pixels)
  --    \param  bufwidth        The width of the buffer in pixels
  --    \param  opaque          If non-zero, overwrite blank areas with black,
  --                            otherwise do not change them from what they are
  --    \param  c               The character to draw
  --    \return                 Amount of width covered in bytes.
  -- 

   function bfont_draw_wide
     (buffer : System.Address;
      bufwidth : arch_types_h.uint32;
      opaque : arch_types_h.uint8;
      c : arch_types_h.uint32) return unsigned_char  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:378
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_draw_wide";

  --* \brief  Draw a full string to any sort of buffer.
  --    This function draws a NUL-terminated string in the set encoding to the given
  --    buffer. This will automatically handle mixed half and full-width characters
  --    if the encoding is set to one of the Japanese encodings. Colors and bitdepth
  --    can be set.
  --    \param b                The buffer to draw to.
  --    \param width            The width of the buffer in pixels.
  --    \param fg               The foreground color to use.
  --    \param bg               The background color to use.
  --    \param bpp              The number of bits per pixel in the buffer.
  --    \param opaque           If non-zero, overwrite background areas with black,
  --                            otherwise do not change them from what they are.
  --    \param str              The string to draw.
  -- 

   procedure bfont_draw_str_ex
     (b : System.Address;
      width : arch_types_h.uint32;
      fg : arch_types_h.uint32;
      bg : arch_types_h.uint32;
      bpp : arch_types_h.uint8;
      opaque : arch_types_h.uint8;
      str : Interfaces.C.Strings.chars_ptr)  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:398
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_draw_str_ex";

  --* \brief  Draw a full string to a buffer.
  --    This function draws a NUL-terminated string in the set encoding to the given
  --    buffer. This will automatically handle mixed half and full-width characters
  --    if the encoding is set to one of the Japanese encodings. Draws pre-set
  --    16-bit colors.
  --    \param  b               The buffer to draw to.
  --    \param  width           The width of the buffer in pixels.
  --    \param  opaque          If one, overwrite blank areas with bfont_bgcolor,
  --                            otherwise do not change them from what they are.
  --    \param  str             The string to draw.
  -- 

   procedure bfont_draw_str
     (b : System.Address;
      width : arch_types_h.uint32;
      opaque : arch_types_h.uint8;
      str : Interfaces.C.Strings.chars_ptr)  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:414
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_draw_str";

  --* \brief  Find a VMU icon.
  --    This function retrieves a pointer to the icon data for the specified VMU
  --    icon in the bios, if its available. The icon data is flipped both vertically
  --    and horizontally. Each vmu icon has dimensions 32x32 pixels and is 128 bytes
  --    long.
  --    \param  icon            The icon to look up. Use BFONT_ICON_* values
  --                            starting with BFONT_ICON_INVALID_VMU.
  --    \return                 A pointer to the raw icon data or NULL if icon value
  --                            is incorrect.
  -- 

   function bfont_find_icon (icon : arch_types_h.uint8) return access arch_types_h.uint8  -- /mnt/barryallen/dkm/git/KallistiOS/kernel/arch/dreamcast/include/dc/biosfont.h:428
   with Import => True, 
        Convention => C, 
        External_Name => "bfont_find_icon";

end dc_biosfont_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
