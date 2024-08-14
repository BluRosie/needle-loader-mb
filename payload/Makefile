TOOLCHAIN := $(DEVKITARM)
COMPARE ?= 0

ifeq ($(CC),)
HOSTCC := gcc
else
HOSTCC := $(CC)
endif

ifeq ($(CXX),)
HOSTCXX := g++
else
HOSTCXX := $(CXX)
endif

ifneq (,$(wildcard $(TOOLCHAIN)/base_tools))
include $(TOOLCHAIN)/base_tools
else
export PATH := $(TOOLCHAIN)/bin:$(PATH)
PREFIX := arm-none-eabi-
OBJCOPY := $(PREFIX)objcopy
OBJDUMP := $(PREFIX)objdump
export CC := $(PREFIX)gcc
export AS := $(PREFIX)as
endif
export CPP := $(PREFIX)cpp
export LD := $(PREFIX)ld
export OBJCOPY := $(PREFIX)objcopy
export OBJDUMP := $(PREFIX)objdump

PREPROC := ../tools/preproc/preproc
SCANINC := ../tools/scaninc/scaninc
GFX := ../tools/gbagfx/gbagfx
PERL := perl

NAME := payload
ROM := $(NAME).gba
ROMLZ := $(ROM).lz
ELF := $(NAME).elf
SYM = $(ROM:.gba=.sym)

OBJ_DIR := build/$(NAME)

SHELL := /bin/bash -o pipefail

C_SUBDIRS := src src/gflib src/libpmagb
ASM_SUBDIRS := asm asm/gflib asm/libpmagb

