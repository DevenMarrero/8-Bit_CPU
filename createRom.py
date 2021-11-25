NOP = 0xea
EEPROM_SIZE = 32768

code = bytearray([
    0xa9, 0xff,        # lda #$ff
    0x86, 0x02, 0x60  # sta $6002
])

rom = code + bytearray([NOP] * (EEPROM_SIZE - len(code)))

rom[0xffc] = 0x00
rom[0xffd] = 0x80

with open("rom.bin", "wb") as out_file:
    out_file.write(code)