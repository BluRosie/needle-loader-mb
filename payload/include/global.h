#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include "gba/gba.h"

// global.h from pokemon ruby

// IDE support
#if defined(__APPLE__) || defined(__CYGWIN__)
#define _(x) x
#define __(x) x
#define INCBIN(x) {0}
#define INCBIN_U8 INCBIN
#define INCBIN_U16 INCBIN
#define INCBIN_U32 INCBIN
#define INCBIN_S8 INCBIN
#define INCBIN_S16 INCBIN
#define INCBIN_S32 INCBIN
#endif

// Prevent cross-jump optimization.
#define BLOCK_CROSS_JUMP asm("");

// to help in decompiling
#define asm_comment(x) asm volatile("@ -- " x " -- ")

#define asm_unified(x) asm(".syntax unified\n" x "\n.syntax divided\n")

#define NAKED __attribute__((naked))


#define NELEMS(arr) (sizeof(arr)/sizeof(*(arr)))


#define min(a, b) ((a) < (b) ? (a) : (b))
#define max(a, b) ((a) >= (b) ? (a) : (b))

// why does GF hate 2d arrays
#define MULTI_DIM_ARR(x, dim, y) ((x) * dim + (y))

// dim access enums
enum
{
    B_8 = 1,
    B_16 = 2,
    B_32 = 4
};

// There are many quirks in the source code which have overarching behavioral differences from
// a number of other files. For example, diploma.c seems to declare rodata before each use while
// other files declare out of order and must be at the beginning. There are also a number of
// macros which differ from one file to the next due to the method of obtaining the result, such
// as these below. Because of this, there is a theory (Two Team Theory) that states that these
// programming projects had more than 1 "programming team" which utilized different macros for
// each of the files that were worked on.
#define T1_READ_8(ptr)  ((ptr)[0])
#define T1_READ_16(ptr) ((ptr)[0] | ((ptr)[1] << 8))
#define T1_READ_32(ptr) ((ptr)[0] | ((ptr)[1] << 8) | ((ptr)[2] << 16) | ((ptr)[3] << 24))
#define T1_READ_PTR(ptr) (u8*) T1_READ_32(ptr)

// T2_READ_8 is a duplicate to remain consistent with each group.
#define T2_READ_8(ptr)  ((ptr)[0])
#define T2_READ_16(ptr) ((ptr)[0] + ((ptr)[1] << 8))
#define T2_READ_32(ptr) ((ptr)[0] + ((ptr)[1] << 8) + ((ptr)[2] << 16) + ((ptr)[3] << 24))
#define T2_READ_PTR(ptr) (void*) T2_READ_32(ptr)

// Credits to Made (dolphin emoji)
#define S16TOPOSFLOAT(val)   \
({                           \
    s16 v = (val);           \
    float f = (float)v;      \
    if(v < 0) f += 65536.0f; \
    f;                       \
})


#define RGB(r, g, b) (((b & 0x1F) << 10) | ((g & 0x1F) << 5) | (r & 0x1F))
#define COLOR_R(color) (color & 0x1F)
#define COLOR_G(color) ((color >> 5) & 0x1F)
#define COLOR_B(color) ((color >> 10) & 0x1F)


typedef struct GLOBAL_STRUCTURE {
    u32 unk_000;
    u8 pad_004[0x8];
    u32 rngValue;
    u8 pad_010[0x814 - 0x10];
    vu16 unk_814; // thanks jiang
    u16 unk_816;
    u16 unk_818;
    u16 unk_81A;
    u16 unk_81C;
    u16 unk_81E;
    u16 unk_820;
    u16 unk_822;
    u16 unk_824;
    u16 unk_826;
    u16 unk_828;
    u16 unk_82A;
    u8 pad_82C[0x10];
    u16 unk_83C;
    u16 unk_83E;
    u16 unk_840;
    u16 unk_842;
    u16 unk_844;
    u16 unk_846;
    u16 unk_848;
    u16 unk_84A;
    u8 pad_84C[0x852 - 0x84C];
    u8 unk_852;
    u8 unk_853;
    u8 unk_854;
    u8 unk_855;
    u8 unk_856;
    u8 unk_857;
    u8 unk_858;
    u8 unk_859;
    u8 unk_85A;
    u8 unk_85B;
    u8 unk_85C;
    u8 unk_85D;
    u8 unk_85E;
    u8 unk_85F;
    u8 unk_860;
} GLOBAL_STRUCTURE;


