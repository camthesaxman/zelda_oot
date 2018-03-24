.incbin "baserom.z64", 0x1060, 0x60F0

# some debug strings

.align 2, 0
.asciz "boot"

.align 2, 0
.asciz "idle"

.align 2, 0
.asciz "main"

.space 8

.align 2, 0
.asciz "??"

.space 4

.align 2, 0
.asciz "kanji"

.space 4

.align 2, 0
.asciz "link_animetion"

.align 2, 0
.asciz "../z_std_dma.c"

.align 2, 0
.asciz "../z_std_dma.c"

.align 2, 0
.asciz "../z_std_dma.c"

.align 2, 0
.asciz "../z_std_dma.c"

.align 2, 0
.asciz "../z_std_dma.c"

.align 2, 0
.asciz "dmamgr"

.space 4

.align 2, 0
.asciz "../z_locale.c"

### crash screen text ###

.align 2, 0
.asciz "OCARINA %08x %08x"

.align 2, 0
.asciz "LEGEND %08x %08x"

.align 2, 0
.asciz "ROM_F"

.align 2, 0
.asciz " [Creator:%s]"

.align 2, 0
.asciz "[Date:%s]"

# I love you, too!
.align 2, 0
.asciz "I LOVE YOU %08x"

.space 4

.align 2, 0
.asciz "head=%08x tail=%08x last=%08x used=%08x free=%08x [%s]\n"

.align 2, 0
.asciz "(null)"

.align 2, 0
.asciz "%s %d: range error %s(%f) < %s(%f) < %s(%f)\n"

.align 2, 0
.asciz "*** HungUp in thread %d, [%s:%d] ***\n"

.align 2, 0
.asciz "*** Reset ***\n"

.align 2, 0
.asciz "Reset"

.align 2, 0
.incbin "baserom.z64", 0x7310, 0xF0

# creator
.asciz "zelda@srd44"

# build date
.asciz "98-10-21 04:56:31"

.space 18
