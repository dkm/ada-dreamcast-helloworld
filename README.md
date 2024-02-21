# Ada hello world on DreamCast


## Kludge collection

* Need a patched version of KallistiOS
* ~~Need to copy romdisk.o from somewhere else (e.g. `KallistiOS/examples/dreamcast/hello/`)~~
* ~~Need to fake the Alire index to provide the `sh-elf`~~ 
* ~~Need to sprinkle configuration in gpr files~~
* ~~Need to link by hand because gprbuild adds unwanted options~~
* Need to clone [KallistiOS Ada Runtime](https://github.com/dkm/kallistios_ada_runtime)
* There's a typo, it's Hello WorLd, not Hello Word... who cares /o\

## Instructions

- clone `KallistiOS` from my fork (until it is merge, if merged)

``` sh
$ cd $SOME_ROOT && git clone -b dkm/ada_support https://github.com/dkm/KallistiOS.git
```
- build the toolchain (see KallistiOS instructions). All following commands are
  expected to be within a correct environment (i.e. the `environ.sh` has been
  sourced).
- clone [KallistiOS Ada Runtime](https://github.com/dkm/kallistios_ada_runtime):
``` sh
$ cd $SOME_ROOT && git clone https://github.com/dkm/kallistios_ada_runtime.git
```
- clone this repository:
``` sh
$ cd $SOME_ROOT && git clone https://github.com/dkm/dchelloword.git
```
- generate bindings and texture files

``` sh
$ gen.sh
```
- build using a recent enough `gprbuild` (18 from debian is too old, 22 is known
  to work) with your KallistiOS toolchain in the `PATH`:
``` sh
$ cd $SOME_ROOT/dchelloword/ && gprbuild  -f  dchelloword.gpr -XRUNTIME_BUILD=Production
```
- the result is in `bin/dchelloword` and `bin/gldemo2`

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
