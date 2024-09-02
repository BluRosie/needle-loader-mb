#include "global.h"

// functions that are in the file
void sub_2018348(u64 *ip, u64 *r8, u8 flag);
s32 sub_20183F0(u32 index);
void sub_2018428(void);
void sub_201856C(s8 *a0, u32 a1, u16 r6, u16 a3, u16 sp14, u8 sp18, u32 sp1C);
void sub_201866C(unk_struct_03000E30 *r3, s32 a1);
void sub_20189EC(void);


// external declarations
void sub_2018F44(void);
void sub_2018FB8(void);
void sub_2019468(void);
void sub_2019498(u32, u32, u32, u32);
void sub_2019A84(void *, u32, u32);
void sub_2019A88(u32);
void sub_02019A8C(s32);
u32 sub_2019AC8(s32 r0, s16 r1);
void sub_2019B60(void *, u32, u32);
void nullsub_2(void);


void AgbMain(void)
{
    sub_2018428();
    sub_2018F44();
}


void nullsub_1(void) {}


void sub_2018220(void)
{
    u8 unk_85F = gGlobalStructure.unk_85F;
    if (!unk_85F)
    {
        CpuFastCopy(&gUnk_30008D0, (void*)0x07000000, 0x400);
        REG_DISPCNT = gGlobalStructure.unk_82A;
        REG_BG0HOFS = gGlobalStructure.unk_83C;
        REG_BG0VOFS = gGlobalStructure.unk_83E;
        REG_BG1HOFS = gGlobalStructure.unk_840;
        REG_BG1VOFS = gGlobalStructure.unk_842;
        REG_BG2HOFS = gGlobalStructure.unk_844;
        REG_BG2VOFS = gGlobalStructure.unk_846;
        REG_BG3HOFS = gGlobalStructure.unk_848;
        REG_BG3VOFS = gGlobalStructure.unk_84A;
        REG_BLDALPHA = gGlobalStructure.unk_81C;
        REG_BLDY = gGlobalStructure.unk_81E;
        REG_BLDCNT = gGlobalStructure.unk_820;
        REG_BG0CNT = gGlobalStructure.unk_822;
        REG_BG1CNT = gGlobalStructure.unk_824;
        REG_BG2CNT = gGlobalStructure.unk_826;
        REG_BG3CNT = gGlobalStructure.unk_828;
        if (gGlobalStructure.unk_859 == 1)
            gGlobalStructure.unk_859 = unk_85F;
        gGlobalStructure.unk_85B++;
        gGlobalStructure.unk_85F = 1;
    }
    REG_IF = gGlobalStructure.unk_814 = 1; // yeah
    REG_DISPSTAT = 8;
    nullsub_2();
}


void nullsub_3(void) {}


void nullsub_4(void) {}


struct UNK_A_02019DEC
{
    u8 unk0[0x80];
};


extern u8 a_0201adec[];
extern struct UNK_A_02019DEC a_02019dec[]; // something like this?  was trying to get 2019e6c out of the pool


// thanks jiang for the match
void sub_2018348(u64 *ip, u64 *r8, u8 flag)
{
    u64 storage[1];
    struct UNK_A_02019DEC *storage2;
    u8 *r1_a_02019dec;
    u8 *sp0;
    u8 *r5_a_02019e6c;
    u64 sp0_stk[2];
    u8 *r6_a_201adec;
    u8 *r3_pap;
    u32 idx;
    int i;

    //memcpy(sp0, ip, sizeof(sp0));
    sp0_stk[0] = ip[0];
    sp0_stk[1] = r8[0];

    if (flag == 0x80 || flag == 0x7F || flag == 0xCD)
    {
        ip[0] = 0;
        *storage = 0;
    }
    else
    {
        idx = ((flag >> 4)*0x20 + (flag & 0xF)); // no me gusta
        idx *= 8;
        storage2 = a_02019dec;
        sp0 = (u8 *)&sp0_stk[0];
        r6_a_201adec = a_0201adec;
        r3_pap = (u8 *)&sp0_stk[1];
        r5_a_02019e6c = &({storage2[1].unk0;})[idx]; // fakematch
        r1_a_02019dec = &storage2[0].unk0[idx];

        for (i = 7; i >= 0; i--)
        {
            if (flag != 0x20)
            {
                *r3_pap = *r1_a_02019dec;
                *sp0 = *r5_a_02019e6c;
            }
            else
            {
                *r3_pap = *r6_a_201adec;
                *sp0 = r6_a_201adec[8];
            }
            sp0++;
            r6_a_201adec++;
            r3_pap++;
            r5_a_02019e6c++;
            r1_a_02019dec++;
        } // r12 is p1
        *ip = sp0_stk[0];
        if (r3_pap) {r3_pap++; r3_pap--;} // fakematch
        *storage = sp0_stk[1];
    }
    *r8 = *storage;
}


extern u8 a_02019bec[];

s32 sub_20183F0(u32 index)
{
    if (index <= 0xFF)
    {
        return a_02019bec[index];
    }
    else
    {
        return -1;
    }
}


extern u8 a_02019cec[];
extern void _intr();

s32 sub_201840C(u32 index)
{
    if (index <= 0xFF)
    {
        return a_02019cec[index];
    }
    else
    {
        return -1;
    }
}


void sub_2018428(void) {
    sub_2019A88(0xC0);
    S_DmaFill32(3, 0, 0x03000000, 0x1E00*4);
    S_DmaFill32(3, 0, 0x06000000, 0x6000*4);
    REG_WAITCNT = 0x4014;
    DmaCopy16(3, 0x02019bb4, 0x03000880, 0x1c*2);
    DmaCopy16(3, &_intr, 0x03000024, 0x800);
    *(u32*)0x03007ffc = 0x03000024;
}

s32 sub_20184B8(s8 *spC, u16 *r9, u16 r2, u16 r8, u8 *sp3C, int sp40, u8 sp10, u8 sp14, u8 sp18)
{
    s32 v12;
    s32 v13;
    u32 v14;
    s32 v15;
    s32 v16;
    s32 v17;

    v12 = 0;
    v13 = (r8 * (r2 >> 3)) << 5;
    v14 = r2 & 7;
    while ( v12 < sp40 )
    {
        v15 = sp3C[v12];
        if ( sp14 == 1 && v15 == 205 )
            break;
        if ( v15 == 127 )
            break;
        v16 = sp18 == 1 ? 8 : sub_20183F0(sp3C[v12]);
        v17 = *r9;
        if ( v16 + v17 > 8 * r8 )
            break;
        sub_201856C(&spC[v13], v17, v14, r8, v15, sp10, v16 - 1);
        *r9 += v16;
        ++v12;
    }
    return v12;
}

// sp14 needs to be casted down to u8 or else regswap in sub_20184B8
void sub_201856C(s8 *a0, u32 a1, u16 r6, u16 a3, u16 sp14, u8 sp18, u32 sp1C)
{
    gUnk_3000E30.unk0 = a0;
    gUnk_3000E30.unk4 = a1;
    gUnk_3000E30.unk6 = r6;
    gUnk_3000E30.unk8 = a3;
    gUnk_3000E30.unkE = sp18;
    sub_2018348(&gUnk_3000E30.unk10, &gUnk_3000E30.unk18, sp14);
    sub_201866C(&gUnk_3000E30, sp1C);
}

