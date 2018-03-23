
AS := $(MIPS_BINUTILS)/bin/mips64-elf-as
LD := $(MIPS_BINUTILS)/bin/mips64-elf-ld
OBJCOPY := $(MIPS_BINUTILS)/bin/mips64-elf-objcopy

# Zelda64 tools
YAZ0      := tools/yaz0
MAKEROMFS := tools/makeromfs

ROM_FILES := $(shell awk '{if($$1=="file")printf "%s ",$$2}' file_list.txt)

SFILES := $(wildcard asm/*.s)
OFILES := $(SFILES:.s=.o)
ROM := zelda_oot.z64
ELF := $(ROM:.z64=.elf)
MAP := $(ROM:.z64=.map)

compare: $(ROM)
	@md5sum -c checksum.md5

clean:
	$(RM) $(ROM) $(ELF) $(MAP) $(OFILES) files/*.yaz0

$(ROM): $(ROM_FILES) file_list.txt
	$(MAKEROMFS) file_list.txt $@

$(ELF): $(OFILES)
	$(LD) -Map $(MAP) -T ldscript.txt $^ -o $@

%.o: %.s
	$(AS) $^ -o $@

%.yaz0: %
	$(YAZ0) $< $@
