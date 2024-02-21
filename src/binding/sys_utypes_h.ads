pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
with sys_lock_h;
with System;
with Interfaces.C.Extensions;

package sys_utypes_h is

   FD_SETSIZE : constant := 1024;  --  /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:164

   LITTLE_ENDIAN : constant := 1234;  --  /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:169

   BIG_ENDIAN : constant := 4321;  --  /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:172

   PDP_ENDIAN : constant := 3412;  --  /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:175

   AT_EACCESS : constant := 1;  --  /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:182

   AT_SYMLINK_NOFOLLOW : constant := 2;  --  /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:187

   AT_SYMLINK_FOLLOW : constant := 4;  --  /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:192

   AT_REMOVEDIR : constant := 8;  --  /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:197

   IOV_MAX : constant := 1024;  --  /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:202

  --* \file    sys/_types.h
  --    \brief   Internal typedefs.
  --    \ingroup system_types
  --    This file contains internal typedefs required by libc. You probably
  --    shouldn't use any of these in your code. Most of these are copied from
  --    newlib's %sys/_types.h.
  -- 

  --* \addtogroup system_types
  --    @{
  -- 

  -- This part copied from newlib's sys/_types.h.
  --* \brief  File offset type.  
   subtype u_off_t is long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:26

   subtype uu_off_t is u_off_t;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:27

  --* \brief  Device ID type.  
   subtype uu_dev_t is short;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:32

  --* \brief  User ID type.  
   subtype uu_uid_t is unsigned_short;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:37

  --* \brief  Group ID type.  
   subtype uu_gid_t is unsigned_short;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:41

  --* \brief  64-bit file offset type.  
   subtype u_off64_t is Long_Long_Integer;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:46

  --* \brief  File position type.  
   subtype u_fpos_t is long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:51

  --* \brief  64-bit file position type.  
  --* \brief  Signed size type.  
   subtype u_ssize_t is int;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:63

  --* \cond  
  --* \endcond  
  --* \brief  Conversion state information.
  --    \headerfile sys/_types.h
  -- 

   type anon_array825 is array (0 .. 3) of aliased unsigned_char;
   type anon_anon_3 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_wch : aliased stddef_h.wint_t;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:80
         when others =>
            uu_wchb : aliased anon_array825;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:81
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type u_mbstate_t is record
      uu_count : aliased int;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:78
      uu_value : aliased anon_anon_3;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:82
   end record
   with Convention => C_Pass_By_Copy;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:83

  -- Value so far.   
  --* \brief  File lock type.  
   subtype u_flock_t is sys_lock_h.uu_newlib_recursive_lock_t;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:88

  --* \brief  Iconv descriptor type.  
   type u_iconv_t is new System.Address;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:93

   subtype uu_blkcnt_t is long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:97

   subtype uu_blksize_t is long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:101

   subtype uu_daddr_t is long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:105

   subtype uu_fsblkcnt_t is Extensions.unsigned_long_long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:109

   subtype uu_fsfilcnt_t is unsigned_long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:113

   subtype uu_id_t is unsigned_long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:117

   subtype uu_ino_t is unsigned_long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:121

   subtype uu_pid_t is int;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:125

   subtype uu_key_t is long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:129

   subtype uu_mode_t is unsigned_long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:133

   subtype uu_nlink_t is unsigned_short;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:136

  -- microseconds (signed)  
   subtype uu_suseconds_t is long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:137

  -- microseconds (unsigned)  
   subtype uu_useconds_t is unsigned_long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:138

   subtype uu_time_t is Long_Long_Integer;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:145

   subtype uu_clockid_t is unsigned_long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:151

   subtype uu_timer_t is unsigned_long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:154

   subtype uu_clock_t is unsigned_long;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:160

  -- This part inserted to fix newlib brokenness.
  --* \brief  Size of an fd_set.  
  -- The architecture should define the macro BYTE_ORDER in <arch/types.h> to
  --   equal one of these macros for code that looks for these BSD-style macros.  

  --* \brief  Little Endian test macro  
  --* \brief  Big Endian test macro  
  --* \brief  PDP Endian test macro  
  -- Sigh... for some reason, Newlib only bothers defining these on Cygwin...
  --   We're only actually concerned with AT_SYMLINK_NOFOLLOW currently. These
  --   should all be defined in <fcntl.h>, by the way.  

  --* \brief  Check access using effective user and group ID  
  --* \brief  Do not follow symlinks  
  --* \brief  Follow symbolic links  
  --* \brief  Remove directory instead of file  
  --* \brief  Maximum length of an iovec, in elements.  
  -- This is for old KOS source compatibility.  
  -- Include stuff to make pthreads work as well.  
   subtype uu_va_list is System.Address;  -- /mnt/barryallen/dkm/git/KallistiOS/include/sys/_types.h:212

  --* @}  
  -- Grab our C11 time stuff if we got here from <time.h>.  
end sys_utypes_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