void sub_20185A4(s8 r4)
{
    // will have to come back and worry about rodata ordering potentially at some point
    // currently is just weird ordered incbin's in data
    u32 v10[3] = {0x06017F40, 0x06002000, 0x06002000};
    void *spC[3];

    sub_2019B60(spC, 0, 12);
    {
        u32 v11[3] = {0xC0, 0xC00, 0x1200};
        if ( r4 >= 0 )
            CpuFastCopy((void*)spC[r4], (void*)v10[r4], v11[r4]);
    }
}

void sub_20185FC(s8 a0, s8 a1)
{
    s8 a1_2 = a1; // needed to fix regswap
    u32 sp0[3];
    sub_2019B60(sp0, 0, 12);
    {
        u32 spC[3] = {0x340, 0xC00, 0x1200};
        u32 sp18[1];
        if (a1_2 >= 0)
        {
            s32 v7 = 0, v8;
            for (v8 = 0; v8 <= 7; v8++)
            {
                s8 a00 = a0 & 0xF; // needed to fix regswap
                v7 |= ((a00 & 0xF) << (v8 << 2));
            }
            sp18[0] = v7;
            CpuFastFill2((void*)sp18, (void*)sp0[a1_2], spC[a1_2] );
        }
    }
}


// see https://decomp.me/scratch/pekph for the attempt at this so far.  need to knock it out

#ifdef NONMATCHING

void sub_201866C(unk_struct_03000E30 *r3, s32 a1)
{
    u16 r9;
    u16 r4;
    //register unk_struct_03000E30 *r3 asm("r3") = r30;
    s32 sp4 = 0; // sp4 is perfect

    r9 = r3->unk6; // r9 is perfect
    while (sp4 <= 7)
    {
        s32 r8 = 0; // r8 is perfect
        u16 r7 = r3->unk4; // r7 is perfect
        while (r8 < a1)
        //for (r8 = 0; r8 < a1; r8++)
        {
            u8 temp1;
            u32 temp2;
            u8 temp3;
            u8 *temp4;
            u16 r6 = (r3->unk8 * (r9 >> 3) + (r7 >> 3)); // this is perfect
            if ((((u8 *)&r3->unk18)[sp4] >> r8) & 1)
            {
                r4 = ((r6 << 5) + ((r9 & 7) << 2) + ((r7 & 7) >> 1));
                temp1 = r3->unk0[r4];
                if (r7 & 1)
                {
                    r3->unk0[r4] = (temp1 & 0xF) | (r3->unkE & 0xF) << 4;
                }
                else
                {
                    r3->unk0[r4] = (temp1 & 0xF0) | (r3->unkE & 0xF);
                }
            }
            r6 = (r6 + r3->unk8);

            // this is just about the same code as the above, but for some reason gets closer to matching with the extra variables.  maybe i'm focused on the percent too much
            if ((((u8 *)(u32)r3->unk10)[sp4] >> r8) & 1)
            {
                r4 = ((r6 << 5) + ((r9 & 7) << 2) + ((r7 & 7) >> 1));
                temp1 = r3->unk0[r4];
                if ( r7 & 1 )
                {
                    temp2 = temp1 & 0xF;
                    temp3 = (r3->unkE & 0xF) << 4;
                    //r3->unk0[r4] = (temp1 & 0xF) | (r3->unkE & 0xF) << 4;
                }
                else
                {
                    temp2 = temp1 & 0xF0;
                    temp3 = r3->unkE & 0xF;
                    //r3->unk0[r4] = (temp1 & 0xF0) | (r3->unkE & 0xF);
                }
                temp1 = temp2 | temp3;
                r3->unk0[r4] = temp2 | temp3;
            }
            r8++; // this is proper, but r1 is swapped with r2 for the operation
            r7++; // this is proper as well
        }
        sp4++; // sp8 is swapped with spC
        r9++; //
    }
    return;
}

#else

NAKED void sub_201866C(unk_struct_03000E30 *r3, s32 a1)
{
    asm_unified("\tpush {r4, r5, r6, r7, lr}\n\
    \tmov r7, sl\n\
    \tmov r6, sb\n\
    \tmov r5, r8\n\
    \tpush {r5, r6, r7}\n\
    \tsub sp, #0x10\n\
    \tadds r3, r0, #0\n\
    \tstr r1, [sp]\n\
    \tmovs r0, #0\n\
    \tstr r0, [sp, #4]\n\
    \tldrh r1, [r3, #6]\n\
    \tmov sb, r1\n\
    _02018684:\n\
    \tmovs r2, #0\n\
    \tmov r8, r2\n\
    \tldrh r7, [r3, #4]\n\
    \tldr r5, [sp, #4]\n\
    \tadds r5, #1\n\
    \tstr r5, [sp, #8]\n\
    \tmov r0, sb\n\
    \tadds r0, #1\n\
    \tstr r0, [sp, #0xc]\n\
    \tldr r1, [sp]\n\
    \tcmp r8, r1\n\
    \tbge _02018784\n\
    \tmov r0, sb\n\
    \tmovs r2, #7\n\
    \tands r0, r2\n\
    \tlsls r0, r0, #2\n\
    \tmov sl, r0\n\
    \tmovs r5, #0xf\n\
    \tmov ip, r5\n\
    _020186AA:\n\
    \tmov r0, sb\n\
    \tlsrs r1, r0, #3\n\
    \tldrh r0, [r3, #8]\n\
    \tadds r2, r0, #0\n\
    \tmuls r2, r1, r2\n\
    \tadds r0, r2, #0\n\
    \tlsrs r1, r7, #3\n\
    \tadds r0, r0, r1\n\
    \tlsls r0, r0, #0x10\n\
    \tlsrs r6, r0, #0x10\n\
    \tadds r0, r3, #0\n\
    \tadds r0, #0x18\n\
    \tldr r5, [sp, #4]\n\
    \tadds r0, r0, r5\n\
    \tldrb r0, [r0]\n\
    \tmov r1, r8\n\
    \tasrs r0, r1\n\
    \tmovs r2, #1\n\
    \tands r0, r2\n\
    \tcmp r0, #0\n\
    \tbeq _02018716\n\
    \tlsls r1, r6, #5\n\
    \tadd r1, sl\n\
    \tadds r0, r7, #0\n\
    \tmovs r5, #7\n\
    \tands r0, r5\n\
    \tlsrs r0, r0, #1\n\
    \tadds r1, r1, r0\n\
    \tlsls r1, r1, #0x10\n\
    \tlsrs r4, r1, #0x10\n\
    \tldr r1, [r3]\n\
    \tadds r0, r1, r4\n\
    \tldrb r0, [r0]\n\
    \tadds r2, r0, #0\n\
    \tadds r0, r7, #0\n\
    \tmovs r5, #1\n\
    \tands r0, r5\n\
    \tadds r5, r1, #0\n\
    \tcmp r0, #0\n\
    \tbeq _02018706\n\
    \tmov r0, ip\n\
    \tands r2, r0\n\
    \tldrb r1, [r3, #0xe]\n\
    \tands r0, r1\n\
    \tlsls r0, r0, #4\n\
    \tb _02018710\n\
    _02018706:\n\
    \tmovs r0, #0xf0\n\
    \tands r2, r0\n\
    \tldrb r1, [r3, #0xe]\n\
    \tmov r0, ip\n\
    \tands r0, r1\n\
    _02018710:\n\
    \torrs r2, r0\n\
    \tadds r0, r5, r4\n\
    \tstrb r2, [r0]\n\
    _02018716:\n\
    \tldrh r0, [r3, #8]\n\
    \tadds r0, r6, r0\n\
    \tlsls r0, r0, #0x10\n\
    \tlsrs r6, r0, #0x10\n\
    \tadds r0, r3, #0\n\
    \tadds r0, #0x10\n\
    \tldr r1, [sp, #4]\n\
    \tadds r0, r0, r1\n\
    \tldrb r0, [r0]\n\
    \tmov r2, r8\n\
    \tasrs r0, r2\n\
    \tmovs r5, #1\n\
    \tands r0, r5\n\
    \tcmp r0, #0\n\
    \tbeq _02018774\n\
    \tlsls r1, r6, #5\n\
    \tadd r1, sl\n\
    \tadds r0, r7, #0\n\
    \tmovs r2, #7\n\
    \tands r0, r2\n\
    \tlsrs r0, r0, #1\n\
    \tadds r1, r1, r0\n\
    \tlsls r1, r1, #0x10\n\
    \tlsrs r4, r1, #0x10\n\
    \tldr r1, [r3]\n\
    \tadds r0, r1, r4\n\
    \tldrb r0, [r0]\n\
    \tadds r2, r0, #0\n\
    \tadds r0, r7, #0\n\
    \tands r0, r5\n\
    \tadds r5, r1, #0\n\
    \tcmp r0, #0\n\
    \tbeq _02018764\n\
    \tmov r0, ip\n\
    \tands r2, r0\n\
    \tldrb r1, [r3, #0xe]\n\
    \tands r0, r1\n\
    \tlsls r0, r0, #4\n\
    \tb _0201876E\n\
    _02018764:\n\
    \tmovs r0, #0xf0\n\
    \tands r2, r0\n\
    \tldrb r1, [r3, #0xe]\n\
    \tmov r0, ip\n\
    \tands r0, r1\n\
    _0201876E:\n\
    \torrs r2, r0\n\
    \tadds r0, r5, r4\n\
    \tstrb r2, [r0]\n\
    _02018774:\n\
    \tmovs r1, #1\n\
    \tadd r8, r1\n\
    \tadds r0, r7, #1\n\
    \tlsls r0, r0, #0x10\n\
    \tlsrs r7, r0, #0x10\n\
    \tldr r2, [sp]\n\
    \tcmp r8, r2\n\
    \tblt _020186AA\n\
    _02018784:\n\
    \tldr r5, [sp, #8]\n\
    \tstr r5, [sp, #4]\n\
    \tldr r1, [sp, #0xc]\n\
    \tlsls r0, r1, #0x10\n\
    \tlsrs r0, r0, #0x10\n\
    \tmov sb, r0\n\
    \tcmp r5, #7\n\
    \tbgt _02018796\n\
    \tb _02018684\n\
    _02018796:\n\
    \tadd sp, #0x10\n\
    \tpop {r3, r4, r5}\n\
    \tmov r8, r3\n\
    \tmov sb, r4\n\
    \tmov sl, r5\n\
    \tpop {r4, r5, r6, r7}\n\
    \tpop {r0}\n\
    \tbx r0\n");
}

