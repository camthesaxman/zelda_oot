#### Tools ####

AS      := $(MIPS_BINUTILS)/bin/mips64-elf-as
LD      := $(MIPS_BINUTILS)/bin/mips64-elf-ld
OBJCOPY := $(MIPS_BINUTILS)/bin/mips64-elf-objcopy

YAZ0      := tools/yaz0
MAKEROMFS := tools/makeromfs


#### Files ####

# files that will be included on the cartridge
ROM_FILES := $(shell awk '{if($$1=="file")printf "%s ",$$2}' file_list.txt)

# ROM image
ROM := zelda_oot.z64

# create build directory
$(shell mkdir -p build)

# specify virtual addresses of each code file
build/makerom.bin: TEXT_VADDR := 0x80000000
build/boot.bin:    TEXT_VADDR := 0x80001060


#### Main Targets ###

compare: $(ROM)
	@md5sum -c checksum.md5

clean:
	$(RM) $(ROM) $(ELF) $(MAP) -r build

$(ROM): $(ROM_FILES) file_list.txt
	$(MAKEROMFS) file_list.txt $@


#### Various Recipes ####

# create flat binary from object file
%.bin: %.o
	$(LD) -T ldscript.txt -Ttext $(TEXT_VADDR) $^ -o $@

# assemble code into object file
build/%.o: asm/%.s
	$(AS) $^ -o $@

# compress file
%.yaz0: %
	$(YAZ0) $< $@
