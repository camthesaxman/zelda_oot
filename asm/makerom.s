.section .text

### ROM Header ###

    .byte   0x80, 0x37, 0x12, 0x40 # PI BSD Domain 1 register
    .4byte 0x0000000F # clock rate setting
    .4byte EntryPoint # entry point
    .4byte 0x00001449 # release
    .4byte 0          # checksum1 (this will be set by makeromfs)
    .4byte 0          # checksum2 (this will be set by makeromfs)
    .4byte 0x00000000 # unknown
    .4byte 0x00000000 # unknown
    .ascii "THE LEGEND OF ZELDA " # ROM name: 20 bytes
    .4byte 0x00000000 # unknown
    .4byte 0x00000043 # cartridge
    .ascii "ZL"       # cartridge ID
    .ascii "E"        # country
    .byte  0x00       # version

boot:
.incbin "baserom.z64", 0x40, 0x3C0
boot_end:

EntryPoint:
.incbin "baserom.z64", 0x400, 0x1060-0x400