#endif

s32 sub_20187A8(s16 r0, s16 r1)
{
    s32 temp = r0 * r1;
    if (temp < 0)
        temp += 0xFF;
    return (temp << 8) >> 16;
}

s16 sub_20187C4(s16 r0, s16 r1)
{
    return sub_2019AC8((r0 << 16) >> 8, r1);
}

// pretty sure this is unused anyway
u32 Random(GLOBAL_STRUCTURE *r2)
{
    r2->rngValue = (r2->rngValue * 1103515245) + ({r2->unk_85B + 12345;}); // fakematch
    return (r2->rngValue << 1) >> 17;
}

void SeedRng(GLOBAL_STRUCTURE *r0, u32 seed)
{
    r0->rngValue = seed;
}

// thanks kermalis!
void sub_2018808(GLOBAL_STRUCTURE *r5, u16 r1, u16 r4, u16 r3)
{
    if (r1 == 1)
        r5->unk_820 = r4 | 0xC0;
    else
        r5->unk_820 = r4 | 0x80;
    if (r3 > 0x10)
        r3 = 0x10;
    r5->unk_81E = r3;
}

u16 sub_2018844(GLOBAL_STRUCTURE *r0, bool8 r1, u8 r2)
{
    s16 temp = r0->unk_81E;
    if (r1 == TRUE)
    {
        temp += r2;
        if (temp > 0x10)
            temp = 0x10;
    }
    else if (r1 == FALSE)
    {
        temp -= r2;
        if (temp < 0)
            temp = 0;
    }
    r0->unk_81E = temp;
    return r0->unk_81E;
}

void sub_2018894(u16 *r0, u32 r1, u32 r2, u8 *red, u8 *green, u8 *blue)
{
    u16 color;
    color = r0[(r1 & 0xF) * 16 + (r2 & 0xF)];
    *blue = COLOR_B(color);
    *green = COLOR_G(color);
    *red = COLOR_R(color);
}

void sub_20188C4(bool8 r0, u8 r6, u8 r7, u8 r, u8 g, u8 b)
{
    u16 *r5;
    u16 color;
    if (r0 == TRUE)
        r5 = (u16 *)0x02038200;
    else
        r5 = (u16 *)0x02038000;
    color = RGB(r, g, b);
    r5[(r6 & 0xF) * 16 + (r7 & 0xF)] = color;
    gGlobalStructure.unk_852 = 1;
}

void sub_201892C(void)
{
    gGlobalStructure.unk_814 &= 0xFFFE;
    while ((gGlobalStructure.unk_814 & 1) == 0) ;
    gGlobalStructure.unk_814 &= 0xFFFE;
}


extern const u64 a_0201b0a0;

void sub_2018978(void) {
    u64* ptr = gUnk_30008D0;
    u64* r4 = &gUnk_30008D0[0x80];

    while(ptr < r4){
        *ptr++ = a_0201b0a0;

    }
    gGlobalStructure.unk_860 = 0;

}

void sub_20189B0() {
    u16 keys =  (REG_KEYINPUT ^ KEYS_MASK);

    gGlobalStructure.unk_81A = keys & ~gGlobalStructure.unk_818;
    gGlobalStructure.unk_818 = keys;
}

void sub_20189EC() {
    REG_IME = 0;

    REG_DISPCNT = DISPCNT_FORCED_BLANK;
    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_IE = INTR_FLAG_VBLANK;

    REG_IF = INTR_FLAG_VBLANK;
    REG_IME = 1;

}

void UNUSED nullsub_6(void) {}

void UNUSED nullsub_7(void) {}

void UNUSED nullsub_2(void) {}

void UNUSED nullsub_8(void) {}

void UNUSED nullsub_9(void) {}

void UNUSED nullsub_10(void) {}

void UNUSED nullsub_11(void) {}

void UNUSED nullsub_12(void) {}

void UNUSED nullsub_13(void) {}

void sub_2018A3C(char* arg0, char arg1, char arg2, int c) {
    int i = 0;

    if (c > 0) {
        for (; i < c; i++) {
            if (arg0[i] == arg1) {
                arg0[i] = arg2;
            }
        }
    }
}

int sub_2018A68(char* arg0, int count) {
    char* c;
    int i = 0;
    if(count > 0){
        for(i = count; i > 0; i--){
            c =  (&arg0[i] -1);

            if(*c != 0x80){
                break;
            }
        }
    }

    return i;
}


int sub_2018A98(char* arg0, char* arg1, int c) {
    int i = 0;


    if(c > 0){
        for(; i < c; i++){
            if(arg0[i] != arg1[i]){
                break;
            }
        }
    }

    return i != c;
}

