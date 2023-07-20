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

#ifdef NONMATCHING
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
    REG_IF = gGlobalStructure.unk_814 = 1; // it's literally just this line
    REG_DISPSTAT = 8;
    nullsub_2();
}
#else
NAKED
void sub_2018220(void)
{
	asm_unified("\tpush {r4, r5, r6, lr}\n"
    "\tldr r0, _0201831C @ =0x03000010\n"
    "\tldr r1, _02018320 @ =0x0000085F\n"
    "\tadds r6, r0, r1\n"
    "\tldrb r5, [r6]\n"
    "\tadds r4, r0, #0\n"
    "\tcmp r5, #0\n"
    "\tbne _020182FA\n"
    "\tldr r0, _02018324 @ =0x030008D0\n"
    "\tmovs r1, #0xe0\n"
    "\tlsls r1, r1, #0x13 // 0x07000000\n"
    "\tmovs r2, #0x80\n"
    "\tlsls r2, r2, #1 // 0x100\n"
    "\tbl sub_2019A84\n"
    "\tmovs r1, #0x80\n"
    "\tlsls r1, r1, #0x13\n"
    "\tldr r2, _02018328 @ =0x0000082A\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #0x10 // REG_BG0HOFS\n"
    "\tadds r2, #0x12\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #2 // REG_BG0VOFS\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #2 // REG_BG1HOFS\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #2 // REG_BG1VOFS\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #2 // REG_BG2HOFS\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #2 // REG_BG2VOFS\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #2 // REG_BG3HOFS\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #2 // REG_BG3VOFS\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #0x34 // REG_BLDALPHA\n"
    "\tsubs r2, #0x2e\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #2 // REG_BLDY\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tsubs r1, #4 // REG_BLDCNT\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tsubs r1, #0x48 // REG_BG0CNT\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #2 // REG_BG1CNT\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #2 // REG_BG2CNT\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tadds r1, #2 // REG_BG3CNT\n"
    "\tadds r2, #2\n"
    "\tadds r0, r4, r2\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r1]\n"
    "\tldr r0, _0201832C @ =0x00000859\n"
    "\tadds r1, r4, r0\n"
    "\tldrb r0, [r1]\n"
    "\tcmp r0, #1\n"
    "\tbne _020182EC\n"
    "\tstrb r5, [r1]\n"
    "_020182EC:\n"
    "\tldr r1, _02018330 @ =0x0000085B\n"
    "\tadds r0, r4, r1\n"
    "\tldrb r1, [r0]\n"
    "\tadds r1, #1\n"
    "\tstrb r1, [r0]\n"
    "\tmovs r0, #1\n"
    "\tstrb r0, [r6]\n"
    "_020182FA:\n"
    "\tldr r2, _02018334 @ =0x04000202\n"
    "\tldr r1, _02018338 @ =0x00000814\n"
    "\tadds r0, r4, r1\n"
    "\tldrh r1, [r0]\n"
    "\tmovs r1, #1\n"
    "\tstrh r1, [r0]\n"
    "\tldrh r0, [r0]\n"
    "\tstrh r0, [r2]\n"
    "\tldr r1, _0201833C @ =0x04000004\n"
    "\tmovs r0, #8\n"
    "\tstrh r0, [r1]\n"
    "\tbl nullsub_2\n"
    "\tpop {r4, r5, r6}\n"
    "\tpop {r0}\n"
    "\tbx r0\n"
    "\t.align 2, 0\n"
    "_0201831C: .4byte 0x03000010\n"
    "_02018320: .4byte 0x0000085F\n"
    "_02018324: .4byte 0x030008D0\n"
    "_02018328: .4byte 0x0000082A\n"
    "_0201832C: .4byte 0x00000859\n"
    "_02018330: .4byte 0x0000085B\n"
    "_02018334: .4byte 0x04000202\n"
    "_02018338: .4byte 0x00000814\n"
    "_0201833C: .4byte 0x04000004\n"
    );
}
#endif


void nullsub_3(void) {}


void nullsub_4(void) {}
