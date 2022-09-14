; Hello World example

; ROM routine for character output
CHPUT:  equ $00A2

	org 0x4000
        
; MSX cartridge header @ 0x4000 - 0x400f
	dw 0x4241
        dw Init
        dw Init
        dw 0
        dw 0
        dw 0
        dw 0
        dw 0
test macro aa
  if aa==1
   call CHPUT
  else 
   inc a
   call CHPUT
  endif
endm
putconst macro n
 ld a,n
 call CHPUT
endm
; initialize and print message
Init:
    ld hl, msg
    call puts
    jp Init	; loop forever
puts:               ; print 0-terminated string in HL
m1 macro 
  local p,brk
  p:
    ld a,(hl)
    or a
    jr z,brk
    test 2
    ;all CHPUT      ; displays one character in A
    inc hl
    halt
    jr p
  brk:
  putconst 13
  putconst 10
  ret
endm
  m1
; ASCII message + CR LF
msg:    defm "Hello, world?",0

