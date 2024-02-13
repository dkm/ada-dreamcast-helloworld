# Ada hello world on DreamCast


## Kludge collection

* Need to copy romdisk.o from somewhere else (e.g. `KallistiOS/examples/dreamcast/hello/`)
* ~~Need to fake the Alire index to provide the `sh-elf`~~ 
* ~~Need to sprinkle configuration in gpr files~~
* ~~Need to link by hand because gprbuild adds unwanted options~~
* Need to clone `bare_runtime`
* There's a typo, it's Hello WorLd, not Hello Word... who cares /o\

## Instructions

### kludge: romdisk.o

- build the `hello` example
- copy the `romdisk.o` into the target example (`cp $ROOT/KallistiOS/examples/dreamcast/hello/romdisk.o .`)

### regular

- clone `bare_runtime` (should be renamed `kallistios-runtime`):
``` sh
$ cd $SOME_ROOT && git clone -b dkm/sh2_support https://github.com/dkm/bare_runtime.git
```
- clone this repository:
``` sh
$ cd $SOME_ROOT && git clone https://github.com/dkm/dchelloword.git
```
- build using a recent enough `gprbuild` (18 from debian is too old, 22 is known
  to work) with your KallistiOS toolchain in the `PATH`:
``` sh
$ cd $SOME_ROOT/dchelloword/ && gprbuild  -f  dchelloword.gpr -XRUNTIME_BUILD=Production
```
- the result is in `bin/dchelloword`

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
