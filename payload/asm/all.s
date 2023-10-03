	.include "../asm/macros/function.inc"
	.include "../constants/gba_constants.inc"
	.text
	.syntax unified

	thumb_func_start sub_20184B8
sub_20184B8: @ 0x020184B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	mov sb, r1
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x48]
	ldr r4, [sp, #0x4c]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x18]
	movs r6, #0
	lsrs r0, r2, #0x13
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	lsls r0, r0, #5
	mov sl, r0
	movs r7, #0xe0
	lsls r7, r7, #0xb
	ands r7, r2
	b _02018520
_020184FE:
	str r4, [sp]
	ldr r3, [sp, #0x10]
	str r3, [sp, #4]
	subs r0, r5, #1
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	add r0, sl
	adds r1, r2, #0
	lsrs r2, r7, #0x10
	mov r3, r8
	bl sub_201856C
	mov r1, sb
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
	adds r6, #1
_02018520:
	ldr r3, [sp, #0x40]
	cmp r6, r3
	bge _0201855A
	ldr r1, [sp, #0x3c]
	adds r0, r1, r6
	ldrb r4, [r0]
	ldr r3, [sp, #0x14]
	cmp r3, #1
	bne _02018536
	cmp r4, #0xcd
	beq _0201855A
_02018536:
	cmp r4, #0x7f
	beq _0201855A
	ldr r0, [sp, #0x18]
	cmp r0, #1
	beq _0201854A
	adds r0, r4, #0
	bl sub_20183F0
	adds r5, r0, #0
	b _0201854C
_0201854A:
	movs r5, #8
_0201854C:
	mov r1, sb
	ldrh r2, [r1]
	adds r1, r5, r2
	mov r3, r8
	lsls r0, r3, #3
	cmp r1, r0
	ble _020184FE
_0201855A:
	adds r0, r6, #0
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_201856C
sub_201856C: @ 0x0201856C
	push {r4, r5, r6, r7, lr}
	adds r6, r2, #0
	ldr r2, [sp, #0x14]
	ldr r5, [sp, #0x18]
	ldr r7, [sp, #0x1c]
	ldr r4, _020185A0 @ =0x03000E30
	str r0, [r4]
	strh r1, [r4, #4]
	strh r6, [r4, #6]
	strh r3, [r4, #8]
	strb r5, [r4, #0xe]
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r4, #0
	adds r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl sub_2018348
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_201866C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020185A0: .4byte 0x03000E30

	thumb_func_start sub_20185A4
sub_20185A4: @ 0x020185A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r1, sp
	ldr r0, _020185F4 @ =0x0201ADFC
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	add r5, sp, #0xc
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xc
	bl sub_2019B60
	add r3, sp, #0x18
	adds r1, r3, #0
	ldr r0, _020185F8 @ =0x0201AE08
	ldm r0!, {r2, r6, r7}
	stm r1!, {r2, r6, r7}
	lsls r4, r4, #0x18
	asrs r2, r4, #0x18
	cmp r2, #0
	blt _020185EC
	lsls r2, r2, #2
	adds r0, r5, r2
	ldr r0, [r0]
	mov r4, sp
	adds r1, r4, r2
	ldr r1, [r1]
	adds r2, r3, r2
	ldr r2, [r2]
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl sub_2019A84
_020185EC:
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020185F4: .4byte 0x0201ADFC
_020185F8: .4byte 0x0201AE08

	thumb_func_start sub_20185FC
sub_20185FC: @ 0x020185FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, sp
	movs r1, #0
	movs r2, #0xc
	bl sub_2019B60
	add r2, sp, #0xc
	adds r1, r2, #0
	ldr r0, _02018668 @ =0x0201AE14
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	lsls r0, r4, #0x18
	mov ip, r2
	cmp r0, #0
	blt _0201865E
	movs r4, #0
	movs r3, #0
	adds r5, r0, #0
	add r7, sp, #0x18
	movs r2, #0xf
	ands r2, r6
_02018632:
	lsls r1, r3, #2
	adds r0, r2, #0
	lsls r0, r1
	orrs r4, r0
	adds r3, #1
	cmp r3, #7
	ble _02018632
	str r4, [sp, #0x18]
	asrs r0, r5, #0x16
	mov r2, sp
	adds r1, r2, r0
	ldr r1, [r1]
	add r0, ip
	ldr r2, [r0]
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	adds r0, r7, #0
	bl sub_2019A84
_0201865E:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02018668: .4byte 0x0201AE14

	thumb_func_start sub_201866C
sub_201866C: @ 0x0201866C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r3, r0, #0
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldrh r1, [r3, #6]
	mov sb, r1
_02018684:
	movs r2, #0
	mov r8, r2
	ldrh r7, [r3, #4]
	ldr r5, [sp, #4]
	adds r5, #1
	str r5, [sp, #8]
	mov r0, sb
	adds r0, #1
	str r0, [sp, #0xc]
	ldr r1, [sp]
	cmp r8, r1
	bge _02018784
	mov r0, sb
	movs r2, #7
	ands r0, r2
	lsls r0, r0, #2
	mov sl, r0
	movs r5, #0xf
	mov ip, r5
_020186AA:
	mov r0, sb
	lsrs r1, r0, #3
	ldrh r0, [r3, #8]
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r2, #0
	lsrs r1, r7, #3
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x18
	ldr r5, [sp, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	mov r1, r8
	asrs r0, r1
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	beq _02018716
	lsls r1, r6, #5
	add r1, sl
	adds r0, r7, #0
	movs r5, #7
	ands r0, r5
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r1, [r3]
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r2, r0, #0
	adds r0, r7, #0
	movs r5, #1
	ands r0, r5
	adds r5, r1, #0
	cmp r0, #0
	beq _02018706
	mov r0, ip
	ands r2, r0
	ldrb r1, [r3, #0xe]
	ands r0, r1
	lsls r0, r0, #4
	b _02018710
_02018706:
	movs r0, #0xf0
	ands r2, r0
	ldrb r1, [r3, #0xe]
	mov r0, ip
	ands r0, r1
_02018710:
	orrs r2, r0
	adds r0, r5, r4
	strb r2, [r0]
_02018716:
	ldrh r0, [r3, #8]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x10
	ldr r1, [sp, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r2, r8
	asrs r0, r2
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	beq _02018774
	lsls r1, r6, #5
	add r1, sl
	adds r0, r7, #0
	movs r2, #7
	ands r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r1, [r3]
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r2, r0, #0
	adds r0, r7, #0
	ands r0, r5
	adds r5, r1, #0
	cmp r0, #0
	beq _02018764
	mov r0, ip
	ands r2, r0
	ldrb r1, [r3, #0xe]
	ands r0, r1
	lsls r0, r0, #4
	b _0201876E
_02018764:
	movs r0, #0xf0
	ands r2, r0
	ldrb r1, [r3, #0xe]
	mov r0, ip
	ands r0, r1
_0201876E:
	orrs r2, r0
	adds r0, r5, r4
	strb r2, [r0]
_02018774:
	movs r1, #1
	add r8, r1
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, [sp]
	cmp r8, r2
	blt _020186AA
_02018784:
	ldr r5, [sp, #8]
	str r5, [sp, #4]
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r5, #7
	bgt _02018796
	b _02018684
_02018796:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_20187A8
sub_20187A8: @ 0x020187A8
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _020187BA
	adds r0, #0xff
_020187BA:
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_20187C4
sub_20187C4: @ 0x020187C4
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_2019AC8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_20187DC
sub_20187DC: @ 0x020187DC
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	ldr r0, _020187F8 @ =0x41C64E6D
	muls r0, r1, r0
	ldr r3, _020187FC @ =0x0000085B
	adds r1, r2, r3
	ldrb r1, [r1]
	ldr r3, _02018800 @ =0x00003039
	adds r1, r1, r3
	adds r0, r0, r1
	str r0, [r2, #0xc]
	lsls r0, r0, #1
	lsrs r0, r0, #0x11
	bx lr
	.align 2, 0
_020187F8: .4byte 0x41C64E6D
_020187FC: .4byte 0x0000085B
_02018800: .4byte 0x00003039

	thumb_func_start sub_2018804
sub_2018804: @ 0x02018804
	str r1, [r0, #0xc]
	bx lr

	thumb_func_start sub_2018808
sub_2018808: @ 0x02018808
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	cmp r1, #1
	bne _02018820
	movs r0, #0xc0
	b _02018822
_02018820:
	movs r0, #0x80
_02018822:
	movs r1, #0x82
	lsls r1, r1, #4
	adds r2, r5, r1
	adds r1, r4, #0
	orrs r1, r0
	strh r1, [r2]
	cmp r3, #0x10
	bls _02018834
	movs r3, #0x10
_02018834:
	ldr r1, _02018840 @ =0x0000081E
	adds r0, r5, r1
	strh r3, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02018840: .4byte 0x0000081E

	thumb_func_start sub_2018844
sub_2018844: @ 0x02018844
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r4, r2, #0
	ldr r3, _0201886C @ =0x0000081E
	adds r0, r5, r3
	ldrh r3, [r0]
	cmp r1, #1
	bne _02018870
	adds r0, r3, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _02018880
	movs r3, #0x10
	b _02018880
	.align 2, 0
_0201886C: .4byte 0x0000081E
_02018870:
	cmp r1, #0
	bne _02018880
	subs r0, r3, r4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r0, #0
	bge _02018880
	movs r3, #0
_02018880:
	ldr r1, _02018890 @ =0x0000081E
	adds r0, r5, r1
	strh r3, [r0]
	ldrh r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_02018890: .4byte 0x0000081E

	thumb_func_start sub_2018894
sub_2018894: @ 0x02018894
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r5, [sp, #0x14]
	movs r4, #0xf
	ands r2, r4
	ands r4, r1
	lsls r4, r4, #4
	adds r4, r4, r2
	lsls r4, r4, #1
	adds r4, r4, r0
	ldrh r1, [r4]
	lsrs r0, r1, #0xa
	movs r4, #0x1f
	movs r2, #0x1f
	ands r0, r2
	strb r0, [r5]
	lsrs r0, r1, #5
	ands r0, r2
	strb r0, [r6]
	ands r1, r4
	strb r1, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_20188C4
sub_20188C4: @ 0x020188C4
	push {r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x14]
	ldr r5, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r1, r5, #0x18
	ldr r5, _0201891C @ =0x02038000
	cmp r0, #1
	bne _020188EA
	ldr r5, _02018920 @ =0x02038200
_020188EA:
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #0xa
	ands r4, r2
	lsls r0, r4, #5
	orrs r1, r0
	ands r3, r2
	orrs r3, r1
	movs r0, #0xf
	ands r6, r0
	ands r7, r0
	lsls r0, r6, #4
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r5
	strh r3, [r0]
	ldr r0, _02018924 @ =0x03000010
	ldr r1, _02018928 @ =0x00000852
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0201891C: .4byte 0x02038000
_02018920: .4byte 0x02038200
_02018924: .4byte 0x03000010
_02018928: .4byte 0x00000852

	thumb_func_start sub_201892C
sub_201892C: @ 0x0201892C
	push {r4, lr}
	ldr r2, _0201896C @ =0x03000010
	ldr r0, _02018970 @ =0x00000814
	adds r3, r2, r0
	ldrh r1, [r3]
	ldr r0, _02018974 @ =0x0000FFFE
	ands r0, r1
	ldrh r1, [r3]
	strh r0, [r3]
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _02018958
	adds r2, r3, #0
	movs r3, #1
_0201894E:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0201894E
_02018958:
	ldr r0, _02018970 @ =0x00000814
	adds r1, r4, r0
	ldrh r2, [r1]
	ldr r0, _02018974 @ =0x0000FFFE
	ands r0, r2
	ldrh r2, [r1]
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0201896C: .4byte 0x03000010
_02018970: .4byte 0x00000814
_02018974: .4byte 0x0000FFFE

	thumb_func_start sub_2018978
sub_2018978: @ 0x02018978
	push {r4, r5, lr}
	ldr r1, _020189A4 @ =0x030008D0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r1, r0
	ldr r5, _020189A8 @ =0x03000010
	cmp r1, r4
	bhs _02018994
	ldr r0, _020189AC @ =0x0201B0A0
	ldr r2, [r0]
	ldr r3, [r0, #4]
_0201898E:
	stm r1!, {r2, r3}
	cmp r1, r4
	blo _0201898E
_02018994:
	movs r0, #0x86
	lsls r0, r0, #4
	adds r1, r5, r0
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020189A4: .4byte 0x030008D0
_020189A8: .4byte 0x03000010
_020189AC: .4byte 0x0201B0A0

	thumb_func_start sub_20189B0
sub_20189B0: @ 0x020189B0
	push {r4, lr}
	ldr r0, _020189D8 @ =0x04000130
	ldrh r0, [r0]
	ldr r1, _020189DC @ =0x000003FF
	adds r2, r1, #0
	eors r2, r0
	ldr r1, _020189E0 @ =0x03000010
	ldr r3, _020189E4 @ =0x00000818
	adds r4, r1, r3
	ldrh r3, [r4]
	adds r0, r2, #0
	bics r0, r3
	ldr r3, _020189E8 @ =0x0000081A
	adds r1, r1, r3
	strh r0, [r1]
	strh r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020189D8: .4byte 0x04000130
_020189DC: .4byte 0x000003FF
_020189E0: .4byte 0x03000010
_020189E4: .4byte 0x00000818
_020189E8: .4byte 0x0000081A

	thumb_func_start sub_20189EC
sub_20189EC: @ 0x020189EC
	ldr r2, _02018A10 @ =0x04000208
	movs r0, #0
	strh r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0x80
	strh r0, [r1]
	adds r1, #4
	movs r0, #8
	strh r0, [r1]
	ldr r1, _02018A14 @ =0x04000200
	movs r0, #1
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	strh r0, [r2]
	bx lr
	.align 2, 0
_02018A10: .4byte 0x04000208
_02018A14: .4byte 0x04000200

	thumb_func_start nullsub_6
nullsub_6: @ 0x02018A18
	bx lr
	.align 2, 0

	thumb_func_start nullsub_7
nullsub_7: @ 0x02018A1C
	bx lr
	.align 2, 0

	thumb_func_start nullsub_2
nullsub_2: @ 0x02018A20
	bx lr
	.align 2, 0

	thumb_func_start nullsub_8
nullsub_8: @ 0x02018A24
	bx lr
	.align 2, 0

	thumb_func_start nullsub_9
nullsub_9: @ 0x02018A28
	bx lr
	.align 2, 0

	thumb_func_start nullsub_10
nullsub_10: @ 0x02018A2C
	bx lr
	.align 2, 0

	thumb_func_start nullsub_11
nullsub_11: @ 0x02018A30
	bx lr
	.align 2, 0

	thumb_func_start nullsub_12
nullsub_12: @ 0x02018A34
	bx lr
	.align 2, 0

	thumb_func_start nullsub_13
nullsub_13: @ 0x02018A38
	bx lr
	.align 2, 0

	thumb_func_start sub_2018A3C
sub_2018A3C: @ 0x02018A3C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	movs r2, #0
	cmp r3, #0
	ble _02018A62
	cmp r2, r3
	bge _02018A62
_02018A52:
	adds r1, r6, r2
	ldrb r0, [r1]
	cmp r0, r5
	bne _02018A5C
	strb r4, [r1]
_02018A5C:
	adds r2, #1
	cmp r2, r3
	blt _02018A52
_02018A62:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_2018A68
sub_2018A68: @ 0x02018A68
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	cmp r1, #0
	ble _02018A90
	adds r2, r1, #0
	adds r0, r3, r2
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x80
	bne _02018A90
	subs r0, r2, #1
	adds r1, r0, r3
_02018A82:
	subs r1, #1
	subs r2, #1
	cmp r2, #0
	ble _02018A90
	ldrb r0, [r1]
	cmp r0, #0x80
	beq _02018A82
_02018A90:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_2018A98
sub_2018A98: @ 0x02018A98
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r3, #0
	cmp r2, #0
	ble _02018AC2
	cmp r3, r2
	bge _02018AC2
	ldrb r0, [r5]
	ldrb r1, [r4]
	cmp r0, r1
	bne _02018AC2
_02018AB0:
	adds r3, #1
	cmp r3, r2
	bge _02018AC2
	adds r0, r5, r3
	adds r1, r4, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _02018AB0
_02018AC2:
	adds r1, r3, #0
	eors r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_2018AD4
sub_2018AD4: @ 0x02018AD4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	ble _02018AF2
	movs r3, #0
	cmp r3, r2
	bge _02018AF2
_02018AE4:
	adds r0, r4, r3
	adds r1, r5, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, r2
	blt _02018AE4
_02018AF2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_2018AF8
sub_2018AF8: @ 0x02018AF8
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r2, #0
	ble _02018B14
	movs r3, #0
	cmp r3, r2
	bge _02018B14
_02018B0A:
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, r2
	blt _02018B0A
_02018B14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_14
nullsub_14: @ 0x02018B1C
	bx lr
	.align 2, 0

	thumb_func_start sub_2018B20
sub_2018B20: @ 0x02018B20
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	bl sub_20189EC
	ldr r6, _02018C50 @ =0x03000010
	ldr r1, _02018C54 @ =0x0000085F
	adds r0, r6, r1
	movs r2, #0
	mov ip, r2
	movs r1, #1
	strb r1, [r0]
	ldr r3, _02018C58 @ =0x00000858
	adds r0, r6, r3
	strb r1, [r0]
	ldr r1, _02018C5C @ =0x030008C0
	ldr r0, _02018C60 @ =0x0203B000
	str r0, [r1]
	ldr r1, _02018C64 @ =0x040000D4
	ldr r0, _02018C68 @ =0x020213A4
	str r0, [r1]
	ldr r0, _02018C6C @ =0x06010000
	str r0, [r1, #4]
	ldr r2, _02018C70 @ =0x84002000
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _02018C74 @ =0x020293A4
	str r0, [r1]
	movs r4, #0xc0
	lsls r4, r4, #0x13
	mov sb, r4
	str r4, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _02018C78 @ =0x020313A4
	str r0, [r1]
	ldr r0, _02018C7C @ =0x02038200
	str r0, [r1, #4]
	ldr r2, _02018C80 @ =0x80000100
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _02018C84 @ =0x020315A4
	str r0, [r1]
	ldr r0, _02018C88 @ =0x02038000
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r2, [r1, #8]
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _02018C8C @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r5, _02018C90 @ =0x00000822
	adds r0, r6, r5
	movs r2, #0
	mov sl, r2
	movs r2, #0xdc
	lsls r2, r2, #8
	strh r2, [r0]
	subs r3, #0x34
	adds r0, r6, r3
	ldr r3, _02018C94 @ =0x0000D801
	strh r3, [r0]
	ldr r4, _02018C98 @ =0x00000826
	adds r0, r6, r4
	ldr r4, _02018C9C @ =0x0000D402
	strh r4, [r0]
	adds r5, #6
	adds r0, r6, r5
	ldr r5, _02018CA0 @ =0x0000D003
	strh r5, [r0]
	ldr r0, _02018CA4 @ =0x020317A4
	str r0, [r1]
	movs r0, #0xf8
	lsls r0, r0, #5
	mov r8, r0
	ands r2, r0
	lsls r2, r2, #3
	add r2, sb
	str r2, [r1, #4]
	ldr r2, _02018CA8 @ =0x84000800
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _02018CAC @ =0x0201B3A4
	str r0, [r1]
	mov r0, r8
	ands r3, r0
	lsls r3, r3, #3
	add r3, sb
	str r3, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _02018CB0 @ =0x0201D3A4
	str r0, [r1]
	mov r3, r8
	ands r4, r3
	lsls r4, r4, #3
	add r4, sb
	str r4, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _02018CB4 @ =0x0201F3A4
	str r0, [r1]
	ands r5, r3
	lsls r0, r5, #3
	add r0, sb
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r4, _02018CB8 @ =0x0000082A
	adds r0, r6, r4
	strh r5, [r0]
	mov r5, ip
	str r5, [r6]
	ldr r0, _02018CBC @ =0x0000085C
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _02018CC0 @ =0x0000085E
	adds r6, r6, r1
	mov r2, sl
	strb r2, [r6]
	bl sub_2019468
	movs r0, #0xc
	movs r1, #0x80
	movs r2, #0x50
	movs r3, #0
	bl sub_2019498
	ldr r0, _02018CC4 @ =sub_201866C
	ldr r1, _02018CC8 @ =0x03000CD0
	movs r2, #0x58
	bl sub_2019A84
	bl sub_2018FB8
	bl nullsub_14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02018C50: .4byte 0x03000010
_02018C54: .4byte 0x0000085F
_02018C58: .4byte 0x00000858
_02018C5C: .4byte 0x030008C0
_02018C60: .4byte 0x0203B000
_02018C64: .4byte 0x040000D4
_02018C68: .4byte 0x020213A4
_02018C6C: .4byte 0x06010000
_02018C70: .4byte 0x84002000
_02018C74: .4byte 0x020293A4
_02018C78: .4byte 0x020313A4
_02018C7C: .4byte 0x02038200
_02018C80: .4byte 0x80000100
_02018C84: .4byte 0x020315A4
_02018C88: .4byte 0x02038000
_02018C8C: .4byte 0x80000200
_02018C90: .4byte 0x00000822
_02018C94: .4byte 0x0000D801
_02018C98: .4byte 0x00000826
_02018C9C: .4byte 0x0000D402
_02018CA0: .4byte 0x0000D003
_02018CA4: .4byte 0x020317A4
_02018CA8: .4byte 0x84000800
_02018CAC: .4byte 0x0201B3A4
_02018CB0: .4byte 0x0201D3A4
_02018CB4: .4byte 0x0201F3A4
_02018CB8: .4byte 0x0000082A
_02018CBC: .4byte 0x0000085C
_02018CC0: .4byte 0x0000085E
_02018CC4: .4byte sub_201866C
_02018CC8: .4byte 0x03000CD0

	thumb_func_start sub_2018CCC
sub_2018CCC: @ 0x02018CCC
	ldr r2, _02018CDC @ =0x03000E50
	str r1, [r2, #8]
	str r0, [r2]
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_02018CDC: .4byte 0x03000E50

	thumb_func_start sub_2018CE0
sub_2018CE0: @ 0x02018CE0
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #0x12
	ldr r1, _02018D0C @ =0x04000208
	movs r2, #0
	strh r2, [r1]
	ldr r1, _02018D10 @ =0x04000004
	strh r2, [r1]
	ldr r1, _02018D14 @ =0x04000200
	strh r2, [r1]
	ldr r2, _02018D18 @ =0x04000202
	ldr r3, _02018D1C @ =0x0000FFFF
	adds r1, r3, #0
	strh r1, [r2]
	movs r2, #0x80
	lsls r2, r2, #0x13
	movs r1, #0x80
	strh r1, [r2]
	bl sub_02019A8C
	pop {r0}
	bx r0
	.align 2, 0
_02018D0C: .4byte 0x04000208
_02018D10: .4byte 0x04000004
_02018D14: .4byte 0x04000200
_02018D18: .4byte 0x04000202
_02018D1C: .4byte 0x0000FFFF

	thumb_func_start sub_2018D20
sub_2018D20: @ 0x02018D20
	push {r4, lr}
	bl sub_2019728
	ldr r0, _02018D44 @ =0x03000010
	ldr r1, _02018D48 @ =0x0000085E
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	bls _02018D38
	b _02018F08
_02018D38:
	lsls r0, r0, #2
	ldr r1, _02018D4C @ =_02018D50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02018D44: .4byte 0x03000010
_02018D48: .4byte 0x0000085E
_02018D4C: .4byte _02018D50
_02018D50: @ jump table
	.4byte _02018D70 @ case 0
	.4byte _02018DA8 @ case 1
	.4byte _02018E00 @ case 2
	.4byte _02018E38 @ case 3
	.4byte _02018F08 @ case 4
	.4byte _02018EAC @ case 5
	.4byte _02018F08 @ case 6
	.4byte _02018EEC @ case 7
_02018D70:
	ldr r0, _02018D94 @ =0x03000E50
	ldr r1, [r0, #0x18]
	ldr r0, _02018D98 @ =0xFFFE0202
	cmp r1, r0
	beq _02018D7C
	b _02018F2E
_02018D7C:
	movs r0, #0x80
	lsls r0, r0, #0x12
	ldr r1, _02018D9C @ =0x0000ACC0
	bl sub_2018CCC
	ldr r0, _02018DA0 @ =0x03000010
	ldr r2, _02018DA4 @ =0x0000085E
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	b _02018F2E
	.align 2, 0
_02018D94: .4byte 0x03000E50
_02018D98: .4byte 0xFFFE0202
_02018D9C: .4byte 0x0000ACC0
_02018DA0: .4byte 0x03000010
_02018DA4: .4byte 0x0000085E
_02018DA8:
	ldr r0, _02018DC8 @ =0x03000E50
	adds r1, r0, #0
	adds r1, #0x25
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #0
	beq _02018DE4
	cmp r1, #1
	bne _02018DD4
	ldr r0, _02018DCC @ =0x03000010
	ldr r3, _02018DD0 @ =0x0000085E
	adds r0, r0, r3
	movs r1, #2
	strb r1, [r0]
	b _02018F2E
	.align 2, 0
_02018DC8: .4byte 0x03000E50
_02018DCC: .4byte 0x03000010
_02018DD0: .4byte 0x0000085E
_02018DD4:
	ldr r0, _02018DDC @ =0x03000010
	ldr r4, _02018DE0 @ =0x0000085E
	adds r0, r0, r4
	b _02018E7E
	.align 2, 0
_02018DDC: .4byte 0x03000010
_02018DE0: .4byte 0x0000085E
_02018DE4:
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _02018DEE
	b _02018F2E
_02018DEE:
	ldr r0, _02018DF8 @ =0x03000010
	ldr r1, _02018DFC @ =0x0000085E
	adds r0, r0, r1
	b _02018E9A
	.align 2, 0
_02018DF8: .4byte 0x03000010
_02018DFC: .4byte 0x0000085E
_02018E00:
	ldr r0, _02018E24 @ =0x03000E50
	ldr r1, [r0, #0x18]
	ldr r0, _02018E28 @ =0xFFFE0202
	cmp r1, r0
	beq _02018E0C
	b _02018F2E
_02018E0C:
	ldr r0, _02018E2C @ =0x030008C0
	ldr r0, [r0]
	movs r1, #0x88
	lsls r1, r1, #5
	bl sub_2018CCC
	ldr r0, _02018E30 @ =0x03000010
	ldr r2, _02018E34 @ =0x0000085E
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0]
	b _02018F2E
	.align 2, 0
_02018E24: .4byte 0x03000E50
_02018E28: .4byte 0xFFFE0202
_02018E2C: .4byte 0x030008C0
_02018E30: .4byte 0x03000010
_02018E34: .4byte 0x0000085E
_02018E38:
	ldr r0, _02018E68 @ =0x03000E50
	adds r1, r0, #0
	adds r1, #0x25
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #0
	beq _02018E8C
	cmp r1, #1
	bne _02018E78
	ldr r1, _02018E6C @ =0x03000010
	movs r3, #0x84
	lsls r3, r3, #4
	adds r0, r1, r3
	movs r2, #0
	strh r2, [r0]
	ldr r4, _02018E70 @ =0x00000842
	adds r0, r1, r4
	strh r2, [r0]
	ldr r0, _02018E74 @ =0x0000085E
	adds r1, r1, r0
	movs r0, #5
	strb r0, [r1]
	b _02018F2E
	.align 2, 0
_02018E68: .4byte 0x03000E50
_02018E6C: .4byte 0x03000010
_02018E70: .4byte 0x00000842
_02018E74: .4byte 0x0000085E
_02018E78:
	ldr r0, _02018E84 @ =0x03000010
	ldr r1, _02018E88 @ =0x0000085E
	adds r0, r0, r1
_02018E7E:
	movs r1, #4
	strb r1, [r0]
	b _02018F2E
	.align 2, 0
_02018E84: .4byte 0x03000010
_02018E88: .4byte 0x0000085E
_02018E8C:
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _02018F2E
	ldr r0, _02018EA4 @ =0x03000010
	ldr r2, _02018EA8 @ =0x0000085E
	adds r0, r0, r2
_02018E9A:
	movs r1, #4
	strb r1, [r0]
	bl sub_20193C0
	b _02018F2E
	.align 2, 0
_02018EA4: .4byte 0x03000010
_02018EA8: .4byte 0x0000085E
_02018EAC:
	ldr r1, _02018EDC @ =0x04000208
	ldrh r0, [r1]
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r1]
	ldr r2, _02018EE0 @ =0x04000134
	movs r4, #0x80
	lsls r4, r4, #8
	adds r0, r4, #0
	strh r0, [r2]
	strh r3, [r1]
	ldr r4, _02018EE4 @ =0x03000010
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x3f
	movs r3, #0
	bl sub_2018808
	ldr r0, _02018EE8 @ =0x0000085E
	adds r4, r4, r0
	movs r0, #7
	strb r0, [r4]
	b _02018F2E
	.align 2, 0
_02018EDC: .4byte 0x04000208
_02018EE0: .4byte 0x04000134
_02018EE4: .4byte 0x03000010
_02018EE8: .4byte 0x0000085E
_02018EEC:
	ldr r0, _02018F04 @ =0x03000010
	movs r1, #1
	movs r2, #1
	bl sub_2018844
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bne _02018F2E
	bl sub_2018CE0
	b _02018F2E
	.align 2, 0
_02018F04: .4byte 0x03000010
_02018F08:
	ldr r0, _02018F34 @ =0x03000010
	ldr r1, _02018F38 @ =0x0000085E
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _02018F2E
	ldr r1, _02018F3C @ =0x04000208
	ldrh r0, [r1]
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r1]
	ldr r2, _02018F40 @ =0x04000134
	movs r4, #0x80
	lsls r4, r4, #8
	adds r0, r4, #0
	strh r0, [r2]
	strh r3, [r1]
_02018F2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02018F34: .4byte 0x03000010
_02018F38: .4byte 0x0000085E
_02018F3C: .4byte 0x04000208
_02018F40: .4byte 0x04000134

	thumb_func_start sub_2018F44
sub_2018F44: @ 0x02018F44
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r4, _02018F8C @ =0x03000010
	ldr r7, _02018F90 @ =0x0201B0A8
	ldr r0, _02018F94 @ =0x0000085C
	adds r6, r4, r0
	ldr r1, _02018F98 @ =0x0000085F
	adds r5, r4, r1
_02018F54:
	bl sub_20189B0
	bl sub_2018978
	movs r1, #0x85
	lsls r1, r1, #4
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _02018F7A
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r0, [r0]
	cmp r0, #0
	beq _02018F7A
	bl sub_02019A8C
_02018F7A:
	movs r0, #1
	bl sub_2019428
	movs r0, #0
	strb r0, [r5]
	bl sub_201892C
	b _02018F54
	.align 2, 0
_02018F8C: .4byte 0x03000010
_02018F90: .4byte 0x0201B0A8
_02018F94: .4byte 0x0000085C
_02018F98: .4byte 0x0000085F

	thumb_func_start sub_2018F9C
sub_2018F9C: @ 0x02018F9C
	sub sp, #4
	mov r2, sp
	ldrb r1, [r0, #3]
	strb r1, [r2]
	ldrb r1, [r0, #2]
	strb r1, [r2, #1]
	ldrb r1, [r0, #1]
	strb r1, [r2, #2]
	mov r1, sp
	ldrb r0, [r0]
	strb r0, [r1, #3]
	ldr r0, [sp]
	add sp, #4
	bx lr

	thumb_func_start sub_2018FB8
sub_2018FB8: @ 0x02018FB8
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _02019008 @ =0x04000208
	ldrh r4, [r5]
	movs r2, #0
	strh r2, [r5]
	ldr r1, _0201900C @ =0x04000134
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _02019010 @ =0x04000158
	strh r2, [r0]
	subs r0, #8
	ldr r0, [r0]
	ldr r0, _02019014 @ =0x04000154
	movs r3, #0
	str r3, [r0]
	adds r1, #0xc
	movs r0, #0x47
	strh r0, [r1]
	ldr r0, _02019018 @ =0x04000202
	movs r1, #0x80
	strh r1, [r0]
	strh r1, [r0]
	ldr r2, _0201901C @ =0x04000200
	ldrh r0, [r2]
	orrs r0, r1
	strh r0, [r2]
	str r3, [sp]
	ldr r1, _02019020 @ =0x03000E50
	ldr r2, _02019024 @ =0x01000010
	mov r0, sp
	bl sub_2019A84
	strh r4, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02019008: .4byte 0x04000208
_0201900C: .4byte 0x04000134
_02019010: .4byte 0x04000158
_02019014: .4byte 0x04000154
_02019018: .4byte 0x04000202
_0201901C: .4byte 0x04000200
_02019020: .4byte 0x03000E50
_02019024: .4byte 0x01000010

	thumb_func_start sub_2019028
sub_2019028: @ 0x02019028
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r0, _02019060 @ =0x04000140
	ldrh r0, [r0]
	mov r8, r0
	movs r0, #1
	mov r1, r8
	ands r0, r1
	ldr r6, _02019064 @ =0x03000E50
	cmp r0, #0
	beq _0201907C
	adds r3, r6, #0
	adds r3, #0x29
	ldrb r2, [r3]
	cmp r2, #0
	bne _02019074
	ldr r0, _02019068 @ =0x04000150
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r1, _0201906C @ =0x04000154
	ldr r0, _02019070 @ =0x0201B0B0
	ldr r0, [r0]
	str r0, [r1]
	strb r2, [r3]
	b _0201907C
	.align 2, 0
_02019060: .4byte 0x04000140
_02019064: .4byte 0x03000E50
_02019068: .4byte 0x04000150
_0201906C: .4byte 0x04000154
_02019070: .4byte 0x0201B0B0
_02019074:
	movs r0, #2
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0201907C:
	movs r7, #2
	mov r0, r8
	ands r0, r7
	cmp r0, #0
	bne _02019088
	b _0201939A
_02019088:
	ldr r0, _020190C4 @ =0x04000150
	ldr r0, [r0]
	str r0, [sp, #4]
	adds r4, r6, #0
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r2, [r5]
	cmp r2, #1
	beq _0201909C
	b _02019388
_0201909C:
	ldr r1, [r4, #0x18]
	ldr r0, _020190C8 @ =0xFFFE0105
	cmp r1, r0
	beq _020190DC
	cmp r1, r0
	bhi _020190CC
	subs r0, #3
	cmp r1, r0
	bls _020190B0
	b _0201933C
_020190B0:
	subs r0, #1
	cmp r1, r0
	bhs _020190B8
	b _0201933C
_020190B8:
	adds r0, r4, #0
	ldr r1, [r0, #8]
	cmp r1, #0
	bge _020190F4
	adds r1, #3
	b _020190F4
	.align 2, 0
_020190C4: .4byte 0x04000150
_020190C8: .4byte 0xFFFE0105
_020190CC:
	ldr r0, _020190D8 @ =0xFFFE0202
	cmp r1, r0
	bne _020190D4
	b _02019208
_020190D4:
	b _0201933C
	.align 2, 0
_020190D8: .4byte 0xFFFE0202
_020190DC:
	ldr r0, _020190EC @ =0x04000154
	ldr r1, _020190F0 @ =0xFFFE0206
	str r1, [r0]
	movs r0, #0
	strb r0, [r5]
	str r0, [r4, #0x18]
	b _0201939A
	.align 2, 0
_020190EC: .4byte 0x04000154
_020190F0: .4byte 0xFFFE0206
_020190F4:
	asrs r1, r1, #2
	ldr r0, [r0, #4]
	cmp r0, r1
	ble _02019162
	ldr r2, _02019138 @ =0x03000E50
	adds r3, r2, #0
	adds r3, #0x24
	ldrb r5, [r3]
	movs r4, #0
	ldrsb r4, [r3, r4]
	cmp r4, #0
	beq _02019148
	ldr r0, _0201913C @ =0x04000158
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0201911E
	b _0201939A
_0201911E:
	ldr r3, _02019140 @ =0xFFFE0209
	cmp r4, #1
	bne _02019126
	subs r3, #1
_02019126:
	ldr r0, _02019144 @ =0x04000154
	str r3, [r0]
	adds r0, r2, #0
	adds r0, #0x25
	strb r5, [r0]
	adds r0, #4
	strb r1, [r0]
	str r1, [r2, #0x18]
	b _0201939A
	.align 2, 0
_02019138: .4byte 0x03000E50
_0201913C: .4byte 0x04000158
_02019140: .4byte 0xFFFE0209
_02019144: .4byte 0x04000154
_02019148:
	ldr r1, _02019158 @ =0xFFFE0106
	ldr r0, [sp, #4]
	cmp r0, r1
	bne _0201915C
	movs r0, #1
	strb r0, [r3]
	b _0201939A
	.align 2, 0
_02019158: .4byte 0xFFFE0106
_0201915C:
	movs r0, #2
	strb r0, [r3]
	b _0201939A
_02019162:
	adds r3, r6, #0
	ldr r2, [r3, #0xc]
	cmp r2, #0
	blt _020191D8
	ldr r0, _02019194 @ =0x04000158
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0201917C
	b _0201939A
_0201917C:
	ldr r0, [r3, #8]
	cmp r0, #0
	bge _02019184
	adds r0, #3
_02019184:
	asrs r0, r0, #2
	ldr r4, [r3, #4]
	cmp r4, r0
	bne _0201919C
	ldr r0, _02019198 @ =0x04000154
	ldr r1, [r3, #0x20]
	mvns r1, r1
	b _020191CA
	.align 2, 0
_02019194: .4byte 0x04000158
_02019198: .4byte 0x04000154
_0201919C:
	movs r0, #0xff
	ands r2, r0
	cmp r2, #0xff
	bne _020191B4
	ldr r1, _020191B0 @ =0x04000154
	ldr r0, [r3, #0x1c]
	mvns r0, r0
	str r0, [r1]
	str r5, [r3, #0x1c]
	b _020192EE
	.align 2, 0
_020191B0: .4byte 0x04000154
_020191B4:
	ldr r1, [r3]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r3, #0x1c]
	adds r0, r0, r1
	str r0, [r3, #0x1c]
	ldr r0, [r3, #0x20]
	adds r0, r0, r1
	str r0, [r3, #0x20]
	ldr r0, _020191D4 @ =0x04000154
_020191CA:
	str r1, [r0]
	adds r0, r4, #1
	str r0, [r3, #4]
	b _020192EE
	.align 2, 0
_020191D4: .4byte 0x04000154
_020191D8:
	adds r0, r6, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, #1
	beq _020191E4
	b _0201932C
_020191E4:
	ldr r0, _020191FC @ =0x04000158
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _020191F6
	b _0201939A
_020191F6:
	ldr r1, _02019200 @ =0x04000154
	ldr r0, _02019204 @ =0xFFFE0204
	b _0201931A
	.align 2, 0
_020191FC: .4byte 0x04000158
_02019200: .4byte 0x04000154
_02019204: .4byte 0xFFFE0204
_02019208:
	ldr r1, [r4, #8]
	cmp r1, #0
	bge _02019210
	adds r1, #3
_02019210:
	asrs r1, r1, #2
	ldr r0, [r4, #4]
	cmp r0, r1
	ble _02019274
	ldr r0, _02019240 @ =0x04000158
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _02019226
	b _0201939A
_02019226:
	ldr r1, [r4, #0x20]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0201924C
	ldr r0, _02019244 @ =0x04000154
	ldr r1, _02019248 @ =0xFFFE0208
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	b _02019258
	.align 2, 0
_02019240: .4byte 0x04000158
_02019244: .4byte 0x04000154
_02019248: .4byte 0xFFFE0208
_0201924C:
	ldr r0, _02019268 @ =0x04000154
	ldr r1, _0201926C @ =0xFFFE0209
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x25
	strb r7, [r0]
_02019258:
	ldr r1, _02019270 @ =0x03000E50
	adds r2, r1, #0
	adds r2, #0x29
	movs r0, #0
	strb r0, [r2]
	str r0, [r1, #0x18]
	b _0201939A
	.align 2, 0
_02019268: .4byte 0x04000154
_0201926C: .4byte 0xFFFE0209
_02019270: .4byte 0x03000E50
_02019274:
	ldr r0, [r4, #0xc]
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	ble _020192FC
	add r0, sp, #4
	bl sub_2018F9C
	adds r3, r0, #0
	ldr r0, _020192B4 @ =0x04000158
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _02019298
	b _0201939A
_02019298:
	ldr r0, [r4, #8]
	cmp r0, #0
	bge _020192A0
	adds r0, #3
_020192A0:
	asrs r0, r0, #2
	ldr r2, [r4, #4]
	cmp r2, r0
	bne _020192B8
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [sp, #4]
	str r1, [r0]
	b _020192E2
	.align 2, 0
_020192B4: .4byte 0x04000158
_020192B8:
	ldrb r0, [r4, #0xc]
	cmp r0, #0xff
	bne _020192D2
	ldr r0, [r4, #0x1c]
	adds r0, r0, r3
	str r0, [r4, #0x1c]
	cmp r0, r5
	beq _020192CE
	adds r0, r4, #0
	adds r0, #0x25
	strb r7, [r0]
_020192CE:
	str r1, [r4, #0x1c]
	b _020192EE
_020192D2:
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [sp, #4]
	str r1, [r0]
	ldr r0, [r4, #0x1c]
	adds r0, r0, r3
	str r0, [r4, #0x1c]
_020192E2:
	ldr r0, [r4, #0x20]
	adds r0, r0, r3
	str r0, [r4, #0x20]
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
_020192EE:
	ldr r1, _020192F8 @ =0x03000E50
	ldr r0, [r1, #0xc]
	adds r0, #1
	str r0, [r1, #0xc]
	b _0201939A
	.align 2, 0
_020192F8: .4byte 0x03000E50
_020192FC:
	adds r0, r6, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, #1
	bne _0201932C
	ldr r0, _02019320 @ =0x04000158
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _0201939A
	ldr r1, _02019324 @ =0x04000154
	ldr r0, _02019328 @ =0xFFFE0104
_0201931A:
	str r0, [r1]
	str r2, [r6, #0xc]
	b _0201939A
	.align 2, 0
_02019320: .4byte 0x04000158
_02019324: .4byte 0x04000154
_02019328: .4byte 0xFFFE0104
_0201932C:
	ldr r1, _02019334 @ =0x04000154
	ldr r0, _02019338 @ =0xFFFE0205
	str r0, [r1]
	b _0201939A
	.align 2, 0
_02019334: .4byte 0x04000154
_02019338: .4byte 0xFFFE0205
_0201933C:
	ldr r4, _02019378 @ =0x03000E50
	ldr r1, [sp, #4]
	str r1, [r4, #0x18]
	ldr r0, _0201937C @ =0xFFFE0101
	cmp r1, r0
	blo _0201939A
	adds r0, #1
	cmp r1, r0
	bls _02019354
	ldr r0, _02019380 @ =0xFFFE0202
	cmp r1, r0
	bne _0201939A
_02019354:
	movs r0, #0
	str r0, [sp]
	ldr r2, _02019384 @ =0x01000010
	mov r0, sp
	adds r1, r4, #0
	bl sub_2019A84
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0xc]
	ldr r0, [sp, #4]
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	b _0201939A
	.align 2, 0
_02019378: .4byte 0x03000E50
_0201937C: .4byte 0xFFFE0101
_02019380: .4byte 0xFFFE0202
_02019384: .4byte 0x01000010
_02019388:
	add r0, sp, #4
	bl sub_2018F9C
	ldr r1, _020193B4 @ =0x0201B0B8
	ldr r1, [r1]
	cmp r0, r1
	bne _0201939A
	movs r0, #1
	strb r0, [r5]
_0201939A:
	ldr r0, _020193B8 @ =0x04000140
	mov r1, r8
	strh r1, [r0]
	ldr r0, _020193BC @ =0x03000E50
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020193B4: .4byte 0x0201B0B8
_020193B8: .4byte 0x04000140
_020193BC: .4byte 0x03000E50

	thumb_func_start sub_20193C0
sub_20193C0: @ 0x020193C0
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _02019410 @ =0x04000208
	ldrh r4, [r5]
	movs r2, #0
	strh r2, [r5]
	ldr r1, _02019414 @ =0x04000134
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	strh r0, [r1]
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _02019418 @ =0x04000158
	strh r2, [r0]
	subs r0, #8
	ldr r0, [r0]
	ldr r0, _0201941C @ =0x04000154
	movs r2, #0
	str r2, [r0]
	adds r1, #0xc
	movs r0, #0x47
	strh r0, [r1]
	adds r1, #0xc2
	movs r0, #0x80
	strh r0, [r1]
	str r2, [sp]
	ldr r1, _02019420 @ =0x03000E50
	ldr r2, _02019424 @ =0x01000010
	mov r0, sp
	bl sub_2019A84
	strh r4, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02019410: .4byte 0x04000208
_02019414: .4byte 0x04000134
_02019418: .4byte 0x04000158
_0201941C: .4byte 0x04000154
_02019420: .4byte 0x03000E50
_02019424: .4byte 0x01000010

	thumb_func_start sub_2019428
sub_2019428: @ 0x02019428
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r0, _0201944C @ =0x03000E50
	adds r4, r0, #0
	adds r4, #0x2a
	ldrb r1, [r4]
	cmp r1, #0xa
	bhi _02019454
	ldr r0, _02019450 @ =0x04000208
	strh r2, [r0]
	adds r1, #1
	strb r1, [r4]
	movs r1, #1
	strh r1, [r0]
	b _0201945E
	.align 2, 0
_0201944C: .4byte 0x03000E50
_02019450: .4byte 0x04000208
_02019454:
	cmp r3, #0
	beq _0201945C
	bl sub_20193C0
_0201945C:
	movs r2, #1
_0201945E:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_2019468
sub_2019468: @ 0x02019468
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _02019480 @ =0x03000E90
	ldr r2, _02019484 @ =0x01000120
	mov r0, sp
	bl sub_2019A84
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_02019480: .4byte 0x03000E90
_02019484: .4byte 0x01000120

	thumb_func_start sub_2019488
sub_2019488: @ 0x02019488
	adds r2, r0, #0
	adds r2, #0x57
	movs r1, #0
	strb r1, [r2]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0

	thumb_func_start sub_2019498
sub_2019498: @ 0x02019498
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r1
	mov sl, r2
	str r3, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r4, #0
	movs r0, #0
	bl sub_2019550
	adds r2, r0, #0
	cmp r2, #0
	blt _02019532
	ldr r1, _02019544 @ =0x0201B0D0
	mov r3, r8
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r5, [r0]
	str r4, [sp]
	lsls r4, r2, #1
	adds r4, r4, r2
	lsls r4, r4, #5
	ldr r6, _02019548 @ =0x03000E90
	adds r7, r4, r6
	ldr r2, _0201954C @ =0x01000018
	mov r0, sp
	adds r1, r7, #0
	bl sub_2019A84
	ldr r0, [r5]
	str r0, [r7]
	adds r0, r6, #4
	adds r0, r4, r0
	ldr r1, [r5, #4]
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #8
	adds r0, r4, r0
	ldr r1, [r5, #8]
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0xc
	adds r0, r4, r0
	ldr r1, [r5, #0xc]
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x57
	mov r1, r8
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r4, r0
	mov r3, sb
	str r3, [r0]
	adds r0, r6, #0
	adds r0, #0x30
	adds r0, r4, r0
	mov r1, sl
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0x14
	adds r4, r4, r0
	ldr r3, [sp, #4]
	str r3, [r4]
	ldr r1, [r7]
	cmp r1, #0
	beq _02019530
	adds r0, r7, #0
	bl sub_2019A90
_02019530:
	adds r4, r7, #0
_02019532:
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02019544: .4byte 0x0201B0D0
_02019548: .4byte 0x03000E90
_0201954C: .4byte 0x01000018

	thumb_func_start sub_2019550
sub_2019550: @ 0x02019550
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r0, _02019560 @ =0x03000E90
	adds r1, r0, #0
	adds r1, #0x57
	b _0201956C
	.align 2, 0
_02019560: .4byte 0x03000E90
_02019564:
	adds r1, #0x60
	adds r2, #1
	cmp r2, #0xb
	bgt _02019572
_0201956C:
	ldrb r0, [r1]
	cmp r0, r3
	bne _02019564
_02019572:
	adds r0, r2, #0
	cmp r0, #0xb
	ble _0201957C
	movs r0, #1
	rsbs r0, r0, #0
_0201957C:
	pop {r1}
	bx r1

	thumb_func_start sub_2019580
sub_2019580: @ 0x02019580
	push {r4, lr}
	adds r2, r0, #0
	movs r3, #0
	movs r4, #0x38
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r4, #0x34
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bne _020195A8
	movs r4, #0x36
	ldrsh r0, [r2, r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020195A8
	movs r3, #1
_020195A8:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_20195B0
sub_20195B0: @ 0x020195B0
	push {r4, lr}
	movs r3, #0
	strh r2, [r0, #0x38]
	movs r4, #0x38
	ldrsh r2, [r0, r4]
	lsls r2, r2, #2
	adds r2, r2, r1
	ldr r1, [r2]
	ldrh r1, [r1, #4]
	strh r1, [r0, #0x34]
	strh r3, [r0, #0x36]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_20195CC
sub_20195CC: @ 0x020195CC
	push {lr}
	adds r2, r0, #0
	movs r3, #0x38
	ldrsh r0, [r2, r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	subs r0, #1
	cmp r0, #0
	bgt _0201960E
	movs r1, #0x36
	ldrsh r0, [r2, r1]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _020195FC
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _02019612
	strh r1, [r2, #0x36]
	b _02019602
_020195FC:
	ldrh r0, [r2, #0x36]
	adds r0, #1
	strh r0, [r2, #0x36]
_02019602:
	movs r1, #0x36
	ldrsh r0, [r2, r1]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	b _02019612
_0201960E:
	ldrh r0, [r2, #0x34]
	subs r0, #1
_02019612:
	strh r0, [r2, #0x34]
	pop {r0}
	bx r0

	thumb_func_start sub_2019618
sub_2019618: @ 0x02019618
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r3, [r0, #0x30]
	ldrb r4, [r1]
	adds r4, r4, r3
	ldr r3, [r0, #0x24]
	adds r3, r3, r4
	strb r3, [r2]
	ldrb r3, [r1, #1]
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	ldrb r5, [r2, #1]
	movs r4, #4
	rsbs r4, r4, #0
	ands r4, r5
	orrs r4, r3
	strb r4, [r2, #1]
	ldrb r5, [r1, #1]
	movs r3, #0xc
	ands r3, r5
	movs r5, #0xd
	rsbs r5, r5, #0
	mov sb, r5
	ands r5, r4
	orrs r5, r3
	strb r5, [r2, #1]
	ldrb r4, [r1, #1]
	movs r3, #0x10
	ands r3, r4
	movs r4, #0x11
	rsbs r4, r4, #0
	mov r8, r4
	mov r6, r8
	ands r6, r5
	orrs r6, r3
	strb r6, [r2, #1]
	ldrb r3, [r1, #1]
	movs r4, #0x20
	ands r4, r3
	movs r5, #0x21
	rsbs r5, r5, #0
	adds r3, r5, #0
	ands r3, r6
	orrs r3, r4
	strb r3, [r2, #1]
	ldrb r4, [r1, #1]
	lsrs r4, r4, #6
	lsls r4, r4, #6
	movs r6, #0x3f
	ands r3, r6
	orrs r3, r4
	strb r3, [r2, #1]
	ldrh r3, [r1, #2]
	lsls r3, r3, #0x17
	lsrs r3, r3, #0x17
	ldr r4, [r0, #0x2c]
	adds r3, r3, r4
	ldr r0, [r0, #0x20]
	adds r3, r3, r0
	ldr r4, _0201971C @ =0x000001FF
	adds r0, r4, #0
	ands r3, r0
	ldrh r4, [r2, #2]
	ldr r0, _02019720 @ =0xFFFFFE00
	ands r0, r4
	orrs r0, r3
	strh r0, [r2, #2]
	ldrb r3, [r1, #3]
	movs r0, #0xe
	ands r0, r3
	ldrb r4, [r2, #3]
	movs r3, #0xf
	rsbs r3, r3, #0
	ands r3, r4
	orrs r3, r0
	strb r3, [r2, #3]
	ldrb r4, [r1, #3]
	movs r0, #0x10
	ands r0, r4
	mov r4, r8
	ands r4, r3
	orrs r4, r0
	strb r4, [r2, #3]
	ldrb r3, [r1, #3]
	movs r0, #0x20
	ands r0, r3
	ands r5, r4
	orrs r5, r0
	strb r5, [r2, #3]
	ldrb r0, [r1, #3]
	lsrs r0, r0, #6
	lsls r0, r0, #6
	ands r5, r6
	orrs r5, r0
	strb r5, [r2, #3]
	ldrh r3, [r1, #4]
	lsls r3, r3, #0x16
	lsrs r3, r3, #0x16
	ldrh r4, [r2, #4]
	ldr r0, _02019724 @ =0xFFFFFC00
	ands r0, r4
	orrs r0, r3
	strh r0, [r2, #4]
	ldrb r3, [r1, #5]
	movs r0, #0xc
	ands r0, r3
	ldrb r3, [r2, #5]
	mov r5, sb
	ands r5, r3
	orrs r5, r0
	mov sb, r5
	strb r5, [r2, #5]
	ldrb r0, [r1, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r3, #0xf
	mov r4, sb
	ands r4, r3
	orrs r4, r0
	strb r4, [r2, #5]
	ldrh r0, [r1, #6]
	strh r0, [r2, #6]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0201971C: .4byte 0x000001FF
_02019720: .4byte 0xFFFFFE00
_02019724: .4byte 0xFFFFFC00

	thumb_func_start sub_2019728
sub_2019728: @ 0x02019728
	push {r4, r5, r6, lr}
	ldr r0, _0201977C @ =0x03000E90
	adds r6, r0, #0
	adds r6, #0x57
	adds r4, r0, #0
	movs r5, #0xb
_02019734:
	ldrb r0, [r6]
	cmp r0, #0
	beq _02019746
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _02019746
	adds r0, r4, #0
	bl sub_2019A90
_02019746:
	adds r6, #0x60
	adds r4, #0x60
	subs r5, #1
	cmp r5, #0
	bge _02019734
	ldr r0, _0201977C @ =0x03000E90
	adds r6, r0, #0
	adds r6, #0x57
	adds r4, r0, #0
	movs r5, #0xb
_0201975A:
	ldrb r0, [r6]
	cmp r0, #0
	beq _0201976C
	ldr r1, [r4, #0xc]
	cmp r1, #0
	beq _0201976C
	adds r0, r4, #0
	bl sub_2019A90
_0201976C:
	adds r6, #0x60
	adds r4, #0x60
	subs r5, #1
	cmp r5, #0
	bge _0201975A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0201977C: .4byte 0x03000E90

	thumb_func_start sub_2019780
sub_2019780: @ 0x02019780
	push {r4, lr}
	lsls r2, r2, #2
	adds r2, r2, r1
	ldr r2, [r2]
	adds r1, r0, #0
	adds r1, #0x42
	adds r1, r1, r3
	ldrh r2, [r2, #4]
	movs r4, #0
	strb r2, [r1]
	adds r0, #0x4c
	adds r0, r0, r3
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_20197A0
sub_20197A0: @ 0x020197A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r2, #0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x42
	adds r2, r0, r4
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	cmp r0, #0
	bgt _0201980C
	adds r1, r7, #0
	adds r1, #0x4c
	adds r3, r1, r4
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #3
	add r0, r8
	adds r5, r0, #0
	adds r5, #8
	ldr r6, [r0, #8]
	mov ip, r1
	cmp r6, #0
	bne _020197EC
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _020197E6
	strb r6, [r3]
	b _020197F2
_020197E6:
	strb r0, [r2]
	movs r0, #1
	b _02019814
_020197EC:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_020197F2:
	adds r1, r7, #0
	adds r1, #0x42
	adds r1, r1, r4
	mov r2, ip
	adds r0, r2, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0, #4]
	strb r0, [r1]
	b _02019812
_0201980C:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
_02019812:
	movs r0, #0
_02019814:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_2019820
sub_2019820: @ 0x02019820
	push {r4, lr}
	adds r3, r0, #0
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r3, #0
	adds r0, #0x42
	adds r1, r0, r2
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #1
	cmp r0, #0
	bgt _0201985E
	adds r0, r3, #0
	adds r0, #0x4c
	adds r2, r0, r2
	ldrb r3, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0201984E
	movs r0, #1
	b _02019866
_0201984E:
	subs r0, r3, #1
	strb r0, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	b _02019862
_0201985E:
	ldrb r0, [r1]
	subs r0, #1
_02019862:
	strb r0, [r1]
	movs r0, #0
_02019866:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_201986C
sub_201986C: @ 0x0201986C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _020198EC @ =0x030008D0
	mov sl, r0
	ldr r1, _020198F0 @ =0x0201AE20
	mov sb, r1
	adds r0, r4, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r7, [r0, r1]
	mov r0, r8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	adds r0, r7, #0
	mov r1, r8
	bl sub_20187A8
	lsls r6, r6, #5
	add r6, sl
	strh r0, [r6, #6]
	lsls r4, r4, #1
	add r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r1, r8
	bl sub_20187A8
	strh r0, [r6, #0xe]
	ldrh r0, [r4]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r1, r5, #0
	bl sub_20187A8
	strh r0, [r6, #0x16]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_20187A8
	strh r0, [r6, #0x1e]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020198EC: .4byte 0x030008D0
_020198F0: .4byte 0x0201AE20

	thumb_func_start sub_20198F4
sub_20198F4: @ 0x020198F4
	push {lr}
	adds r3, r0, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #4
	bhi _02019984
	lsls r0, r0, #2
	ldr r1, _0201990C @ =_02019910
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0201990C: .4byte _02019910
_02019910: @ jump table
	.4byte _02019924 @ case 0
	.4byte _0201993A @ case 1
	.4byte _02019960 @ case 2
	.4byte _0201996E @ case 3
	.4byte _02019984 @ case 4
_02019924:
	movs r0, #0x40
	str r0, [r3, #0x28]
	adds r1, r3, #0
	adds r1, #0x40
	movs r2, #0
	movs r0, #0x50
	strh r0, [r1]
	strh r2, [r3, #0x3e]
	adds r1, #0x16
	movs r0, #1
	strb r0, [r1]
_0201993A:
	adds r0, r3, #0
	adds r0, #0x40
	ldrh r0, [r0]
	ldrh r1, [r3, #0x3e]
	adds r0, r0, r1
	strh r0, [r3, #0x3e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldr r1, [r3, #0x28]
	subs r1, r1, r0
	str r1, [r3, #0x28]
	cmp r1, #0
	bgt _02019984
	movs r0, #0
	str r0, [r3, #0x28]
	adds r1, r3, #0
	adds r1, #0x56
	movs r0, #2
	strb r0, [r1]
_02019960:
	ldr r0, [r3, #0x1c]
	adds r0, #1
	str r0, [r3, #0x1c]
	cmp r0, #0x11
	ble _02019984
	movs r0, #0x11
	b _0201997A
_0201996E:
	ldr r0, [r3, #0x1c]
	subs r0, #1
	str r0, [r3, #0x1c]
	cmp r0, #0
	bge _02019984
	movs r0, #0
_0201997A:
	str r0, [r3, #0x1c]
	adds r1, r3, #0
	adds r1, #0x56
	movs r0, #3
	strb r0, [r1]
_02019984:
	ldr r0, _020199A0 @ =0x03000010
	ldr r1, _020199A4 @ =0x0000085E
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _0201999C
	adds r1, r3, #0
	adds r1, #0x4c
	movs r0, #1
	strb r0, [r1]
_0201999C:
	pop {r0}
	bx r0
	.align 2, 0
_020199A0: .4byte 0x03000010
_020199A4: .4byte 0x0000085E

	thumb_func_start sub_20199A8
sub_20199A8: @ 0x020199A8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_020199AE:
	adds r0, r5, #0
	ldr r1, _020199E0 @ =0x0201B398
	movs r2, #0
	adds r3, r4, #0
	bl sub_2019780
	adds r4, #1
	cmp r4, #2
	ble _020199AE
	adds r1, r5, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x3c]
	strh r0, [r5, #0x3a]
	ldr r1, _020199E4 @ =sub_20198F4
	str r1, [r5, #0x10]
	adds r0, r5, #0
	bl sub_2019A90
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020199E0: .4byte 0x0201B398
_020199E4: .4byte sub_20198F4

	thumb_func_start nullsub_15
nullsub_15: @ 0x020199E8
	bx lr
	.align 2, 0

	thumb_func_start sub_20199EC
sub_20199EC: @ 0x020199EC
	push {lr}
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _020199F8
	bl sub_2019A90
_020199F8:
	pop {r0}
	bx r0

	thumb_func_start sub_20199FC
sub_20199FC: @ 0x020199FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	movs r2, #0
	ldr r0, _02019A74 @ =0x0000FFFF
	mov r8, r0
_02019A0C:
	ldr r1, _02019A78 @ =0x0201B398
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x4c
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r4, [r0]
	ldrh r0, [r4, #6]
	adds r7, r2, #1
	cmp r0, r8
	beq _02019A54
	ldr r5, _02019A7C @ =0x03000870
	ldr r3, _02019A74 @ =0x0000FFFF
_02019A32:
	ldrb r2, [r5]
	lsls r2, r2, #3
	ldr r0, _02019A80 @ =0x030008D0
	adds r2, r2, r0
	adds r0, r6, #0
	adds r1, r4, #0
	str r3, [sp]
	bl sub_2019618
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r4, #8
	ldrh r0, [r4, #6]
	ldr r3, [sp]
	cmp r0, r3
	bne _02019A32
_02019A54:
	adds r2, r7, #0
	cmp r2, #2
	ble _02019A0C
	ldrh r0, [r6, #0x3a]
	ldrh r1, [r6, #0x3c]
	movs r2, #0
	movs r3, #0
	bl sub_201986C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02019A74: .4byte 0x0000FFFF
_02019A78: .4byte 0x0201B398
_02019A7C: .4byte 0x03000870
_02019A80: .4byte 0x030008D0

	thumb_func_start sub_2019A84
sub_2019A84: @ 0x02019A84
	svc #0xc
	bx lr

	thumb_func_start sub_2019A88
sub_2019A88: @ 0x02019A88
	svc #1
	bx lr

	thumb_func_start sub_02019A8C
sub_02019A8C: @ 0x02019A8C
	bx r0
	nop

	thumb_func_start sub_2019A90
sub_2019A90: @ 0x02019A90
	bx r1
	nop

	thumb_func_start sub_2019A94
sub_2019A94: @ 0x02019A94
	bx r2
	nop

	thumb_func_start sub_2019A98
sub_2019A98: @ 0x02019A98
	bx r3
	nop

	thumb_func_start sub_2019A9C
sub_2019A9C: @ 0x02019A9C
	bx r4
	nop

	thumb_func_start sub_2019AA0
sub_2019AA0: @ 0x02019AA0
	bx r5
	nop

	thumb_func_start sub_2019AA4
sub_2019AA4: @ 0x02019AA4
	bx r6
	nop

	thumb_func_start sub_2019AA8
sub_2019AA8: @ 0x02019AA8
	bx r7
	nop

	thumb_func_start sub_2019AAC
sub_2019AAC: @ 0x02019AAC
	bx r8
	nop

	thumb_func_start sub_2019AB0
sub_2019AB0: @ 0x02019AB0
	bx sb
	nop

	thumb_func_start sub_2019AB4
sub_2019AB4: @ 0x02019AB4
	bx sl
	nop

	thumb_func_start sub_2019AB8
sub_2019AB8: @ 0x02019AB8
	bx fp
	nop

	thumb_func_start sub_2019ABC
sub_2019ABC: @ 0x02019ABC
	bx ip
	nop

	thumb_func_start sub_2019AC0
sub_2019AC0: @ 0x02019AC0
	bx sp
	nop

	thumb_func_start nullsub_16
nullsub_16: @ 0x02019AC4
	bx lr
	nop

	thumb_func_start sub_2019AC8
sub_2019AC8: @ 0x02019AC8
	cmp r1, #0
	beq _02019B50
	push {r4}
	adds r4, r0, #0
	eors r4, r1
	mov ip, r4
	movs r3, #1
	movs r2, #0
	cmp r1, #0
	bpl _02019ADE
	rsbs r1, r1, #0
_02019ADE:
	cmp r0, #0
	bpl _02019AE4
	rsbs r0, r0, #0
_02019AE4:
	cmp r0, r1
	blo _02019B42
	movs r4, #1
	lsls r4, r4, #0x1c
_02019AEC:
	cmp r1, r4
	bhs _02019AFA
	cmp r1, r0
	bhs _02019AFA
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _02019AEC
_02019AFA:
	lsls r4, r4, #3
_02019AFC:
	cmp r1, r4
	bhs _02019B0A
	cmp r1, r0
	bhs _02019B0A
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _02019AFC
_02019B0A:
	cmp r0, r1
	blo _02019B12
	subs r0, r0, r1
	orrs r2, r3
_02019B12:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _02019B1E
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_02019B1E:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _02019B2A
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_02019B2A:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _02019B36
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_02019B36:
	cmp r0, #0
	beq _02019B42
	lsrs r3, r3, #4
	beq _02019B42
	lsrs r1, r1, #4
	b _02019B0A
_02019B42:
	adds r0, r2, #0
	mov r4, ip
	cmp r4, #0
	bpl _02019B4C
	rsbs r0, r0, #0
_02019B4C:
	pop {r4}
	mov pc, lr
_02019B50:
	push {lr}
	bl nullsub_5
	movs r0, #0
	pop {pc}
	.align 2, 0

	thumb_func_start nullsub_5
nullsub_5: @ 0x02019B5C
	mov pc, lr
	.align 2, 0

	thumb_func_start sub_2019B60
sub_2019B60: @ 0x02019B60
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r5, #0
	cmp r2, #3
	bls _02019BA6
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	bne _02019BA6
	adds r1, r5, #0
	movs r0, #0xff
	ands r4, r0
	lsls r3, r4, #8
	orrs r3, r4
	lsls r0, r3, #0x10
	orrs r3, r0
	cmp r2, #0xf
	bls _02019B9A
_02019B86:
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _02019B86
	b _02019B9A
_02019B96:
	stm r1!, {r3}
	subs r2, #4
_02019B9A:
	cmp r2, #3
	bhi _02019B96
	adds r3, r1, #0
	b _02019BA6
_02019BA2:
	strb r4, [r3]
	adds r3, #1
_02019BA6:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _02019BA2
	adds r0, r5, #0
	pop {r4, r5, pc}

.align 2, 0