void sub_2018AD4(char* arg0, char* arg1, int c) {
    int i;

    if(c > 0){
        for(i = 0; i < c; i++){
            arg1[i] = arg0[i];
        }
    }
}

void sub_2018AF8(char arg0, char* arg1, int c) {
    int i;

    if(c > 0){
        for(i = 0; i < c; i++){
            arg1[i] = arg0;
        }
    }
}

void UNUSED nullsub_14(void) {}

void sub_2018B20(void) {
    sub_20189EC();

    gGlobalStructure.unk_85F = 1;
    gGlobalStructure.unk_858 = 1;
    gUnk_30008C0 = &g0203b000;

    DmaCopy32(3,&g020213A4, OBJ_VRAM0, 0x8000);
    DmaCopy32(3,&g020293a4, BG_VRAM, 0x8000);
    DmaCopy16(3,&g020313A4, &g02038200, 0x200);
    DmaCopy16(3,&g020315A4, &g02038000, 0x200);

    DmaCopy16(3,&g02038000,BG_PLTT,0x400);


    gGlobalStructure.unk_822 = 0xDC00;
    gGlobalStructure.unk_824 = 0xD801;
    gGlobalStructure.unk_826 = 0xD402;
    gGlobalStructure.unk_828 = 0xD003;

    DmaCopy32(3,&g020317a4,BG_VRAM + (8 * (gGlobalStructure.unk_822 & 0x1F00)),0x2000);

    DmaCopy32(3,&g0201B3A4,(BG_VRAM + (8 * (gGlobalStructure.unk_824 & 0x1F00))),0x2000);
    DmaCopy32(3,&g0201D3A4,(BG_VRAM + (8 * (gGlobalStructure.unk_826 & 0x1F00))),0x2000);
    DmaCopy32(3,&g0201F3A4,(BG_VRAM + (8 * (gGlobalStructure.unk_828 & 0x1F00))),0x2000);


    gGlobalStructure.unk_82A = 0x1000;
    gGlobalStructure.unk_000 = 0;
    gGlobalStructure.unk_85C++;
    gGlobalStructure.unk_85E = 0;
    sub_2019468();
    sub_2019498(0xc,0x80,0x50,0);
    CpuFastCopy((void*)0x201866D, (void*)0x3000cd0, 0x160);
    sub_2018FB8();
    nullsub_14();
}

void sub_2018CCC(u32 arg0, u32 arg1){
    g03000E50.unk8 = arg1;
    g03000E50.unk0 = arg0;
    g03000E50.unk26 = 1;
}

void sub_2018CE0(){
    s32 arg = 0x2000000;
    REG_IME = 0;
    REG_DISPSTAT = 0;
    REG_IE = 0;
    REG_IF = 0xFFFF;
    REG_DISPCNT = DISPCNT_FORCED_BLANK;
    sub_02019A8C(arg);
}