typedef struct unk_struct_03000E30 {
    s8 *unk0;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u16 unkC;
    u8 unkE;
    u8 unkF;
    u64 unk10;
    u64 unk18;
} unk_struct_03000E30;

typedef struct unk_struct_03000E50 {
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u8 pad[0x16];
    u8 unk26;
} unk_struct_03000E50;


#define DmaSetSrc(dmaNum, src)     \
{                                                 \
    vu32 *dmaRegs = (vu32 *)REG_ADDR_DMA##dmaNum; \
    dmaRegs[0] = (vu32)(src);                     \
}

#define DmaSet(dmaNum, src, dest, control)        \
{                                                 \
    vu32 *dmaRegs = (vu32 *)REG_ADDR_DMA##dmaNum; \
    dmaRegs[0] = (vu32)(src);                     \
    dmaRegs[1] = (vu32)(dest);                    \
    dmaRegs[2] = (vu32)(control);                 \
    dmaRegs[2];                                   \
}

#define S_DmaSet(dmaNum, src, dest, control)      \
{                                                 \
    dmaRegs = (vu32 *)REG_ADDR_DMA##dmaNum;       \
    dmaRegs[0] = (vu32)(src);                     \
    dmaRegs[1] = (vu32)(dest);                    \
    dmaRegs[2] = (vu32)(control);                 \
    dmaRegs[2];                                   \
}

#define S_DMA_FILL(dmaNum, value, dest, size, bit)                                            \
{                                                                                             \
    vu32 *dmaRegs;                                                                            \
    vu##bit tmp = (vu##bit)(value);                                                           \
    S_DmaSet(dmaNum,                                                                          \
           &tmp,                                                                              \
           dest,                                                                              \
           (DMA_ENABLE | DMA_START_NOW | DMA_##bit##BIT | DMA_SRC_FIXED | DMA_DEST_INC) << 16 \
         | ((size)/(bit/8)));                                                                 \
}

#define S_DmaFill16(dmaNum, value, dest, size) S_DMA_FILL(dmaNum, value, dest, size, 16)
#define S_DmaFill32(dmaNum, value, dest, size) S_DMA_FILL(dmaNum, value, dest, size, 32)

#define DMA_COPY(dmaNum, src, dest, size, bit)                                              \
    DmaSet(dmaNum,                                                                          \
           src,                                                                             \
           dest,                                                                            \
           (DMA_ENABLE | DMA_START_NOW | DMA_##bit##BIT | DMA_SRC_INC | DMA_DEST_INC) << 16 \
         | ((size)/(bit/8)))

#define DmaCopy16(dmaNum, src, dest, size) DMA_COPY(dmaNum, src, dest, size, 16)
#define DmaCopy32(dmaNum, src, dest, size) DMA_COPY(dmaNum, src, dest, size, 32)


extern u8* g0201B3A4;
extern u8* g0201D3A4;
extern u32 g0203b000;


extern u8* g0201F3A4;
extern u8* g020213A4;
extern u8* g020293a4;

extern u8* g020313A4;
extern u8* g020315A4;
extern u8* g020317a4;
extern u8* g02038000;
extern u8* g02038200;
extern u32* gUnk_30008C0;
extern GLOBAL_STRUCTURE gGlobalStructure;
extern u64 gUnk_30008D0[0x80];
extern unk_struct_03000E30 gUnk_3000E30;
extern unk_struct_03000E50 g03000E50;

#endif
