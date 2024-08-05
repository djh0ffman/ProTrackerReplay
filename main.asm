;---------------------------
;
; protracker replay test rig
; h0ffman
;
;---------------------------

    INCDIR     "include"
    INCLUDE    "hw.i"

    section    test,code_c
Main:
    lea        CUSTOM,a6
    move.w     #$7fff,DMACON(a6)
    move.w     #$7fff,INTENA(a6)
    move.w     #0,COLOR00(a6)

    move.w     #$c000,INTENA(a6)    ; enable master interrupt
    move.w     #$8200,DMACON(a6)    ; enable base DMA

    sub.l      a0,a0                ; vector base, go find it yourself
    moveq      #0,d1                ; 0 = pal / 1 = ntsc
    bsr        CIA_Install          ; install cia interrupts

    lea        mod,a0               ; module
    bsr        mt_init              ; init module

    st         mt_Enable            ; enable playback


.forever
    bra        .forever
    rts
    

    include    "protracker.asm"

mod:
    incbin     "failright.mod"