NAKED void sub_2018D20(){
    asm_unified("\tpush {r4, lr}\n\
    \tbl sub_2019728\n\
    \tldr r0, _02018D44 @ =0x03000010\n\
    \tldr r1, _02018D48 @ =0x0000085E\n\
    \tadds r0, r0, r1\n\
    \tldrb r0, [r0]\n\
    \tlsls r0, r0, #0x18\n\
    \tasrs r0, r0, #0x18\n\
    \tcmp r0, #7\n\
    \tbls _02018D38\n\
    \tb _02018F08\n\
    \t_02018D38:\n\
    \tlsls r0, r0, #2\n\
    \tldr r1, _02018D4C @ =_02018D50\n\
    \tadds r0, r0, r1\n\
    \tldr r0, [r0]\n\
    \tmov pc, r0\n\
    \t.align 2, 0\n\
    \t_02018D44: .4byte 0x03000010\n\
    \t_02018D48: .4byte 0x0000085E\n\
    \t_02018D4C: .4byte _02018D50\n\
    \t_02018D50: @ jump table\n\
    \t.4byte _02018D70 @ case 0\n\
    \t.4byte _02018DA8 @ case 1\n\
    \t.4byte _02018E00 @ case 2\n\
    \t.4byte _02018E38 @ case 3\n\
    \t.4byte _02018F08 @ case 4\n\
    \t.4byte _02018EAC @ case 5\n\
    \t.4byte _02018F08 @ case 6\n\
    \t.4byte _02018EEC @ case 7\n\
    \t_02018D70:\n\
    \tldr r0, _02018D94 @ =0x03000E50\n\
    \tldr r1, [r0, #0x18]\n\
    \tldr r0, _02018D98 @ =0xFFFE0202\n\
    \tcmp r1, r0\n\
    \tbeq _02018D7C\n\
    \tb _02018F2E\n\
    \t_02018D7C:\n\
    \tmovs r0, #0x80\n\
    \tlsls r0, r0, #0x12\n\
    \tldr r1, _02018D9C @ =0x0000ACC0\n\
    \tbl sub_2018CCC\n\
    \tldr r0, _02018DA0 @ =0x03000010\n\
    \tldr r2, _02018DA4 @ =0x0000085E\n\
    \tadds r0, r0, r2\n\
    \tmovs r1, #1\n\
    \tstrb r1, [r0]\n\
    \tb _02018F2E\n\
    \t.align 2, 0\n\
    \t_02018D94: .4byte 0x03000E50\n\
    \t_02018D98: .4byte 0xFFFE0202\n\
    \t_02018D9C: .4byte 0x0000ACC0\n\
    \t_02018DA0: .4byte 0x03000010\n\
    \t_02018DA4: .4byte 0x0000085E\n\
    \t_02018DA8:\n\
    \tldr r0, _02018DC8 @ =0x03000E50\n\
    \tadds r1, r0, #0\n\
    \tadds r1, #0x25\n\
    \tldrb r1, [r1]\n\
    \tlsls r1, r1, #0x18\n\
    \tasrs r1, r1, #0x18\n\
    \tcmp r1, #0\n\
    \tbeq _02018DE4\n\
    \tcmp r1, #1\n\
    \tbne _02018DD4\n\
    \tldr r0, _02018DCC @ =0x03000010\n\
    \tldr r3, _02018DD0 @ =0x0000085E\n\
    \tadds r0, r0, r3\n\
    \tmovs r1, #2\n\
    \tstrb r1, [r0]\n\
    \tb _02018F2E\n\
    \t.align 2, 0\n\
    \t_02018DC8: .4byte 0x03000E50\n\
    \t_02018DCC: .4byte 0x03000010\n\
    \t_02018DD0: .4byte 0x0000085E\n\
    \t_02018DD4:\n\
    \tldr r0, _02018DDC @ =0x03000010\n\
    \tldr r4, _02018DE0 @ =0x0000085E\n\
    \tadds r0, r0, r4\n\
    \tb _02018E7E\n\
    \t.align 2, 0\n\
    \t_02018DDC: .4byte 0x03000010\n\
    \t_02018DE0: .4byte 0x0000085E\n\
    \t_02018DE4:\n\
    \tadds r0, #0x29\n\
    \tldrb r0, [r0]\n\
    \tcmp r0, #0\n\
    \tbeq _02018DEE\n\
    \tb _02018F2E\n\
    \t_02018DEE:\n\
    \tldr r0, _02018DF8 @ =0x03000010\n\
    \tldr r1, _02018DFC @ =0x0000085E\n\
    \tadds r0, r0, r1\n\
    \tb _02018E9A\n\
    \t.align 2, 0\n\
    \t_02018DF8: .4byte 0x03000010\n\
    \t_02018DFC: .4byte 0x0000085E\n\
    \t_02018E00:\n\
    \tldr r0, _02018E24 @ =0x03000E50\n\
    \tldr r1, [r0, #0x18]\n\
    \tldr r0, _02018E28 @ =0xFFFE0202\n\
    \tcmp r1, r0\n\
    \tbeq _02018E0C\n\
    \tb _02018F2E\n\
    \t_02018E0C:\n\
    \tldr r0, _02018E2C @ =0x030008C0\n\
    \tldr r0, [r0]\n\
    \tmovs r1, #0x88\n\
    \tlsls r1, r1, #5\n\
    \tbl sub_2018CCC\n\
    \tldr r0, _02018E30 @ =0x03000010\n\
    \tldr r2, _02018E34 @ =0x0000085E\n\
    \tadds r0, r0, r2\n\
    \tmovs r1, #3\n\
    \tstrb r1, [r0]\n\
    \tb _02018F2E\n\
    \t.align 2, 0\n\
    \t_02018E24: .4byte 0x03000E50\n\
    \t_02018E28: .4byte 0xFFFE0202\n\
    \t_02018E2C: .4byte 0x030008C0\n\
    \t_02018E30: .4byte 0x03000010\n\
    \t_02018E34: .4byte 0x0000085E\n\
    \t_02018E38:\n\
    \tldr r0, _02018E68 @ =0x03000E50\n\
    \tadds r1, r0, #0\n\
    \tadds r1, #0x25\n\
    \tldrb r1, [r1]\n\
    \tlsls r1, r1, #0x18\n\
    \tasrs r1, r1, #0x18\n\
    \tcmp r1, #0\n\
    \tbeq _02018E8C\n\
    \tcmp r1, #1\n\
    \tbne _02018E78\n\
    \tldr r1, _02018E6C @ =0x03000010\n\
    \tmovs r3, #0x84\n\
    \tlsls r3, r3, #4\n\
    \tadds r0, r1, r3\n\
    \tmovs r2, #0\n\
    \tstrh r2, [r0]\n\
    \tldr r4, _02018E70 @ =0x00000842\n\
    \tadds r0, r1, r4\n\
    \tstrh r2, [r0]\n\
    \tldr r0, _02018E74 @ =0x0000085E\n\
    \tadds r1, r1, r0\n\
    \tmovs r0, #5\n\
    \tstrb r0, [r1]\n\
    \tb _02018F2E\n\
    \t.align 2, 0\n\
    \t_02018E68: .4byte 0x03000E50\n\
    \t_02018E6C: .4byte 0x03000010\n\
    \t_02018E70: .4byte 0x00000842\n\
    \t_02018E74: .4byte 0x0000085E\n\
    \t_02018E78:\n\
    \tldr r0, _02018E84 @ =0x03000010\n\
    \tldr r1, _02018E88 @ =0x0000085E\n\
    \tadds r0, r0, r1\n\
    \t_02018E7E:\n\
    \tmovs r1, #4\n\
    \tstrb r1, [r0]\n\
    \tb _02018F2E\n\
    \t.align 2, 0\n\
    \t_02018E84: .4byte 0x03000010\n\
    \t_02018E88: .4byte 0x0000085E\n\
    \t_02018E8C:\n\
    \tadds r0, #0x29\n\
    \tldrb r0, [r0]\n\
    \tcmp r0, #0\n\
    \tbne _02018F2E\n\
    \tldr r0, _02018EA4 @ =0x03000010\n\
    \tldr r2, _02018EA8 @ =0x0000085E\n\
    \tadds r0, r0, r2\n\
    \t_02018E9A:\n\
    \tmovs r1, #4\n\
    \tstrb r1, [r0]\n\
    \tbl sub_20193C0\n\
    \tb _02018F2E\n\
    \t.align 2, 0\n\
    \t_02018EA4: .4byte 0x03000010\n\
    \t_02018EA8: .4byte 0x0000085E\n\
    \t_02018EAC:\n\
    \tldr r1, _02018EDC @ =0x04000208\n\
    \tldrh r0, [r1]\n\
    \tadds r3, r0, #0\n\
    \tmovs r0, #0\n\
    \tstrh r0, [r1]\n\
    \tldr r2, _02018EE0 @ =0x04000134\n\
    \tmovs r4, #0x80\n\
    \tlsls r4, r4, #8\n\
    \tadds r0, r4, #0\n\
    \tstrh r0, [r2]\n\
    \tstrh r3, [r1]\n\
    \tldr r4, _02018EE4 @ =0x03000010\n\
    \tadds r0, r4, #0\n\
    \tmovs r1, #0x80\n\
    \tmovs r2, #0x3f\n\
    \tmovs r3, #0\n\
    \tbl sub_2018808\n\
    \tldr r0, _02018EE8 @ =0x0000085E\n\
    \tadds r4, r4, r0\n\
    \tmovs r0, #7\n\
    \tstrb r0, [r4]\n\
    \tb _02018F2E\n\
    \t.align 2, 0\n\
    \t_02018EDC: .4byte 0x04000208\n\
    \t_02018EE0: .4byte 0x04000134\n\
    \t_02018EE4: .4byte 0x03000010\n\
    \t_02018EE8: .4byte 0x0000085E\n\
    \t_02018EEC:\n\
    \tldr r0, _02018F04 @ =0x03000010\n\
    \tmovs r1, #1\n\
    \tmovs r2, #1\n\
    \tbl sub_2018844\n\
    \tlsls r0, r0, #0x10\n\
    \tlsrs r0, r0, #0x10\n\
    \tcmp r0, #0x10\n\
    \tbne _02018F2E\n\
    \tbl sub_2018CE0\n\
    \tb _02018F2E\n\
    \t.align 2, 0\n\
    \t_02018F04: .4byte 0x03000010\n\
    \t_02018F08:\n\
    \tldr r0, _02018F34 @ =0x03000010\n\
    \tldr r1, _02018F38 @ =0x0000085E\n\
    \tadds r0, r0, r1\n\
    \tldrb r0, [r0]\n\
    \tlsls r0, r0, #0x18\n\
    \tasrs r0, r0, #0x18\n\
    \tcmp r0, #4\n\
    \tbne _02018F2E\n\
    \tldr r1, _02018F3C @ =0x04000208\n\
    \tldrh r0, [r1]\n\
    \tadds r3, r0, #0\n\
    \tmovs r0, #0\n\
    \tstrh r0, [r1]\n\
    \tldr r2, _02018F40 @ =0x04000134\n\
    \tmovs r4, #0x80\n\
    \tlsls r4, r4, #8\n\
    \tadds r0, r4, #0\n\
    \tstrh r0, [r2]\n\
    \tstrh r3, [r1]\n\
    \t_02018F2E:\n\
    \tpop {r4}\n\
    \tpop {r0}\n\
    \tbx r0\n\
    \t.align 2, 0\n\
    \t_02018F34: .4byte 0x03000010\n\
    \t_02018F38: .4byte 0x0000085E\n\
    \t_02018F3C: .4byte 0x04000208\n\
    \t_02018F40: .4byte 0x04000134\n");
}


int sub_2019428(char);

extern u32 g0201b0a8[];

