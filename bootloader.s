.code16         # Set code generation to 16 bit mode
.align 2
.section .text
.macro Mputc ch
movw $0x0E\ch,%ax
int $0x10
.endm
.globl _start
_start:
#----------------
# - JFS -
  Mputc 2D
  Mputc 20  
  Mputc 4A
  Mputc 46
  Mputc 53
  Mputc 20
  Mputc 2D

  cld
  # movw $0,%ax
  # movw %ax,%ds # Datensegment initialisieren
  # ist offenbar auf 0 gesetzt, warum auch immer
  
  movw $bootmsg,%ax
  movw %ax,%si

print:        # Den String in ds:si ausgeben
  lodsb         # Zeichen von ds:si nach al
  cmpb $0,%al     # prüfe ob al == 0, wenn ja dann fertig
  je _wait
  movb $0x0E,%ah  # Bios-Interrupt für Ausgabe
  int $0x10
  jmp print

_wait:
  xorw %ax,%ax
  jmp _wait
#----------------

.section .data
bittenicht:
        .ascii "Das hier nicht anzeigen!"
        .byte 0x0A,0x0D,0x00
bootmsg: 
        .ascii " *** Jonas Forth System ***"
        .byte 0x0A,0x0D,0x00
enddata:

.org 0x0510-0x50
.byte 0xAA,0x55
