	.include "asm/macros/function.inc"
	.include "constants/gba_constants.inc"
	.text
	.syntax unified

	arm_func_start _start
_start: @ 0x02000000
	b _init
	.global RomHeaderNintendoLogo
RomHeaderNintendoLogo:
	.space 156

RomHeaderGameTitle:
	.space 12

	.global RomHeaderGameCode
RomHeaderGameCode:
	.space 4

RomHeaderMakerCode:
	.space 2

RomHeaderMagic:
	.byte 0

RomHeaderMainUnitCode:
	.byte 0

RomHeaderDeviceType:
	.byte 0

RomHeaderReserved1:
	.space 7

	.global RomHeaderSoftwareVersion
RomHeaderSoftwareVersion:
	.byte 0

RomHeaderChecksum:
	.byte 0

RomHeaderReserved2:
	.space 2

@ copied direct from IDA
_init:
                B               real_init
@ ---------------------------------------------------------------------------

.ALIGN 5, 0
                LDR             R3, =REG_KEYINPUT
                MOV             R1, #0
                STRH            R1, [R3,#0x10]
                MOV             R1, #0xC0
                MOV             R1, R1,LSL#8
                STRH            R1, [R3,#4]

loc_80000F8:                            @ CODE XREF: ROM:08000100j
                LDRH            R1, [R3,#0x28]
                ANDS            R1, R1, #8
                BNE             loc_80000F8
                LDR             R2, =RomHeaderGameCode
                LDR             R1, [R2]
                STR             R1, [R3,#0x24]

loc_8000110:                            @ CODE XREF: ROM:0800011Cj
                LDRH            R0, [R3,#0x10]
                AND             R0, R0, #7
                CMP             R0, #4
                BNE             loc_8000110
                STRH            R0, [R3,#0x10]

loc_8000124:                            @ CODE XREF: ROM:08000130j
                LDRH            R0, [R3,#0x10]
                AND             R0, R0, #7
                CMP             R0, #2
                BNE             loc_8000124
                STRH            R0, [R3,#0x10]
                LDR             R0, [R3,#0x20]
                CMP             R0, R1

loc_8000140:                            @ CODE XREF: ROM:loc_8000140j
                BNE             loc_8000140

real_init:                              @ CODE XREF: ROM:_initj
                LDR             R0, =Image
                LDR             R1, =0x2018000 @ payload destination
                SVC             0x110000 @ LZ77UnCompReadNormalWrite8bit
                LDR             LR, =0x2018000
                BX              LR

.pool