void sub_2018F44(){
    while(TRUE){
        u16 pad[2];    
        sub_20189B0();
        sub_2018978();
    
       
        if(gGlobalStructure.unk_850 == 0){
            if(g0201b0a8[gGlobalStructure.unk_85C]  != 0){
                sub_02019A8C(g0201b0a8[gGlobalStructure.unk_85C]); 
            }
        }
        sub_2019428(1);
        gGlobalStructure.unk_85F = 0;
        sub_201892C();
    }
}

u32 sub_2018F9C(vu8* arg0){
    u8 ret[4];

    ret[0] = arg0[3];
    ret[1] = arg0[2];
    ret[2] = arg0[1];
    ret[3] = arg0[0];
    
    return *(u32*)ret;
} 


void sub_2018FB8(){
    u32 saveIME;
    u32 arg;
    u32 recv;

    saveIME =  REG_IME;
    REG_IME = 0;
    REG_RCNT = 0xC000;
    
    REG_JOYSTAT = 0;
    
    recv = REG_JOY_RECV;
    REG_JOY_TRANS = 0;

    REG_JOYCNT = 0x47;
    
    REG_IF = 0x80;
    REG_IF = 0x80;
     
    REG_IE |= 0x80;

    CpuFastFill(0, (void *)0x3000E50, 0x40);

    REG_IME = saveIME;
}

