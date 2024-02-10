pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with machine_udefault_types_h;
with stddef_h;
with System;

package sys_utypes_h is

  -- ANSI C namespace clean utility typedefs  
  -- This file defines various typedefs needed by the system calls that support
  --   the C library.  Basically, they're just the POSIX versions with an '_'
  --   prepended.  Targets shall use <machine/_types.h> to define their own
  --   internal types if desired.
  --   There are three define patterns used for type definitions.  Lets assume
  --   xyz_t is a user type.
  --   The internal type definition uses __machine_xyz_t_defined.  It is defined by
  --   <machine/_types.h> to disable a default definition in <sys/_types.h>. It
  --   must not be used in other files.
  --   User type definitions are guarded by __xyz_t_defined in glibc and
  --   _XYZ_T_DECLARED in BSD compatible systems.
  -- 

   subtype uu_blkcnt_t is long;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:30

   subtype uu_blksize_t is long;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:34

   subtype uu_fsblkcnt_t is machine_udefault_types_h.uu_uint64_t;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:38

   subtype uu_fsfilcnt_t is machine_udefault_types_h.uu_uint32_t;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:42

   subtype u_off_t is long;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:46

   subtype uu_pid_t is int;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:52

   subtype uu_dev_t is short;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:56

   subtype uu_uid_t is unsigned_short;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:60

   subtype uu_gid_t is unsigned_short;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:63

   subtype uu_id_t is machine_udefault_types_h.uu_uint32_t;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:67

   subtype uu_ino_t is unsigned_long;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:73

   subtype uu_mode_t is machine_udefault_types_h.uu_uint32_t;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:90

   subtype u_off64_t is Long_Long_Integer;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:96

   subtype uu_off_t is u_off_t;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:102

   subtype uu_loff_t is u_off64_t;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:105

   subtype uu_key_t is long;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:108

  -- * We need fpos_t for the following, but it doesn't have a leading "_",
  -- * so we use _fpos_t instead.
  --  

  -- XXX must match off_t in <sys/types.h>  
   subtype u_fpos_t is long;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:116

  -- (and must be `long' for now)  
  -- Defined by GCC provided <stddef.h>  
   subtype uu_size_t is unsigned;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:131

  -- If __SIZE_TYPE__ is defined (gcc) we define ssize_t based on size_t.
  --   We simply change "unsigned" to "signed" for this single definition
  --   to make sure ssize_t and size_t only differ by their signedness.  

   subtype u_ssize_t is int;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:147

   subtype uu_ssize_t is u_ssize_t;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:158

  -- Conversion state information.   
  -- Value so far.   
   type anon_array780 is array (0 .. 3) of aliased unsigned_char;
   type anon_union778 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_wch : aliased stddef_h.wint_t;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:167
         when others =>
            uu_wchb : aliased anon_array780;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:168
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type u_mbstate_t is record
      uu_count : aliased int;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:164
      uu_value : aliased anon_union778;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:169
   end record
   with Convention => C_Pass_By_Copy;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:170

  -- Iconv descriptor type  
   type u_iconv_t is new System.Address;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:175

   subtype uu_clock_t is unsigned_long;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:182

   subtype uu_time_t is machine_udefault_types_h.uu_int_least64_t;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:189

   subtype uu_clockid_t is unsigned_long;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:195

   subtype uu_daddr_t is long;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:198

   subtype uu_timer_t is unsigned_long;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:202

   subtype uu_sa_family_t is machine_udefault_types_h.uu_uint8_t;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:205

   subtype uu_socklen_t is machine_udefault_types_h.uu_uint32_t;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:209

   subtype uu_nl_item is int;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:212

   subtype uu_nlink_t is unsigned_short;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:213

  -- microseconds (signed)  
   subtype uu_suseconds_t is long;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:214

  -- microseconds (unsigned)  
   subtype uu_useconds_t is unsigned_long;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:215

  -- * Must be identical to the __GNUCLIKE_BUILTIN_VAALIST definition in
  -- * <sys/cdefs.h>.  The <sys/cdefs.h> must not be included here to avoid cyclic
  -- * header dependencies.
  --  

   subtype uu_va_list is System.Address;  -- /mnt/barryallen/dkm/dc/sh-elf/sh-elf/include/sys/_types.h:223

end sys_utypes_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
