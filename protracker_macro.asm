** push and pops

PUSH        MACRO
            move.l     \1,-(sp)
            ENDM

POP         MACRO
            move.l     (sp)+,\1
            ENDM

PUSHM       MACRO
            movem.l    \1,-(sp)
            ENDM

POPM        MACRO
            movem.l    (sp)+,\1
            ENDM

PUSHMOST    MACRO
            movem.l    d0-a4,-(sp)
            ENDM

POPMOST     MACRO
            movem.l    (sp)+,d0-a4
            ENDM

PUSHALL     MACRO
            movem.l    d0-a6,-(sp)
            ENDM

POPALL      MACRO
            movem.l    (sp)+,d0-a6
            ENDM

RASON       MACRO
            IF         SHOW_RAS=1
            move.w     #\1,$dff180
            ENDIF
            ENDM

RASOFF      MACRO
            IF         SHOW_RAS=1
            move.w     #$000,$dff180
            ENDIF
            ENDM