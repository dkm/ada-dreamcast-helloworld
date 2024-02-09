# Ada hello world on DreamCast


## Kludge collection

* Need to copy romdisk.o from somewhere else (e.g. `KallistiOS/examples/dreamcast/hello/`)
* Need to fake the Alire index to provide the `sh-elf`
* Need to sprinkle configuration in gpr files
* Need to link by hand because gprbuild adds unwanted options
* Need to clone `bare_runtime`
* There's a typo, it's Hello WorLd, not Hello Word... who cares /o\

### bare_runtime

Make sure the path in `dchelloword` for `bare_runtime` points to this local
clone (see https://github.com/dkm/bare_runtime).

``` sh
$ git clone -b dkm/sh2_support https://github.com/dkm/bare_runtime.git
```

### romdisk.o

- build the `hello` example
- copy the `romdisk.o` into the target example (`cp $ROOT/KallistiOS/examples/dreamcast/hello/romdisk.o .`)

### alire index

Ugliest part. Couldn't find a way to have `alr` use an external cross.
- build a tgz from the KallistiOS toolchain:

``` sh
$ cd install_dir
$ ls
arm-eabi sh-elf
$ tar cvzf gnat-sh-elf-linux64-13.2.0-1.tar.gz --transform "s,^./,./gnat-sh-elf-linux64-13.2.0-1/,"  ./sh-elf/

```
- have a web server publish it locally:
```sh
$ python3 -m http.server 8001
```
- force it in `alr` index:
``` sh
$ mkdir ~/.config/alire/indexes/community/repo/index/gn/gnat_sh_elf/
$ cp gnat_sh_elf-13.2.1.toml ~/.config/alire/indexes/community/repo/index/gn/gnat_sh_elf/
```

### gpr configuration

In `bare_runtime` gpr file, add this:

``` ada
for Library_Support use "static_only";
for Library_Kind use "static";
for Library_Builder  use "/usr/libexec/gprbuild/gprlib";
```
This should be with the toolchain config, but :shrug: at the moment.

### manual link

Running: `alr build --development` will produce a nice ELF with nothing in
`.text`. `gprbuild` adds `-nostartfiles -nolibc` on the command line, which is
not a good thing.

``` sh
$ alr -v build --development
```
Spot the link command, and remove the 2 options listed above and run it within `obj/development`. Should look like:

``` sh
$ cd obj/development
$ /path/to/sh-elf-gcc dchelloword.o b__dchelloword.o /some/path/to/stuff/bare_runtime/adalib/libgnat.a -
Wl,-Ttext=0x8c010000 -ml -m4-single-only -ffunction-sections -fdata-sections -matomic-model=soft-imask -ftls-model=local-exec -Wl,--gc-sections -T/some/path/to/stuff/KallistiOS//utils/ldscripts/shlelf.xc -nodefaultlibs -L/some/path/to/stuff/KallistiOS//lib/dreamcast -L/some/path/to/stuff/KallistiOS//addons/lib/dreamcast -L/some/path/to/stuff/KallistiOS//../kos-ports/lib /some/path/to/stuff/dchelloword//romdisk.o -Wl,--start-group -lkallisti -lc -lgcc -Wl,--end-group -L/some/path/to/stuff/dchel
loword/obj/development/ -L/some/path/to/stuff/dchelloword/obj/development/ -L/some/path/to/stuff/bare_runtime/adalib/ -static-libgcc /some/path/to/stuff/bare_runtime/adalib/libgnat.a -Wl,-L/some/path/to/stuff/bare_runtime//adalib -fomit-frame-pointer -ml -m4-single-only -ffunction-sections -fdata-sections -matomic-model=soft-imask
 -ftls-model=local-exec -o /some/path/to/stuff/dchelloword/bin//dchelloword)

```

## Debug

- run the emulator

``` sh
$ lxdream-nitro --gdb-sh4=1235 -n  -u -e ./bin/dchelloword
```

- attach `gdb`

``` sh
$ gdb-multiarch  --eval "target remote localhost:1235" bin/dchelloword
```

Break on `init` or `__ada_dchelloword`.
