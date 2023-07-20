#include "global.h"


void sub_2018428();
void sub_2018F44();
void sub_2019A84(void *, u32, u32);
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


#ifdef NONMATCHING

void sub_2018348(u8 *ip, u8 *r8, u8 flag)
{
    u64 storage[1];
    struct UNK_A_02019DEC *storage2;
    u8 p5;
    u8 *r5_a_02019e6c;
    u8 sp0_stk[0x10];
    u8 *r6_a_201adec;
    u8 *r1_a_02019dec;
    u8 *sp0;
    u8 *r3_pap;
    u32 idx;
    int i;

    //memcpy(sp0, ip, sizeof(sp0));
    ((u64 *)sp0_stk)[0] = ((u64 *)ip)[0];
    ((u64 *)sp0_stk)[1] = ((u64 *)r8)[0];

    if (flag == 0x80 || flag == 0x7F || flag == 0xCD)
    {
        ((u64 *)(ip))[0] = 0;
        *storage = 0;
    }
    else
    {
        idx = ((flag >> 4)*0x20 + (flag & 0xF)); // no me gusta
        idx *= 8;
        storage2 = a_02019dec;
        sp0 = sp0_stk;
        r6_a_201adec = a_0201adec;
        r3_pap = &sp0_stk[8];
        r5_a_02019e6c = &storage2[1].unk0[idx];
        r1_a_02019dec = &storage2[0].unk0[idx];
        //r5_a_02019e6c = (u8 *)(((u32)storage2[1].unk0) + idx);
        //r1_a_02019dec = (u8 *)(((u32)storage2[0].unk0) + idx);
        
        for (i = 7; i >= 0; i--)
        {
            if (flag != 0x20) 
            {
                *r3_pap = *r1_a_02019dec;
                p5 = *r5_a_02019e6c;
            }
            else
            {
                *r3_pap = *r6_a_201adec;
                p5 = *r6_a_201adec;
            }
            *sp0 = p5;
            sp0++;
            r6_a_201adec++;
            r3_pap++;
            r5_a_02019e6c++;
            r1_a_02019dec++;
        } // r12 is p1
        ((u64 *)ip)[0] = ((u64 *)sp0_stk)[0];
        *storage = ((u64 *)sp0_stk)[1];
    }
    ((u64 *)r8)[0] = *storage;
}

#else

NAKED
void sub_2018348(u8 *ip, u8 *r8, u8 flag)
{

    asm_unified(
"\tpush {r4, r5, r6, r7, lr}\n"
"\tmov r7, r8\n"
"\tpush {r7}\n"
"\tsub sp, #0x10\n"
"\tmov ip, r0\n"
"\tmov r8, r1\n"
"\tlsls r2, r2, #0x18\n"
"\tldr r1, [r0, #4]\n"
"\tldr r0, [r0]\n"
"\tstr r0, [sp]\n"
"\tstr r1, [sp, #4]\n"
"\tmov r3, r8\n"
"\tldr r0, [r3]\n"
"\tldr r1, [r3, #4]\n"
"\tstr r0, [sp, #8]\n"
"\tstr r1, [sp, #0xc]\n"
"\tlsrs r7, r2, #0x18\n"
"\tmovs r1, #0x81\n"
"\tlsls r1, r1, #0x18\n"
"\tadds r0, r2, r1\n"
"\tlsrs r0, r0, #0x18\n"
"\tcmp r0, #1\n"
"\tbls _0201837A\n"
"\tcmp r7, #0xcd\n"
"\tbne _02018386\n"
"_0201837A:\n"
"\tmovs r0, #0\n"
"\tmovs r1, #0\n"
"\tmov r2, ip\n"
"\tstr r0, [r2]\n"
"\tstr r1, [r2, #4]\n"
"\tb _020183DE\n"
"_02018386:\n"
"\tlsrs r1, r2, #0x1c\n"
"\tlsls r1, r1, #5\n"
"\tmovs r0, #0xf\n"
"\tands r0, r7\n"
"\tadds r1, r1, r0\n"
"\tlsls r1, r1, #3\n"
"\tldr r2, _020183B0 @ =0x02019DEC\n"
"\tmov r4, sp\n"
"\tldr r6, _020183B4 @ =0x0201ADEC\n"
"\tadd r3, sp, #8\n"
"\tadds r0, r2, #0\n"
"\tadds r0, #0x80\n"
"\tadds r5, r1, r0\n"
"\tadds r1, r1, r2\n"
"\tmovs r2, #7\n"
"_020183A4:\n"
"\tcmp r7, #0x20\n"
"\tbeq _020183B8\n"
"\tldrb r0, [r1]\n"
"\tstrb r0, [r3]\n"
"\tldrb r0, [r5]\n"
"\tb _020183BE\n"
"\t.align 2, 0\n"
"_020183B0: .4byte 0x02019DEC\n"
"_020183B4: .4byte 0x0201ADEC\n"
"_020183B8:\n"
"\tldrb r0, [r6]\n"
"\tstrb r0, [r3]\n"
"\tldrb r0, [r6, #8]\n"
"_020183BE:\n"
"\tstrb r0, [r4]\n"
"\tadds r4, #1\n"
"\tadds r6, #1\n"
"\tadds r3, #1\n"
"\tadds r5, #1\n"
"\tadds r1, #1\n"
"\tsubs r2, #1\n"
"\tcmp r2, #0\n"
"\tbge _020183A4\n"
"\tldr r0, [sp]\n"
"\tldr r1, [sp, #4]\n"
"\tmov r2, ip\n"
"\tstr r0, [r2]\n"
"\tstr r1, [r2, #4]\n"
"\tldr r0, [sp, #8]\n"
"\tldr r1, [sp, #0xc]\n"
"_020183DE:\n"
"\tmov r3, r8\n"
"\tstr r0, [r3]\n"
"\tstr r1, [r3, #4]\n"
"\tadd sp, #0x10\n"
"\tpop {r3}\n"
"\tmov r8, r3\n"
"\tpop {r4, r5, r6, r7}\n"
"\tpop {r0}\n"
"\tbx r0\n"
    );
}

#endif
