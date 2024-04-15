#include "global.h"


void sub_2018348(u64 *ip, u64 *r8, u8 flag);
s32 sub_20183F0(u32 index);
void sub_2018428();
void sub_201856C(u32 a0, u32 a1, u16 r6, u16 a3, u16 sp14, u8 sp18, u32 sp1C);
void sub_201866C(unk_struct_03000E30 *, u32);
void sub_2018F44();
void sub_2019A84(void *, u32, u32);
void sub_2019A88(u32);
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
        sub_2019A84(&gUnk_30008D0, 0x07000000, 0x100);
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
        r5_a_02019e6c = &({storage2[1].unk0;})[idx];
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
        if (r3_pap) {r3_pap++; r3_pap--;} // this solves a regswap
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

s32 sub_20184B8(u32 spC, u16 *r9, u16 r2, u16 r8, u8 *sp3C, int sp40, u8 sp10, u8 sp14, u8 sp18)
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
        sub_201856C(spC + v13, v17, v14, r8, v15, sp10, v16 - 1);
        *r9 += v16;
        ++v12;
    }
    return v12;
}

// sp14 needs to be casted down to u8 or else regswap in sub_20184B8
void sub_201856C(u32 a0, u32 a1, u16 r6, u16 a3, u16 sp14, u8 sp18, u32 sp1C)
{
    gUnk_3000E30.unk0 = a0;
    gUnk_3000E30.unk4 = a1;
    gUnk_3000E30.unk6 = r6;
    gUnk_3000E30.unk8 = a3;
    gUnk_3000E30.unkE = sp18;
    sub_2018348(&gUnk_3000E30.unk10, &gUnk_3000E30.unk18, sp14);
    sub_201866C(&gUnk_3000E30, sp1C);
}