ASM_SRCS := $(foreach subdir,$(ASM_SUBDIRS),$(wildcard $(subdir)/*.s))
ASM_OBJS := $(ASM_SRCS:%.s=$(OBJ_DIR)/%.o)
C_SRCS := $(foreach subdir,$(C_SUBDIRS),$(wildcard $(subdir)/*.c))
C_OBJS := $(C_SRCS:%.c=$(OBJ_DIR)/%.o)
DATA_ASM_SRCS := $(wildcard data/*.s sound/*.s sound/*/*.s)
DATA_ASM_OBJS := $(DATA_ASM_SRCS:%.s=$(OBJ_DIR)/%.o)
MID_SUBDIR := sound/songs/midi
MID_ASM_MIDS := $(wildcard $(MID_SUBDIR)/*.mid)
MID_ASM_SRCS := $(MID_ASM_MIDS:%.mid=%.s)
MID_ASM_OBJS := $(MID_ASM_SRCS:%.s=$(OBJ_DIR)/%.o)

SAMPLE_SUBDIR := sound/direct_sound_samples
AIF_SRCS := $(wildcard $(SAMPLE_SUBDIR)/*.aif)
AIF_BINS := $(AIF_SRCS:%.aif=%.bin)

CC1 := ../tools/agbcc/bin/agbcc
CPPFLAGS := -I ../tools/agbcc/include -iquote include -nostdinc -undef
CFLAGS := -O2 -g -mthumb-interwork -fhex-asm -Wimplicit -Werror
ASFLAGS := -mcpu=arm7tdmi -I include
LIBS := -L../../../tools/agbcc/lib -lgcc -lc

SUBDIRS := $(ASM_SUBDIRS) $(C_SUBDIRS) data sound sound/songs $(MID_SUBDIR)

ALL_OBJS := $(ASM_OBJS) $(C_OBJS) $(DATA_ASM_OBJS) $(MID_ASM_OBJS)

TOOLDIRS := $(filter-out ../tools/agbcc ../tools/binutils,$(wildcard ../tools/*))

infoshell = $(foreach line, $(shell $1 | sed "s/ /__SPACE__/g"), $(info $(subst __SPACE__, ,$(line))))

# Build tools when building the rom
# Disable dependency scanning for clean/tidy/tools
MAKEFLAGS += --no-print-directory
ifeq (,$(filter-out all compare,$(MAKECMDGOALS)))
$(call infoshell, $(MAKE) tools)
else
NODEP := 1
endif

# if nonmatching set NONMATCHING
ifeq (1,$(NONMATCHING))
CPPFLAGS += -DNONMATCHING
ASFLAGS  += --defsym NONMATCHING=1
endif

$(shell mkdir -p $(SUBDIRS:%=$(OBJ_DIR)/%))

.SUFFIXES:
.SECONDARY:
.DELETE_ON_ERROR:
.SECONDEXPANSION:

.PHONY: all rom clean compare tools cleantools mostlyclean

all: rom
	@:

rom: $(ROMLZ)
ifeq ($(COMPARE),1)
	sha1sum -c $(NAME).sha1
endif

mostlyclean:
	$(RM) $(ROMLZ) $(ROM) $(ELF) $(SYM) $(ALL_OBJS) $(MID_ASM_SRCS) $(AIF_BINS)
	find . \( -name "*.rl" -or -name "*.lz" -or -name "*.[1248]bpp" -or -name "*.gbapal" \) -exec $(RM) {} +

clean: mostlyclean
	@$(foreach tool,$(TOOLDIRS),$(MAKE) clean -C $(tool);)

tools:
	@$(foreach tool,$(TOOLDIRS),$(MAKE) -C $(tool);)

ifeq ($(NODEP),1)
$(OBJ_DIR)/asm/%.o: asm_dep :=
$(OBJ_DIR)/src/%.o: c_dep :=
$(OBJ_DIR)/data/%.o: data_dep :=
else
$(OBJ_DIR)/asm/%.o: asm_dep = $(shell $(SCANINC) -I "include" -I "" $*.s)
$(OBJ_DIR)/src/%.o: c_dep = $(shell $(SCANINC) -I "include" -I "" $*.c)
$(OBJ_DIR)/data/%.o: data_dep = $(shell $(SCANINC) -I "include" -I "" $*.s)
endif

$(ASM_OBJS): $(OBJ_DIR)/%.o: %.s $$(asm_dep)
	$(AS) $(ASFLAGS) -o $@ $<

$(C_OBJS): $(OBJ_DIR)/%.o: %.c $$(c_dep)
	@echo "CC <flags> -o $@ $<"
	@$(CPP) $(CPPFLAGS) -o $(OBJ_DIR)/$*.i $<
	@$(PREPROC) $(OBJ_DIR)/$*.i charmap.txt | $(CC1) $(CFLAGS) -o $(OBJ_DIR)/$*.s
	#$(CC1) $(CFLAGS) -o $(OBJ_DIR)/$*.s $<
	@echo -e ".text\n\t.align\t2, 0 @ Don't pad with nop\n" >> $(OBJ_DIR)/$*.s
	@$(AS) $(ASFLAGS) -o $@ $(OBJ_DIR)/$*.s

$(DATA_ASM_OBJS): $(OBJ_DIR)/%.o: %.s $$(data_dep)
	$(PREPROC) $< charmap.txt | $(CPP) $(CPPFLAGS) | $(AS) $(ASFLAGS) -o $@

$(OBJ_DIR)/ld_script.ld: ld_script.txt
	sed "s#tools/#../../../tools/#g" $< > $@

$(ELF): $(OBJ_DIR)/ld_script.ld $(ALL_OBJS)
	cd $(OBJ_DIR) && $(LD) -Map ../../$(NAME).map -T ../../$< -o ../../$@ $(LIBS)

$(ROM): $(ELF)
	$(OBJCOPY) -O binary $< $@

$(ROMLZ): $(ROM)
	$(GFX) $< $@ -search 1

compare:
	@$(MAKE) COMPARE=1

nonmatching:
	@$(MAKE) NONMATCHING=1 COMPARE=1

### Debug Print ###

print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true

###################
### Symbol file ###
###################

symbols: $(SYM)

$(SYM): $(ELF)
	$(OBJDUMP) -t $< | sort -u | grep -E "^0[2389]" | $(PERL) -p -e 's/^(\w{8}) (\w).{6} \S+\t(\w{8}) (\S+)$$/\1 \2 \3 \4/g' > $@