NAKED void sub_2019028(){
    asm_unified("\tpush {r4, r5, r6, r7, lr}\n\
    \tmov r7, r8\n\
    \tpush {r7}\n\
    \tsub sp, #8\n\
    \tldr r0, _02019060 @ =0x04000140\n\
    \tldrh r0, [r0]\n\
    \tmov r8, r0\n\
    \tmovs r0, #1\n\
    \tmov r1, r8\n\
    \tands r0, r1\n\
    \tldr r6, _02019064 @ =0x03000E50\n\
    \tcmp r0, #0\n\
    \tbeq _0201907C\n\
    \tadds r3, r6, #0\n\
    \tadds r3, #0x29\n\
    \tldrb r2, [r3]\n\
    \tcmp r2, #0\n\
    \tbne _02019074\n\
    \tldr r0, _02019068 @ =0x04000150\n\
    \tldr r0, [r0]\n\
    \tstr r0, [sp, #4]\n\
    \tldr r1, _0201906C @ =0x04000154\n\
    \tldr r0, _02019070 @ =0x0201B0B0\n\
    \tldr r0, [r0]\n\
    \tstr r0, [r1]\n\
    \tstrb r2, [r3]\n\
    \tb _0201907C\n\
    \t.align 2, 0\n\
    \t_02019060: .4byte 0x04000140\n\
    \t_02019064: .4byte 0x03000E50\n\
    \t_02019068: .4byte 0x04000150\n\
    \t_0201906C: .4byte 0x04000154\n\
    \t_02019070: .4byte 0x0201B0B0\n\
    \t_02019074:\n\
    \tmovs r0, #2\n\
    \tmov r1, r8\n\
    \torrs r1, r0\n\
    \tmov r8, r1\n\
    \t_0201907C:\n\
    \tmovs r7, #2\n\
    \tmov r0, r8\n\
    \tands r0, r7\n\
    \tcmp r0, #0\n\
    \tbne _02019088\n\
    \tb _0201939A\n\
    \t_02019088:\n\
    \tldr r0, _020190C4 @ =0x04000150\n\
    \tldr r0, [r0]\n\
    \tstr r0, [sp, #4]\n\
    \tadds r4, r6, #0\n\
    \tadds r5, r4, #0\n\
    \tadds r5, #0x29\n\
    \tldrb r2, [r5]\n\
    \tcmp r2, #1\n\
    \tbeq _0201909C\n\
    \tb _02019388\n\
    \t_0201909C:\n\
    \tldr r1, [r4, #0x18]\n\
    \tldr r0, _020190C8 @ =0xFFFE0105\n\
    \tcmp r1, r0\n\
    \tbeq _020190DC\n\
    \tcmp r1, r0\n\
    \tbhi _020190CC\n\
    \tsubs r0, #3\n\
    \tcmp r1, r0\n\
    \tbls _020190B0\n\
    \tb _0201933C\n\
    \t_020190B0:\n\
    \tsubs r0, #1\n\
    \tcmp r1, r0\n\
    \tbhs _020190B8\n\
    \tb _0201933C\n\
    \t_020190B8:\n\
    \tadds r0, r4, #0\n\
    \tldr r1, [r0, #8]\n\
    \tcmp r1, #0\n\
    \tbge _020190F4\n\
    \tadds r1, #3\n\
    \tb _020190F4\n\
    \t.align 2, 0\n\
    \t_020190C4: .4byte 0x04000150\n\
    \t_020190C8: .4byte 0xFFFE0105\n\
    \t_020190CC:\n\
    \tldr r0, _020190D8 @ =0xFFFE0202\n\
    \tcmp r1, r0\n\
    \tbne _020190D4\n\
    \tb _02019208\n\
    \t_020190D4:\n\
    \tb _0201933C\n\
    \t.align 2, 0\n\
    \t_020190D8: .4byte 0xFFFE0202\n\
    \t_020190DC:\n\
    \tldr r0, _020190EC @ =0x04000154\n\
    \tldr r1, _020190F0 @ =0xFFFE0206\n\
    \tstr r1, [r0]\n\
    \tmovs r0, #0\n\
    \tstrb r0, [r5]\n\
    \tstr r0, [r4, #0x18]\n\
    \tb _0201939A\n\
    \t.align 2, 0\n\
    \t_020190EC: .4byte 0x04000154\n\
    \t_020190F0: .4byte 0xFFFE0206\n\
    \t_020190F4:\n\
    \tasrs r1, r1, #2\n\
    \tldr r0, [r0, #4]\n\
    \tcmp r0, r1\n\
    \tble _02019162\n\
    \tldr r2, _02019138 @ =0x03000E50\n\
    \tadds r3, r2, #0\n\
    \tadds r3, #0x24\n\
    \tldrb r5, [r3]\n\
    \tmovs r4, #0\n\
    \tldrsb r4, [r3, r4]\n\
    \tcmp r4, #0\n\
    \tbeq _02019148\n\
    \tldr r0, _0201913C @ =0x04000158\n\
    \tldrh r1, [r0]\n\
    \tmovs r0, #8\n\
    \tands r0, r1\n\
    \tlsls r0, r0, #0x10\n\
    \tlsrs r1, r0, #0x10\n\
    \tcmp r1, #0\n\
    \tbeq _0201911E\n\
    \tb _0201939A\n\
    \t_0201911E:\n\
    \tldr r3, _02019140 @ =0xFFFE0209\n\
    \tcmp r4, #1\n\
    \tbne _02019126\n\
    \tsubs r3, #1\n\
    \t_02019126:\n\
    \tldr r0, _02019144 @ =0x04000154\n\
    \tstr r3, [r0]\n\
    \tadds r0, r2, #0\n\
    \tadds r0, #0x25\n\
    \tstrb r5, [r0]\n\
    \tadds r0, #4\n\
    \tstrb r1, [r0]\n\
    \tstr r1, [r2, #0x18]\n\
    \tb _0201939A\n\
    \t.align 2, 0\n\
    \t_02019138: .4byte 0x03000E50\n\
    \t_0201913C: .4byte 0x04000158\n\
    \t_02019140: .4byte 0xFFFE0209\n\
    \t_02019144: .4byte 0x04000154\n\
    \t_02019148:\n\
    \tldr r1, _02019158 @ =0xFFFE0106\n\
    \tldr r0, [sp, #4]\n\
    \tcmp r0, r1\n\
    \tbne _0201915C\n\
    \tmovs r0, #1\n\
    \tstrb r0, [r3]\n\
    \tb _0201939A\n\
    \t.align 2, 0\n\
    \t_02019158: .4byte 0xFFFE0106\n\
    \t_0201915C:\n\
    \tmovs r0, #2\n\
    \tstrb r0, [r3]\n\
    \tb _0201939A\n\
    \t_02019162:\n\
    \tadds r3, r6, #0\n\
    \tldr r2, [r3, #0xc]\n\
    \tcmp r2, #0\n\
    \tblt _020191D8\n\
    \tldr r0, _02019194 @ =0x04000158\n\
    \tldrh r1, [r0]\n\
    \tmovs r0, #8\n\
    \tands r0, r1\n\
    \tlsls r0, r0, #0x10\n\
    \tlsrs r5, r0, #0x10\n\
    \tcmp r5, #0\n\
    \tbeq _0201917C\n\
    \tb _0201939A\n\
    \t_0201917C:\n\
    \tldr r0, [r3, #8]\n\
    \tcmp r0, #0\n\
    \tbge _02019184\n\
    \tadds r0, #3\n\
    \t_02019184:\n\
    \tasrs r0, r0, #2\n\
    \tldr r4, [r3, #4]\n\
    \tcmp r4, r0\n\
    \tbne _0201919C\n\
    \tldr r0, _02019198 @ =0x04000154\n\
    \tldr r1, [r3, #0x20]\n\
    \tmvns r1, r1\n\
    \tb _020191CA\n\
    \t.align 2, 0\n\
    \t_02019194: .4byte 0x04000158\n\
    \t_02019198: .4byte 0x04000154\n\
    \t_0201919C:\n\
    \tmovs r0, #0xff\n\
    \tands r2, r0\n\
    \tcmp r2, #0xff\n\
    \tbne _020191B4\n\
    \tldr r1, _020191B0 @ =0x04000154\n\
    \tldr r0, [r3, #0x1c]\n\
    \tmvns r0, r0\n\
    \tstr r0, [r1]\n\
    \tstr r5, [r3, #0x1c]\n\
    \tb _020192EE\n\
    \t.align 2, 0\n\
    \t_020191B0: .4byte 0x04000154\n\
    \t_020191B4:\n\
    \tldr r1, [r3]\n\
    \tlsls r0, r4, #2\n\
    \tadds r0, r0, r1\n\
    \tldr r1, [r0]\n\
    \tldr r0, [r3, #0x1c]\n\
    \tadds r0, r0, r1\n\
    \tstr r0, [r3, #0x1c]\n\
    \tldr r0, [r3, #0x20]\n\
    \tadds r0, r0, r1\n\
    \tstr r0, [r3, #0x20]\n\
    \tldr r0, _020191D4 @ =0x04000154\n\
    \t_020191CA:\n\
    \tstr r1, [r0]\n\
    \tadds r0, r4, #1\n\
    \tstr r0, [r3, #4]\n\
    \tb _020192EE\n\
    \t.align 2, 0\n\
    \t_020191D4: .4byte 0x04000154\n\
    \t_020191D8:\n\
    \tadds r0, r6, #0\n\
    \tadds r0, #0x26\n\
    \tldrb r0, [r0]\n\
    \tcmp r0, #1\n\
    \tbeq _020191E4\n\
    \tb _0201932C\n\
    \t_020191E4:\n\
    \tldr r0, _020191FC @ =0x04000158\n\
    \tldrh r1, [r0]\n\
    \tmovs r0, #8\n\
    \tands r0, r1\n\
    \tlsls r0, r0, #0x10\n\
    \tlsrs r2, r0, #0x10\n\
    \tcmp r2, #0\n\
    \tbeq _020191F6\n\
    \tb _0201939A\n\
    \t_020191F6:\n\
    \tldr r1, _02019200 @ =0x04000154\n\
    \tldr r0, _02019204 @ =0xFFFE0204\n\
    \tb _0201931A\n\
    \t.align 2, 0\n\
    \t_020191FC: .4byte 0x04000158\n\
    \t_02019200: .4byte 0x04000154\n\
    \t_02019204: .4byte 0xFFFE0204\n\
    \t_02019208:\n\
    \tldr r1, [r4, #8]\n\
    \tcmp r1, #0\n\
    \tbge _02019210\n\
    \tadds r1, #3\n\
    \t_02019210:\n\
    \tasrs r1, r1, #2\n\
    \tldr r0, [r4, #4]\n\
    \tcmp r0, r1\n\
    \tble _02019274\n\
    \tldr r0, _02019240 @ =0x04000158\n\
    \tldrh r1, [r0]\n\
    \tmovs r0, #8\n\
    \tands r0, r1\n\
    \tcmp r0, #0\n\
    \tbeq _02019226\n\
    \tb _0201939A\n\
    \t_02019226:\n\
    \tldr r1, [r4, #0x20]\n\
    \tmovs r0, #1\n\
    \trsbs r0, r0, #0\n\
    \tcmp r1, r0\n\
    \tbne _0201924C\n\
    \tldr r0, _02019244 @ =0x04000154\n\
    \tldr r1, _02019248 @ =0xFFFE0208\n\
    \tstr r1, [r0]\n\
    \tadds r0, r4, #0\n\
    \tadds r0, #0x25\n\
    \tstrb r2, [r0]\n\
    \tb _02019258\n\
    \t.align 2, 0\n\
    \t_02019240: .4byte 0x04000158\n\
    \t_02019244: .4byte 0x04000154\n\
    \t_02019248: .4byte 0xFFFE0208\n\
    \t_0201924C:\n\
    \tldr r0, _02019268 @ =0x04000154\n\
    \tldr r1, _0201926C @ =0xFFFE0209\n\
    \tstr r1, [r0]\n\
    \tadds r0, r4, #0\n\
    \tadds r0, #0x25\n\
    \tstrb r7, [r0]\n\
    \t_02019258:\n\
    \tldr r1, _02019270 @ =0x03000E50\n\
    \tadds r2, r1, #0\n\
    \tadds r2, #0x29\n\
    \tmovs r0, #0\n\
    \tstrb r0, [r2]\n\
    \tstr r0, [r1, #0x18]\n\
    \tb _0201939A\n\
    \t.align 2, 0\n\
    \t_02019268: .4byte 0x04000154\n\
    \t_0201926C: .4byte 0xFFFE0209\n\
    \t_02019270: .4byte 0x03000E50\n\
    \t_02019274:\n\
    \tldr r0, [r4, #0xc]\n\
    \tmovs r5, #1\n\
    \trsbs r5, r5, #0\n\
    \tcmp r0, r5\n\
    \tble _020192FC\n\
    \tadd r0, sp, #4\n\
    \tbl sub_2018F9C\n\
    \tadds r3, r0, #0\n\
    \tldr r0, _020192B4 @ =0x04000158\n\
    \tldrh r1, [r0]\n\
    \tmovs r0, #8\n\
    \tands r0, r1\n\
    \tlsls r0, r0, #0x10\n\
    \tlsrs r1, r0, #0x10\n\
    \tcmp r1, #0\n\
    \tbeq _02019298\n\
    \tb _0201939A\n\
    \t_02019298:\n\
    \tldr r0, [r4, #8]\n\
    \tcmp r0, #0\n\
    \tbge _020192A0\n\
    \tadds r0, #3\n\
    \t_020192A0:\n\
    \tasrs r0, r0, #2\n\
    \tldr r2, [r4, #4]\n\
    \tcmp r2, r0\n\
    \tbne _020192B8\n\
    \tldr r1, [r4]\n\
    \tlsls r0, r2, #2\n\
    \tadds r0, r0, r1\n\
    \tldr r1, [sp, #4]\n\
    \tstr r1, [r0]\n\
    \tb _020192E2\n\
    \t.align 2, 0\n\
    \t_020192B4: .4byte 0x04000158\n\
    \t_020192B8:\n\
    \tldrb r0, [r4, #0xc]\n\
    \tcmp r0, #0xff\n\
    \tbne _020192D2\n\
    \tldr r0, [r4, #0x1c]\n\
    \tadds r0, r0, r3\n\
    \tstr r0, [r4, #0x1c]\n\
    \tcmp r0, r5\n\
    \tbeq _020192CE\n\
    \tadds r0, r4, #0\n\
    \tadds r0, #0x25\n\
    \tstrb r7, [r0]\n\
    \t_020192CE:\n\
    \tstr r1, [r4, #0x1c]\n\
    \tb _020192EE\n\
    \t_020192D2:\n\
    \tldr r1, [r4]\n\
    \tlsls r0, r2, #2\n\
    \tadds r0, r0, r1\n\
    \tldr r1, [sp, #4]\n\
    \tstr r1, [r0]\n\
    \tldr r0, [r4, #0x1c]\n\
    \tadds r0, r0, r3\n\
    \tstr r0, [r4, #0x1c]\n\
    \t_020192E2:\n\
    \tldr r0, [r4, #0x20]\n\
    \tadds r0, r0, r3\n\
    \tstr r0, [r4, #0x20]\n\
    \tldr r0, [r4, #4]\n\
    \tadds r0, #1\n\
    \tstr r0, [r4, #4]\n\
    \t_020192EE:\n\
    \tldr r1, _020192F8 @ =0x03000E50\n\
    \tldr r0, [r1, #0xc]\n\
    \tadds r0, #1\n\
    \tstr r0, [r1, #0xc]\n\
    \tb _0201939A\n\
    \t.align 2, 0\n\
    \t_020192F8: .4byte 0x03000E50\n\
    \t_020192FC:\n\
    \tadds r0, r6, #0\n\
    \tadds r0, #0x26\n\
    \tldrb r0, [r0]\n\
    \tcmp r0, #1\n\
    \tbne _0201932C\n\
    \tldr r0, _02019320 @ =0x04000158\n\
    \tldrh r1, [r0]\n\
    \tmovs r0, #8\n\
    \tands r0, r1\n\
    \tlsls r0, r0, #0x10\n\
    \tlsrs r2, r0, #0x10\n\
    \tcmp r2, #0\n\
    \tbne _0201939A\n\
    \tldr r1, _02019324 @ =0x04000154\n\
    \tldr r0, _02019328 @ =0xFFFE0104\n\
    \t_0201931A:\n\
    \tstr r0, [r1]\n\
    \tstr r2, [r6, #0xc]\n\
    \tb _0201939A\n\
    \t.align 2, 0\n\
    \t_02019320: .4byte 0x04000158\n\
    \t_02019324: .4byte 0x04000154\n\
    \t_02019328: .4byte 0xFFFE0104\n\
    \t_0201932C:\n\
    \tldr r1, _02019334 @ =0x04000154\n\
    \tldr r0, _02019338 @ =0xFFFE0205\n\
    \tstr r0, [r1]\n\
    \tb _0201939A\n\
    \t.align 2, 0\n\
    \t_02019334: .4byte 0x04000154\n\
    \t_02019338: .4byte 0xFFFE0205\n\
    \t_0201933C:\n\
    \tldr r4, _02019378 @ =0x03000E50\n\
    \tldr r1, [sp, #4]\n\
    \tstr r1, [r4, #0x18]\n\
    \tldr r0, _0201937C @ =0xFFFE0101\n\
    \tcmp r1, r0\n\
    \tblo _0201939A\n\
    \tadds r0, #1\n\
    \tcmp r1, r0\n\
    \tbls _02019354\n\
    \tldr r0, _02019380 @ =0xFFFE0202\n\
    \tcmp r1, r0\n\
    \tbne _0201939A\n\
    \t_02019354:\n\
    \tmovs r0, #0\n\
    \tstr r0, [sp]\n\
    \tldr r2, _02019384 @ =0x01000010\n\
    \tmov r0, sp\n\
    \tadds r1, r4, #0\n\
    \tbl CpuFastSet\n\
    \tmovs r0, #1\n\
    \trsbs r0, r0, #0\n\
    \tstr r0, [r4, #0xc]\n\
    \tldr r0, [sp, #4]\n\
    \tstr r0, [r4, #0x18]\n\
    \tadds r1, r4, #0\n\
    \tadds r1, #0x29\n\
    \tmovs r0, #1\n\
    \tstrb r0, [r1]\n\
    \tb _0201939A\n\
    \t.align 2, 0\n\
    \t_02019378: .4byte 0x03000E50\n\
    \t_0201937C: .4byte 0xFFFE0101\n\
    \t_02019380: .4byte 0xFFFE0202\n\
    \t_02019384: .4byte 0x01000010\n\
    \t_02019388:\n\
    \tadd r0, sp, #4\n\
    \tbl sub_2018F9C\n\
    \tldr r1, _020193B4 @ =0x0201B0B8\n\
    \tldr r1, [r1]\n\
    \tcmp r0, r1\n\
    \tbne _0201939A\n\
    \tmovs r0, #1\n\
    \tstrb r0, [r5]\n\
    \t_0201939A:\n\
    \tldr r0, _020193B8 @ =0x04000140\n\
    \tmov r1, r8\n\
    \tstrh r1, [r0]\n\
    \tldr r0, _020193BC @ =0x03000E50\n\
    \tadds r0, #0x2a\n\
    \tmovs r1, #0\n\
    \tstrb r1, [r0]\n\
    \tadd sp, #8\n\
    \tpop {r3}\n\
    \tmov r8, r3\n\
    \tpop {r4, r5, r6, r7}\n\
    \tpop {r0}\n\
    \tbx r0\n\
    \t.align 2, 0\n\
    \t_020193B4: .4byte 0x0201B0B8\n\
    \t_020193B8: .4byte 0x04000140\n\
    \t_020193BC: .4byte 0x03000E50");
}

void sub_20193C0(void) {
    u32 saveIME;
    u32 arg;
    u32 recv;

    saveIME =  REG_IME;
    REG_IME = 0;
    
    REG_RCNT = 0x8000;
    REG_RCNT = 0xC000;
    
    REG_JOYSTAT = 0;
    
    recv = REG_JOY_RECV;
    REG_JOY_TRANS = 0;

    REG_JOYCNT = 0x47;
    
    REG_IF = 0x80;

    CpuFastFill(0, (void *)0x3000E50, 0x40);

    REG_IME = saveIME;
}

int sub_2019428(char arg0) {
    
    int ret = FALSE; 
    
    if(g03000E50.unk2A < 11){
        REG_IME = 0;
        g03000E50.unk2A++;
        REG_IME = 1;
    }
    else if(arg0 != 0){
        sub_20193C0();
        ret = TRUE;
    }
    else{
        ret = TRUE;
    }

    return ret;
}

void sub_2019468(void) {
    CpuFastFill(0, (void*)0x03000E90, 1155);
}

