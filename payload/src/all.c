#include "global.h"


void sub_2018428();
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


//void sub_2018428(void)
//{
//    u32 work;
//    u32 *reg_ptrs = REG_DMA3SAD;
//
//    sub_2019A88(0xC0);
//    work = DMA_DEST_INC;
//    reg_ptrs[0] = (u32)&work;
//    reg_ptrs[1] = 0x03000000;
//}
