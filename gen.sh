#!/usr/bin/env bash

set -eu

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

KOS_PORTS="$KOS_BASE/../kos-ports"
CC=kos-cc

FLAGS=(
    "-x c++"
    "-I $KOS_BASE/include/"
    "-I $KOS_PORTS/include/"
    "-I $KOS_BASE/kernel/arch/dreamcast/include/"
    "-I $KOS_BASE/addons/include/"
)

OTHER_FLAGS=(
    "-C"
    "-fdump-ada-spec"
)

SOURCE_HEADERS=(
    "$KOS_BASE/kernel/arch/dreamcast/include/dc/minifont.h"
    "$SCRIPT_DIR/res/placeholder.h"
    "$KOS_PORTS/include/GL/glkos.h"
    "$KOS_PORTS/include/GL/glu.h"
)
mkdir -p "$SCRIPT_DIR/src-bindings"
pushd "$SCRIPT_DIR/src-bindings"
for header in "${SOURCE_HEADERS[@]}"; do
    $CC ${FLAGS[*]} ${OTHER_FLAGS[*]} "$header"
done
popd

TEX_FILES=(
    "res/tex_dc.jpg"
    "res/tex_gcc.jpg"
    "res/tex_claw.jpg"
    "res/tex_dcwiki.jpg"
    "res/tex_kos.jpg"
    "res/tex_rust.jpg"
)

"$KOS_BASE/utils/vqenc/vqenc" -t -v ${TEX_FILES[*]}
mv res/*.vq src-gen/

TEXT_ASM="$SCRIPT_DIR/src-gen/textures.s"
echo ".section .rodata" > "$TEXT_ASM"

(for texture in "${TEX_FILES[@]}"; do
    T_NAME=$(basename "$texture" .jpg)
    echo ".global _$T_NAME"
    echo ".type _$T_NAME, @object"

    echo "_$T_NAME :"
    echo ".incbin \"$T_NAME.vq\""
    echo ".size _$T_NAME, . - _$T_NAME"
done)>> "$TEXT_ASM"
