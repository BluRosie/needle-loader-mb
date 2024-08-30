	.include "../asm/macros/function.inc"
	.include "../constants/gba_constants.inc"
	.text
	.syntax unified

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
	bl CpuFastSet
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

	thumb_func_start CpuFastSet
CpuFastSet: @ 0x02019A84
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
