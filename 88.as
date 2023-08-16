opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F883
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 2 "D:\project\DJS\sanse88+RS485\led.c"
	psect config,class=CONFIG,delta=2 ;#
# 2 "D:\project\DJS\sanse88+RS485\led.c"
	dw 0x23a2 ;#
# 3 "D:\project\DJS\sanse88+RS485\led.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "D:\project\DJS\sanse88+RS485\led.c"
	dw 0xffff ;#
	FNCALL	_main,_ioinit
	FNCALL	_main,_change_DM13H
	FNCALL	_main,_red_displaying_end
	FNCALL	_main,_gre_displaying_end
	FNCALL	_main,_yel_displaying_end
	FNCALL	_main,_timer1init
	FNCALL	_main,_usartinit
	FNCALL	_main,_addr_read
	FNCALL	_main,_filterAC_DC
	FNCALL	_main,_seek_down_pulse
	FNCALL	_main,_study_mode_filterAC_DC
	FNCALL	_main,_study_mode_time_calculation
	FNCALL	_main,_down_time_display
	FNCALL	_main,_lamp_err_state_check
	FNCALL	_main,_communication_err
	FNCALL	_main,_g_segment_afresh_analyse
	FNCALL	_main,_usart_data_analyse
	FNCALL	_main,_G_Segment_Wink
	FNCALL	_G_Segment_Wink,_g_segment_displaying
	FNCALL	_G_Segment_Wink,_gre_displaying_end
	FNCALL	_down_time_display,_red_displaying_end
	FNCALL	_down_time_display,_syn_wink_manage
	FNCALL	_down_time_display,_yel_displaying_end
	FNCALL	_down_time_display,_gre_displaying_end
	FNCALL	_communication_err,_red_displaying_end
	FNCALL	_usart_data_analyse,___wmul
	FNCALL	_usart_data_analyse,_red_displaying_end
	FNCALL	_usart_data_analyse,_gre_displaying_end
	FNCALL	_usart_data_analyse,_yel_displaying_end
	FNCALL	_usart_data_analyse,_yel_displaying
	FNCALL	_usart_data_analyse,_gre_displaying
	FNCALL	_usart_data_analyse,_red_displaying
	FNCALL	_usart_data_analyse,_addr_write
	FNCALL	_usart_data_analyse,_addr_read
	FNCALL	_study_mode_time_calculation,___lwdiv
	FNCALL	_study_mode_time_calculation,_red_displaying_end
	FNCALL	_study_mode_time_calculation,_yel_displaying_end
	FNCALL	_study_mode_time_calculation,_gre_displaying_end
	FNCALL	_syn_wink_manage,_red_displaying
	FNCALL	_syn_wink_manage,_yel_displaying
	FNCALL	_syn_wink_manage,_gre_displaying
	FNCALL	_syn_wink_manage,_red_displaying_end
	FNCALL	_g_segment_displaying,_red_displaydrv
	FNCALL	_g_segment_displaying,_yel_displaydrv
	FNCALL	_g_segment_displaying,_gre_displaydrv
	FNCALL	_g_segment_displaying,_gre_displaying_end
	FNCALL	_seek_down_pulse,___lwdiv
	FNCALL	_gre_displaying_end,_gre_displaydrv
	FNCALL	_gre_displaying,___lbdiv
	FNCALL	_gre_displaying,___lbmod
	FNCALL	_gre_displaying,_gre_displaydrv
	FNCALL	_yel_displaying_end,_yel_displaydrv
	FNCALL	_yel_displaying,___lbdiv
	FNCALL	_yel_displaying,___lbmod
	FNCALL	_yel_displaying,_yel_displaydrv
	FNCALL	_red_displaying_end,_red_displaydrv
	FNCALL	_red_displaying,___lbdiv
	FNCALL	_red_displaying,___lbmod
	FNCALL	_red_displaying,_red_displaydrv
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_GREWORDS
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	115
_GREWORDS:
	retlw	0FCh
	retlw	03Fh

	retlw	0
	retlw	0Fh

	retlw	0F3h
	retlw	03Ch

	retlw	0C3h
	retlw	03Fh

	retlw	0Fh
	retlw	0Fh

	retlw	0CFh
	retlw	033h

	retlw	0FFh
	retlw	033h

	retlw	0
	retlw	03Fh

	retlw	0FFh
	retlw	03Fh

	retlw	0CFh
	retlw	03Fh

	retlw	0
	retlw	0

	retlw	03h
	retlw	0

	global	_REDWORDS
psect	strings
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	114
_REDWORDS:
	retlw	0A8h
	retlw	02Ah

	retlw	0
	retlw	0Ah

	retlw	0A2h
	retlw	028h

	retlw	082h
	retlw	02Ah

	retlw	0Ah
	retlw	0Ah

	retlw	08Ah
	retlw	022h

	retlw	0AAh
	retlw	022h

	retlw	0
	retlw	02Ah

	retlw	0AAh
	retlw	02Ah

	retlw	08Ah
	retlw	02Ah

	retlw	0
	retlw	0

	retlw	02h
	retlw	0

	global	_YELWORDS
psect	strings
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	116
_YELWORDS:
	retlw	0A8h
	retlw	02Ah

	retlw	0
	retlw	0Ah

	retlw	0A2h
	retlw	028h

	retlw	082h
	retlw	02Ah

	retlw	0Ah
	retlw	0Ah

	retlw	08Ah
	retlw	022h

	retlw	0AAh
	retlw	022h

	retlw	0
	retlw	02Ah

	retlw	0AAh
	retlw	02Ah

	retlw	08Ah
	retlw	02Ah

	retlw	0
	retlw	0

	retlw	01h
	retlw	0

	global	_GREWORDS
	global	_REDWORDS
	global	_YELWORDS
	global	_current_study_counter
	global	_display_data
	global	_previous_study_counter
	global	_lamp_chge_counter
	global	_study_chge_counter
	global	_TFG
	global	_address_of_lamp
	global	_communication_counter
	global	_communication_flag
	global	_displaying_second_counter
	global	_every_second_update_counter
	global	_every_second_update_delay
	global	_every_second_update_flag
	global	_g_segment_100ms_counter
	global	_g_segment_afresh_counter
	global	_g_segment_wink_display_flag
	global	_g_segment_wink_state_flag
	global	_g_segment_wink_time_counter
	global	_gre_displaying_flag
	global	_lamp_counter_valid_flag
	global	_lamp_off_flag
	global	_lamp_on_flag
	global	_lamp_stab_state
	global	_lamp_temp_state
	global	_ledstate
	global	_no_lamp_on_counter
	global	_pulse_down_time_valid_flag
	global	_pulse_study_time_flag
	global	_pulse_to_study
	global	_red_displaying_flag
	global	_restart_flag
	global	_sametime_on_counter
	global	_study_or_pulse_mode
	global	_study_time_flag
	global	_study_time_valid_flag
	global	_study_to_pulse
	global	_study_to_pulse_flag
	global	_syn_wink_display_state
	global	_syn_wink_display_updata
	global	_ten_mm_counter
	global	_usart_rx_read
	global	_usart_rx_write
	global	_wdtcounter
	global	_yel_displaying_flag
	global	_g_segment_afresh_number
	global	_g_segment_afresh_state
	global	_study_lamp_stab_state
	global	_usart_rx_buffer
	global	_lamp_off_counter
	global	_lamp_on_counter
	global	_pulse_down_times
	global	_pulse_study_time_counter
	global	_lamp_off_time
	global	_usart_temp_buffer
	global	_PIR1
_PIR1	set	12
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_RCREG
_RCREG	set	26
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_OERR
_OERR	set	193
	global	_PEIE
_PEIE	set	94
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RC5
_RC5	set	61
	global	_RCIF
_RCIF	set	101
	global	_RX9
_RX9	set	198
	global	_SPEN
_SPEN	set	199
	global	_TMR1IF
_TMR1IF	set	96
	global	_OSCCON
_OSCCON	set	143
	global	_SPBRG
_SPBRG	set	153
	global	_SPBRGH
_SPBRGH	set	154
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_BRGH
_BRGH	set	1218
	global	_PSA
_PSA	set	1035
	global	_RCIE
_RCIE	set	1125
	global	_SYNC
_SYNC	set	1220
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_TX9
_TX9	set	1222
	global	_TXEN
_TXEN	set	1221
	global	_TXIE
_TXIE	set	1124
	global	_nRBPU
_nRBPU	set	1039
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_WDTCON
_WDTCON	set	261
	global	_ANSEL
_ANSEL	set	392
	global	_ANSELH
_ANSELH	set	393
	global	_EECON2
_EECON2	set	397
	global	_BRG16
_BRG16	set	3131
	global	_EEPGD
_EEPGD	set	3175
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"88.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_g_segment_afresh_number:
       ds      1

_g_segment_afresh_state:
       ds      1

_study_lamp_stab_state:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_current_study_counter:
       ds      6

_display_data:
       ds      6

_previous_study_counter:
       ds      6

_lamp_chge_counter:
       ds      3

_study_chge_counter:
       ds      3

_TFG:
       ds      1

_address_of_lamp:
       ds      1

_communication_counter:
       ds      1

_communication_flag:
       ds      1

_displaying_second_counter:
       ds      1

_every_second_update_counter:
       ds      1

_every_second_update_delay:
       ds      1

_every_second_update_flag:
       ds      1

_g_segment_100ms_counter:
       ds      1

_g_segment_afresh_counter:
       ds      1

_g_segment_wink_display_flag:
       ds      1

_g_segment_wink_state_flag:
       ds      1

_g_segment_wink_time_counter:
       ds      1

_gre_displaying_flag:
       ds      1

_lamp_counter_valid_flag:
       ds      1

_lamp_off_flag:
       ds      1

_lamp_on_flag:
       ds      1

_lamp_stab_state:
       ds      1

_lamp_temp_state:
       ds      1

_ledstate:
       ds      1

_no_lamp_on_counter:
       ds      1

_pulse_down_time_valid_flag:
       ds      1

_pulse_study_time_flag:
       ds      1

_pulse_to_study:
       ds      1

_red_displaying_flag:
       ds      1

_restart_flag:
       ds      1

_sametime_on_counter:
       ds      1

_study_or_pulse_mode:
       ds      1

_study_time_flag:
       ds      1

_study_time_valid_flag:
       ds      1

_study_to_pulse:
       ds      1

_study_to_pulse_flag:
       ds      1

_syn_wink_display_state:
       ds      1

_syn_wink_display_updata:
       ds      1

_ten_mm_counter:
       ds      1

_usart_rx_read:
       ds      1

_usart_rx_write:
       ds      1

_wdtcounter:
       ds      1

_yel_displaying_flag:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_usart_rx_buffer:
       ds      30

_lamp_off_counter:
       ds      6

_lamp_on_counter:
       ds      6

_pulse_down_times:
       ds      6

_pulse_study_time_counter:
       ds      6

_lamp_off_time:
       ds      3

_usart_temp_buffer:
       ds      7

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+03Fh)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+040h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	main@i
main@i:	; 2 bytes @ 0x0
	ds	2
	global	main@k
main@k:	; 1 bytes @ 0x2
	ds	1
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_change_DM13H
?_change_DM13H:	; 0 bytes @ 0x0
	global	?_ioinit
?_ioinit:	; 0 bytes @ 0x0
	global	?_addr_write
?_addr_write:	; 0 bytes @ 0x0
	global	?_usartinit
?_usartinit:	; 0 bytes @ 0x0
	global	?_timer1init
?_timer1init:	; 0 bytes @ 0x0
	global	?_red_displaying_end
?_red_displaying_end:	; 0 bytes @ 0x0
	global	?_yel_displaying_end
?_yel_displaying_end:	; 0 bytes @ 0x0
	global	?_gre_displaying_end
?_gre_displaying_end:	; 0 bytes @ 0x0
	global	?_g_segment_displaying
?_g_segment_displaying:	; 0 bytes @ 0x0
	global	?_syn_wink_manage
?_syn_wink_manage:	; 0 bytes @ 0x0
	global	?_down_time_display
?_down_time_display:	; 0 bytes @ 0x0
	global	?_filterAC_DC
?_filterAC_DC:	; 0 bytes @ 0x0
	global	?_seek_down_pulse
?_seek_down_pulse:	; 0 bytes @ 0x0
	global	?_study_mode_filterAC_DC
?_study_mode_filterAC_DC:	; 0 bytes @ 0x0
	global	?_study_mode_time_calculation
?_study_mode_time_calculation:	; 0 bytes @ 0x0
	global	?_lamp_err_state_check
?_lamp_err_state_check:	; 0 bytes @ 0x0
	global	?_G_Segment_Wink
?_G_Segment_Wink:	; 0 bytes @ 0x0
	global	?_g_segment_afresh_analyse
?_g_segment_afresh_analyse:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_usart_data_analyse
?_usart_data_analyse:	; 0 bytes @ 0x0
	global	?_communication_err
?_communication_err:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_addr_read
?_addr_read:	; 1 bytes @ 0x0
	ds	3
	global	??_change_DM13H
??_change_DM13H:	; 0 bytes @ 0x3
	global	??_ioinit
??_ioinit:	; 0 bytes @ 0x3
	global	??_addr_read
??_addr_read:	; 0 bytes @ 0x3
	global	??_addr_write
??_addr_write:	; 0 bytes @ 0x3
	global	??_usartinit
??_usartinit:	; 0 bytes @ 0x3
	global	??_timer1init
??_timer1init:	; 0 bytes @ 0x3
	global	?_red_displaydrv
?_red_displaydrv:	; 0 bytes @ 0x3
	global	?_yel_displaydrv
?_yel_displaydrv:	; 0 bytes @ 0x3
	global	?_gre_displaydrv
?_gre_displaydrv:	; 0 bytes @ 0x3
	global	??_filterAC_DC
??_filterAC_DC:	; 0 bytes @ 0x3
	global	??_study_mode_filterAC_DC
??_study_mode_filterAC_DC:	; 0 bytes @ 0x3
	global	??_lamp_err_state_check
??_lamp_err_state_check:	; 0 bytes @ 0x3
	global	?___lbdiv
?___lbdiv:	; 1 bytes @ 0x3
	global	?___lbmod
?___lbmod:	; 1 bytes @ 0x3
	global	?___wmul
?___wmul:	; 2 bytes @ 0x3
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x3
	global	change_DM13H@ss
change_DM13H@ss:	; 1 bytes @ 0x3
	global	ioinit@i
ioinit@i:	; 1 bytes @ 0x3
	global	addr_write@indata
addr_write@indata:	; 1 bytes @ 0x3
	global	study_mode_filterAC_DC@temp_var2
study_mode_filterAC_DC@temp_var2:	; 1 bytes @ 0x3
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0x3
	global	___lbmod@divisor
___lbmod@divisor:	; 1 bytes @ 0x3
	global	red_displaydrv@drvword
red_displaydrv@drvword:	; 2 bytes @ 0x3
	global	yel_displaydrv@drvword
yel_displaydrv@drvword:	; 2 bytes @ 0x3
	global	gre_displaydrv@drvword
gre_displaydrv@drvword:	; 2 bytes @ 0x3
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x3
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x3
	ds	1
	global	??___lbdiv
??___lbdiv:	; 0 bytes @ 0x4
	global	??___lbmod
??___lbmod:	; 0 bytes @ 0x4
	global	change_DM13H@temp
change_DM13H@temp:	; 1 bytes @ 0x4
	global	filterAC_DC@temp_var1
filterAC_DC@temp_var1:	; 1 bytes @ 0x4
	global	study_mode_filterAC_DC@temp_var3
study_mode_filterAC_DC@temp_var3:	; 1 bytes @ 0x4
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0x4
	ds	1
	global	??_red_displaydrv
??_red_displaydrv:	; 0 bytes @ 0x5
	global	??_yel_displaydrv
??_yel_displaydrv:	; 0 bytes @ 0x5
	global	??_gre_displaydrv
??_gre_displaydrv:	; 0 bytes @ 0x5
	global	change_DM13H@i
change_DM13H@i:	; 1 bytes @ 0x5
	global	filterAC_DC@temp_var2
filterAC_DC@temp_var2:	; 1 bytes @ 0x5
	global	study_mode_filterAC_DC@temp_var1
study_mode_filterAC_DC@temp_var1:	; 1 bytes @ 0x5
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x5
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0x5
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x5
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x5
	ds	1
	global	change_DM13H@k
change_DM13H@k:	; 1 bytes @ 0x6
	global	filterAC_DC@i
filterAC_DC@i:	; 1 bytes @ 0x6
	global	study_mode_filterAC_DC@i
study_mode_filterAC_DC@i:	; 1 bytes @ 0x6
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x6
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x6
	ds	1
	global	??_red_displaying_end
??_red_displaying_end:	; 0 bytes @ 0x7
	global	??_yel_displaying_end
??_yel_displaying_end:	; 0 bytes @ 0x7
	global	??_gre_displaying_end
??_gre_displaying_end:	; 0 bytes @ 0x7
	global	??___wmul
??___wmul:	; 0 bytes @ 0x7
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x7
	global	red_displaying_end@k
red_displaying_end@k:	; 1 bytes @ 0x7
	global	yel_displaying_end@k
yel_displaying_end@k:	; 1 bytes @ 0x7
	global	gre_displaying_end@k
gre_displaying_end@k:	; 1 bytes @ 0x7
	global	___lbmod@rem
___lbmod@rem:	; 1 bytes @ 0x7
	ds	1
	global	??_red_displaying
??_red_displaying:	; 0 bytes @ 0x8
	global	??_yel_displaying
??_yel_displaying:	; 0 bytes @ 0x8
	global	??_gre_displaying
??_gre_displaying:	; 0 bytes @ 0x8
	global	??_g_segment_displaying
??_g_segment_displaying:	; 0 bytes @ 0x8
	global	??_down_time_display
??_down_time_display:	; 0 bytes @ 0x8
	global	??_G_Segment_Wink
??_G_Segment_Wink:	; 0 bytes @ 0x8
	global	??_communication_err
??_communication_err:	; 0 bytes @ 0x8
	global	??_main
??_main:	; 0 bytes @ 0x8
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_g_segment_afresh_analyse
??_g_segment_afresh_analyse:	; 0 bytes @ 0x0
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x0
	global	red_displaydrv@tempdata
red_displaydrv@tempdata:	; 2 bytes @ 0x0
	global	yel_displaydrv@tempdata
yel_displaydrv@tempdata:	; 2 bytes @ 0x0
	global	gre_displaydrv@tempdata
gre_displaydrv@tempdata:	; 2 bytes @ 0x0
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x0
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x1
	ds	1
	global	red_displaydrv@i
red_displaydrv@i:	; 1 bytes @ 0x2
	global	yel_displaydrv@i
yel_displaydrv@i:	; 1 bytes @ 0x2
	global	gre_displaydrv@i
gre_displaydrv@i:	; 1 bytes @ 0x2
	ds	1
	global	??_seek_down_pulse
??_seek_down_pulse:	; 0 bytes @ 0x3
	global	red_displaydrv@k
red_displaydrv@k:	; 1 bytes @ 0x3
	global	yel_displaydrv@k
yel_displaydrv@k:	; 1 bytes @ 0x3
	global	gre_displaydrv@k
gre_displaydrv@k:	; 1 bytes @ 0x3
	ds	1
	global	?_red_displaying
?_red_displaying:	; 0 bytes @ 0x4
	global	?_yel_displaying
?_yel_displaying:	; 0 bytes @ 0x4
	global	?_gre_displaying
?_gre_displaying:	; 0 bytes @ 0x4
	global	??_study_mode_time_calculation
??_study_mode_time_calculation:	; 0 bytes @ 0x4
	global	g_segment_displaying@number
g_segment_displaying@number:	; 1 bytes @ 0x4
	global	red_displaying@number
red_displaying@number:	; 2 bytes @ 0x4
	global	yel_displaying@number
yel_displaying@number:	; 2 bytes @ 0x4
	global	gre_displaying@number
gre_displaying@number:	; 2 bytes @ 0x4
	ds	1
	global	g_segment_displaying@k
g_segment_displaying@k:	; 1 bytes @ 0x5
	global	seek_down_pulse@temp_var3
seek_down_pulse@temp_var3:	; 1 bytes @ 0x5
	ds	1
	global	red_displaying@temp_red_var1
red_displaying@temp_red_var1:	; 1 bytes @ 0x6
	global	yel_displaying@temp_yel_var1
yel_displaying@temp_yel_var1:	; 1 bytes @ 0x6
	global	gre_displaying@temp_gre_var1
gre_displaying@temp_gre_var1:	; 1 bytes @ 0x6
	global	seek_down_pulse@temp_var1
seek_down_pulse@temp_var1:	; 1 bytes @ 0x6
	global	G_Segment_Wink@temp_data2
G_Segment_Wink@temp_data2:	; 1 bytes @ 0x6
	ds	1
	global	red_displaying@temp_red_var0
red_displaying@temp_red_var0:	; 1 bytes @ 0x7
	global	yel_displaying@temp_yel_var0
yel_displaying@temp_yel_var0:	; 1 bytes @ 0x7
	global	gre_displaying@temp_gre_var0
gre_displaying@temp_gre_var0:	; 1 bytes @ 0x7
	global	seek_down_pulse@i
seek_down_pulse@i:	; 1 bytes @ 0x7
	global	G_Segment_Wink@i
G_Segment_Wink@i:	; 1 bytes @ 0x7
	ds	1
	global	red_displaying@temp_red_var2
red_displaying@temp_red_var2:	; 1 bytes @ 0x8
	global	yel_displaying@temp_yel_var2
yel_displaying@temp_yel_var2:	; 1 bytes @ 0x8
	global	gre_displaying@temp_gre_var2
gre_displaying@temp_gre_var2:	; 1 bytes @ 0x8
	global	G_Segment_Wink@temp_data1
G_Segment_Wink@temp_data1:	; 1 bytes @ 0x8
	global	study_mode_time_calculation@temp_var2
study_mode_time_calculation@temp_var2:	; 2 bytes @ 0x8
	ds	1
	global	??_syn_wink_manage
??_syn_wink_manage:	; 0 bytes @ 0x9
	global	??_usart_data_analyse
??_usart_data_analyse:	; 0 bytes @ 0x9
	ds	1
	global	syn_wink_manage@tempdata
syn_wink_manage@tempdata:	; 1 bytes @ 0xA
	global	study_mode_time_calculation@temp_var1
study_mode_time_calculation@temp_var1:	; 1 bytes @ 0xA
	ds	1
	global	syn_wink_manage@channel
syn_wink_manage@channel:	; 1 bytes @ 0xB
	global	study_mode_time_calculation@i
study_mode_time_calculation@i:	; 1 bytes @ 0xB
	global	usart_data_analyse@CheckSum
usart_data_analyse@CheckSum:	; 1 bytes @ 0xB
	ds	1
	global	usart_data_analyse@TableLength
usart_data_analyse@TableLength:	; 1 bytes @ 0xC
	ds	1
	global	usart_data_analyse@temp_pointer
usart_data_analyse@temp_pointer:	; 1 bytes @ 0xD
	ds	1
	global	usart_data_analyse@down_time
usart_data_analyse@down_time:	; 2 bytes @ 0xE
	ds	2
	global	usart_data_analyse@k
usart_data_analyse@k:	; 1 bytes @ 0x10
	ds	1
;;Data sizes: Strings 0, constant 72, data 0, bss 130, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8      11
;; BANK0           80     17      80
;; BANK1           80      3      67
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_red_displaying_end
;;   _main->_gre_displaying_end
;;   _main->_yel_displaying_end
;;   _G_Segment_Wink->_gre_displaying_end
;;   _down_time_display->_red_displaying_end
;;   _down_time_display->_yel_displaying_end
;;   _down_time_display->_gre_displaying_end
;;   _communication_err->_red_displaying_end
;;   _usart_data_analyse->_red_displaying_end
;;   _usart_data_analyse->_gre_displaying_end
;;   _usart_data_analyse->_yel_displaying_end
;;   _study_mode_time_calculation->_red_displaying_end
;;   _study_mode_time_calculation->_yel_displaying_end
;;   _study_mode_time_calculation->_gre_displaying_end
;;   _syn_wink_manage->_red_displaying_end
;;   _g_segment_displaying->_gre_displaying_end
;;   _seek_down_pulse->___lwdiv
;;   _gre_displaying_end->_gre_displaydrv
;;   _gre_displaying->___lbmod
;;   _yel_displaying_end->_yel_displaydrv
;;   _yel_displaying->___lbmod
;;   _red_displaying_end->_red_displaydrv
;;   _red_displaying->___lbmod
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_usart_data_analyse
;;   _G_Segment_Wink->_g_segment_displaying
;;   _down_time_display->_syn_wink_manage
;;   _usart_data_analyse->_yel_displaying
;;   _usart_data_analyse->_gre_displaying
;;   _usart_data_analyse->_red_displaying
;;   _syn_wink_manage->_red_displaying
;;   _syn_wink_manage->_yel_displaying
;;   _syn_wink_manage->_gre_displaying
;;   _g_segment_displaying->_red_displaydrv
;;   _g_segment_displaying->_yel_displaydrv
;;   _g_segment_displaying->_gre_displaydrv
;;   _seek_down_pulse->___lwdiv
;;   _gre_displaying_end->_gre_displaydrv
;;   _gre_displaying->_gre_displaydrv
;;   _yel_displaying_end->_yel_displaydrv
;;   _yel_displaying->_yel_displaydrv
;;   _red_displaying_end->_red_displaydrv
;;   _red_displaying->_red_displaydrv
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0   22619
;;                                              0 BANK1      3     3      0
;;                             _ioinit
;;                       _change_DM13H
;;                 _red_displaying_end
;;                 _gre_displaying_end
;;                 _yel_displaying_end
;;                         _timer1init
;;                          _usartinit
;;                          _addr_read
;;                        _filterAC_DC
;;                    _seek_down_pulse
;;             _study_mode_filterAC_DC
;;        _study_mode_time_calculation
;;                  _down_time_display
;;               _lamp_err_state_check
;;                  _communication_err
;;           _g_segment_afresh_analyse
;;                 _usart_data_analyse
;;                     _G_Segment_Wink
;; ---------------------------------------------------------------------------------
;; (1) _G_Segment_Wink                                       3     3      0    2161
;;                                              6 BANK0      3     3      0
;;               _g_segment_displaying
;;                 _gre_displaying_end
;; ---------------------------------------------------------------------------------
;; (1) _down_time_display                                    4     4      0    4808
;;                 _red_displaying_end
;;                    _syn_wink_manage
;;                 _yel_displaying_end
;;                 _gre_displaying_end
;; ---------------------------------------------------------------------------------
;; (1) _communication_err                                    0     0      0     340
;;                 _red_displaying_end
;; ---------------------------------------------------------------------------------
;; (1) _usart_data_analyse                                   8     8      0    5036
;;                                              9 BANK0      8     8      0
;;                             ___wmul
;;                 _red_displaying_end
;;                 _gre_displaying_end
;;                 _yel_displaying_end
;;                     _yel_displaying
;;                     _gre_displaying
;;                     _red_displaying
;;                         _addr_write
;;                          _addr_read
;; ---------------------------------------------------------------------------------
;; (1) _study_mode_time_calculation                          8     8      0    3548
;;                                              4 BANK0      8     8      0
;;                            ___lwdiv
;;                 _red_displaying_end
;;                 _yel_displaying_end
;;                 _gre_displaying_end
;; ---------------------------------------------------------------------------------
;; (2) _syn_wink_manage                                      3     3      0    3788
;;                                              9 BANK0      3     3      0
;;                     _red_displaying
;;                     _yel_displaying
;;                     _gre_displaying
;;                 _red_displaying_end
;; ---------------------------------------------------------------------------------
;; (2) _g_segment_displaying                                 2     2      0    1391
;;                                              4 BANK0      2     2      0
;;                     _red_displaydrv
;;                     _yel_displaydrv
;;                     _gre_displaydrv
;;                 _gre_displaying_end
;; ---------------------------------------------------------------------------------
;; (1) _seek_down_pulse                                      5     5      0    1592
;;                                              3 BANK0      5     5      0
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (2) _gre_displaying_end                                   1     1      0     340
;;                                              7 COMMON     1     1      0
;;                     _gre_displaydrv
;; ---------------------------------------------------------------------------------
;; (2) _gre_displaying                                       5     3      2    1045
;;                                              4 BANK0      5     3      2
;;                            ___lbdiv
;;                            ___lbmod
;;                     _gre_displaydrv
;; ---------------------------------------------------------------------------------
;; (2) _yel_displaying_end                                   1     1      0     340
;;                                              7 COMMON     1     1      0
;;                     _yel_displaydrv
;; ---------------------------------------------------------------------------------
;; (2) _yel_displaying                                       5     3      2    1045
;;                                              4 BANK0      5     3      2
;;                            ___lbdiv
;;                            ___lbmod
;;                     _yel_displaydrv
;; ---------------------------------------------------------------------------------
;; (2) _red_displaying_end                                   1     1      0     340
;;                                              7 COMMON     1     1      0
;;                     _red_displaydrv
;; ---------------------------------------------------------------------------------
;; (2) _red_displaying                                       5     3      2    1045
;;                                              4 BANK0      5     3      2
;;                            ___lbdiv
;;                            ___lbmod
;;                     _red_displaydrv
;; ---------------------------------------------------------------------------------
;; (2) _addr_read                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) ___lbmod                                              5     4      1     232
;;                                              3 COMMON     5     4      1
;; ---------------------------------------------------------------------------------
;; (3) ___lbdiv                                              4     3      1     241
;;                                              3 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (2) ___lwdiv                                              7     3      4     241
;;                                              3 COMMON     4     0      4
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) ___wmul                                               6     2      4     136
;;                                              3 COMMON     4     0      4
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _g_segment_afresh_analyse                             8     8      0       0
;;                                              0 BANK0      6     6      0
;; ---------------------------------------------------------------------------------
;; (1) _lamp_err_state_check                                 2     2      0       0
;;                                              3 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _study_mode_filterAC_DC                               4     4      0     672
;;                                              3 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _filterAC_DC                                          4     4      0     542
;;                                              3 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (3) _gre_displaydrv                                       8     6      2     272
;;                                              3 COMMON     4     2      2
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; (3) _yel_displaydrv                                       8     6      2     272
;;                                              3 COMMON     4     2      2
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; (3) _red_displaydrv                                       8     6      2     272
;;                                              3 COMMON     4     2      2
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _timer1init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _usartinit                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _addr_write                                           1     1      0      31
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _ioinit                                               1     1      0     378
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _change_DM13H                                         4     4      0    2386
;;                                              3 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _ISR                                                  3     3      0       0
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _ioinit
;;   _change_DM13H
;;   _red_displaying_end
;;     _red_displaydrv
;;   _gre_displaying_end
;;     _gre_displaydrv
;;   _yel_displaying_end
;;     _yel_displaydrv
;;   _timer1init
;;   _usartinit
;;   _addr_read
;;   _filterAC_DC
;;   _seek_down_pulse
;;     ___lwdiv
;;   _study_mode_filterAC_DC
;;   _study_mode_time_calculation
;;     ___lwdiv
;;     _red_displaying_end
;;       _red_displaydrv
;;     _yel_displaying_end
;;       _yel_displaydrv
;;     _gre_displaying_end
;;       _gre_displaydrv
;;   _down_time_display
;;     _red_displaying_end
;;       _red_displaydrv
;;     _syn_wink_manage
;;       _red_displaying
;;         ___lbdiv
;;         ___lbmod
;;         _red_displaydrv
;;       _yel_displaying
;;         ___lbdiv
;;         ___lbmod
;;         _yel_displaydrv
;;       _gre_displaying
;;         ___lbdiv
;;         ___lbmod
;;         _gre_displaydrv
;;       _red_displaying_end
;;         _red_displaydrv
;;     _yel_displaying_end
;;       _yel_displaydrv
;;     _gre_displaying_end
;;       _gre_displaydrv
;;   _lamp_err_state_check
;;   _communication_err
;;     _red_displaying_end
;;       _red_displaydrv
;;   _g_segment_afresh_analyse
;;   _usart_data_analyse
;;     ___wmul
;;     _red_displaying_end
;;       _red_displaydrv
;;     _gre_displaying_end
;;       _gre_displaydrv
;;     _yel_displaying_end
;;       _yel_displaydrv
;;     _yel_displaying
;;       ___lbdiv
;;       ___lbmod
;;       _yel_displaydrv
;;     _gre_displaying
;;       ___lbdiv
;;       ___lbmod
;;       _gre_displaydrv
;;     _red_displaying
;;       ___lbdiv
;;       ___lbmod
;;       _red_displaydrv
;;     _addr_write
;;     _addr_read
;;   _G_Segment_Wink
;;     _g_segment_displaying
;;       _red_displaydrv
;;       _yel_displaydrv
;;       _gre_displaydrv
;;       _gre_displaying_end
;;         _gre_displaydrv
;;     _gre_displaying_end
;;       _gre_displaydrv
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       B       1       78.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50     11      50       3      100.0%
;;BITBANK1            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK1               50      3      43       5       83.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;BANK2               50      0       0       7        0.0%
;;ABS                  0      0      9E       8        0.0%
;;BITBANK0            50      0       0       9        0.0%
;;DATA                 0      0      A2      10        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 1670 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0[BANK1 ] unsigned int 
;;  k               1    2[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       3       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ioinit
;;		_change_DM13H
;;		_red_displaying_end
;;		_gre_displaying_end
;;		_yel_displaying_end
;;		_timer1init
;;		_usartinit
;;		_addr_read
;;		_filterAC_DC
;;		_seek_down_pulse
;;		_study_mode_filterAC_DC
;;		_study_mode_time_calculation
;;		_down_time_display
;;		_lamp_err_state_check
;;		_communication_err
;;		_g_segment_afresh_analyse
;;		_usart_data_analyse
;;		_G_Segment_Wink
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	1670
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	1674
	
l9557:	
;led.c: 1671: unsigned char k;
;led.c: 1672: unsigned int i;
;led.c: 1674: for(k=0;k<2;k++)
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@k)^080h
	line	1676
	
l9563:	
;led.c: 1675: {
;led.c: 1676: ioinit();
	fcall	_ioinit
	line	1677
	
l9565:	
;led.c: 1677: change_DM13H();
	fcall	_change_DM13H
	line	1678
	
l9567:	
;led.c: 1678: RB4=0;
	bcf	(52/8),(52)&7
	line	1679
	
l9569:	
;led.c: 1679: red_displaying_end();
	fcall	_red_displaying_end
	line	1680
	
l9571:	
;led.c: 1680: gre_displaying_end();
	fcall	_gre_displaying_end
	line	1681
	
l9573:	
;led.c: 1681: yel_displaying_end();
	fcall	_yel_displaying_end
	line	1682
	
l9575:	
;led.c: 1682: for(i=0;i<6000;i++);
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@i)^080h
	clrf	(main@i+1)^080h
	
l9581:	
	incf	(main@i)^080h,f
	skipnz
	incf	(main@i+1)^080h,f
	
l9583:	
	movlw	high(01770h)
	subwf	(main@i+1)^080h,w
	movlw	low(01770h)
	skipnz
	subwf	(main@i)^080h,w
	skipc
	goto	u7631
	goto	u7630
u7631:
	goto	l9581
u7630:
	line	1674
	
l9585:	
	incf	(main@k)^080h,f
	
l9587:	
	movlw	(02h)
	subwf	(main@k)^080h,w
	skipc
	goto	u7641
	goto	u7640
u7641:
	goto	l9563
u7640:
	line	1684
	
l9589:	
;led.c: 1683: }
;led.c: 1684: timer1init();
	fcall	_timer1init
	line	1685
;led.c: 1685: usartinit();
	fcall	_usartinit
	line	1686
	
l9591:	
;led.c: 1686: address_of_lamp = addr_read();
	fcall	_addr_read
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_address_of_lamp)
	line	1687
	
l9593:	
;led.c: 1687: PSA = 0;WDTCON = 0X15;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1035/8)^080h,(1035)&7
	
l9595:	
	movlw	(015h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(261)^0100h	;volatile
	line	1691
	
l9597:	
;led.c: 1690: {
;led.c: 1691: if(TFG==1)
	bcf	status, 6	;RP1=0, select bank0
	decf	(_TFG),w
	skipz
	goto	u7651
	goto	u7650
u7651:
	goto	l9631
u7650:
	line	1693
	
l9599:	
;led.c: 1692: {
;led.c: 1693: TFG = 0;
	clrf	(_TFG)
	line	1695
	
l9601:	
;led.c: 1695: wdtcounter++;
	incf	(_wdtcounter),f
	line	1697
	
l9603:	
;led.c: 1697: g_segment_100ms_counter++;
	incf	(_g_segment_100ms_counter),f
	line	1699
	
l9605:	
;led.c: 1699: filterAC_DC();
	fcall	_filterAC_DC
	line	1700
	
l9607:	
;led.c: 1700: seek_down_pulse();
	fcall	_seek_down_pulse
	line	1702
	
l9609:	
;led.c: 1702: ten_mm_counter++;
	incf	(_ten_mm_counter),f
	line	1703
	
l9611:	
;led.c: 1703: if(ten_mm_counter >= 10)
	movlw	(0Ah)
	subwf	(_ten_mm_counter),w
	skipc
	goto	u7661
	goto	u7660
u7661:
	goto	l9629
u7660:
	line	1705
	
l9613:	
;led.c: 1704: {
;led.c: 1705: ten_mm_counter = 0;
	clrf	(_ten_mm_counter)
	line	1706
	
l9615:	
;led.c: 1706: study_mode_filterAC_DC();
	fcall	_study_mode_filterAC_DC
	line	1707
	
l9617:	
;led.c: 1707: study_mode_time_calculation();
	fcall	_study_mode_time_calculation
	line	1708
	
l9619:	
;led.c: 1708: down_time_display();
	fcall	_down_time_display
	line	1709
	
l9621:	
;led.c: 1709: lamp_err_state_check();
	fcall	_lamp_err_state_check
	line	1710
	
l9623:	
;led.c: 1710: if(every_second_update_flag == 1)
	decf	(_every_second_update_flag),w
	skipz
	goto	u7671
	goto	u7670
u7671:
	goto	l9627
u7670:
	line	1712
	
l9625:	
;led.c: 1711: {
;led.c: 1712: communication_err();
	fcall	_communication_err
	line	1714
	
l9627:	
;led.c: 1713: }
;led.c: 1714: g_segment_afresh_analyse();
	fcall	_g_segment_afresh_analyse
	line	1716
	
l9629:	
;led.c: 1715: }
;led.c: 1716: usart_data_analyse();
	fcall	_usart_data_analyse
	line	1719
	
l9631:	
;led.c: 1717: }
;led.c: 1719: if(wdtcounter >= 240)
	movlw	(0F0h)
	subwf	(_wdtcounter),w
	skipc
	goto	u7681
	goto	u7680
u7681:
	goto	l9645
u7680:
	line	1721
	
l9633:	
;led.c: 1720: {
;led.c: 1721: wdtcounter = 0;
	clrf	(_wdtcounter)
	line	1722
	
l9635:	
# 1722 "D:\project\DJS\sanse88+RS485\led.c"
clrwdt ;#
psect	maintext
	line	1724
	
l9637:	
;led.c: 1724: if(ledstate == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_ledstate),f
	skipz
	goto	u7691
	goto	u7690
u7691:
	goto	l1603
u7690:
	line	1726
	
l9639:	
;led.c: 1725: {
;led.c: 1726: RB6 = 0;
	bcf	(54/8),(54)&7
	line	1727
;led.c: 1727: ledstate=1;
	clrf	(_ledstate)
	incf	(_ledstate),f
	line	1728
;led.c: 1728: }
	goto	l9645
	line	1729
	
l1603:	
	line	1731
;led.c: 1729: else
;led.c: 1730: {
;led.c: 1731: RB6 = 1;
	bsf	(54/8),(54)&7
	line	1732
	
l9641:	
;led.c: 1732: ledstate = 0;
	clrf	(_ledstate)
	line	1733
	
l9643:	
;led.c: 1733: RC5=1;
	bsf	(61/8),(61)&7
	line	1738
	
l9645:	
;led.c: 1734: }
;led.c: 1736: }
;led.c: 1738: if(g_segment_100ms_counter >= 50)
	movlw	(032h)
	subwf	(_g_segment_100ms_counter),w
	skipc
	goto	u7701
	goto	u7700
u7701:
	goto	l9597
u7700:
	line	1740
	
l9647:	
;led.c: 1739: {
;led.c: 1740: g_segment_100ms_counter = 0;
	clrf	(_g_segment_100ms_counter)
	goto	l9597
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	1751
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_G_Segment_Wink
psect	text1016,local,class=CODE,delta=2
global __ptext1016
__ptext1016:

;; *************** function _G_Segment_Wink *****************
;; Defined at:
;;		line 1262 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp_data1      1    8[BANK0 ] unsigned char 
;;  i               1    7[BANK0 ] unsigned char 
;;  temp_data2      1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_g_segment_displaying
;;		_gre_displaying_end
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1016
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	1262
	global	__size_of_G_Segment_Wink
	__size_of_G_Segment_Wink	equ	__end_of_G_Segment_Wink-_G_Segment_Wink
	
_G_Segment_Wink:	
	opt	stack 3
; Regs used in _G_Segment_Wink: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	1266
	
l9493:	
;led.c: 1263: unsigned char i;
;led.c: 1264: unsigned char temp_data1;
;led.c: 1265: unsigned char temp_data2;
;led.c: 1266: if(communication_flag == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_communication_flag),f
	skipz
	goto	u7491
	goto	u7490
u7491:
	goto	l9555
u7490:
	line	1268
	
l9495:	
;led.c: 1267: {
;led.c: 1268: temp_data1 = 0x01;
	clrf	(G_Segment_Wink@temp_data1)
	incf	(G_Segment_Wink@temp_data1),f
	line	1269
	
l9497:	
;led.c: 1269: for(i=0;i<3;i++)
	clrf	(G_Segment_Wink@i)
	line	1271
	
l9503:	
;led.c: 1270: {
;led.c: 1271: temp_data2 = 0;
	clrf	(G_Segment_Wink@temp_data2)
	line	1272
	
l9505:	
;led.c: 1272: if(study_lamp_stab_state == ((~temp_data1)&0x07))
	comf	(G_Segment_Wink@temp_data1),w
	andlw	07h
	xorwf	(_study_lamp_stab_state),w
	skipz
	goto	u7501
	goto	u7500
u7501:
	goto	l9523
u7500:
	line	1274
	
l9507:	
;led.c: 1273: {
;led.c: 1274: if(study_or_pulse_mode != 0)
	movf	(_study_or_pulse_mode),w
	skipz
	goto	u7510
	goto	l9519
u7510:
	line	1276
	
l9509:	
;led.c: 1275: {
;led.c: 1276: if(i != 1)
	decf	(G_Segment_Wink@i),w
	skipnz
	goto	u7521
	goto	u7520
u7521:
	goto	l9515
u7520:
	line	1278
	
l9511:	
;led.c: 1277: {
;led.c: 1278: if((pulse_down_time_valid_flag&temp_data1)==0) temp_data2 = 1;
	movf	(_pulse_down_time_valid_flag),w
	andwf	(G_Segment_Wink@temp_data1),w
	btfss	status,2
	goto	u7531
	goto	u7530
u7531:
	goto	l1480
u7530:
	
l9513:	
	clrf	(G_Segment_Wink@temp_data2)
	incf	(G_Segment_Wink@temp_data2),f
	goto	l9523
	line	1282
	
l9515:	
;led.c: 1280: else
;led.c: 1281: {
;led.c: 1282: if((study_time_valid_flag&temp_data1)==0) temp_data2 = 1;
	movf	(_study_time_valid_flag),w
	andwf	(G_Segment_Wink@temp_data1),w
	btfss	status,2
	goto	u7541
	goto	u7540
u7541:
	goto	l1480
u7540:
	goto	l9513
	line	1287
	
l9519:	
;led.c: 1285: else
;led.c: 1286: {
;led.c: 1287: if((study_time_valid_flag&temp_data1)==0) temp_data2 = 1;
	movf	(_study_time_valid_flag),w
	andwf	(G_Segment_Wink@temp_data1),w
	btfss	status,2
	goto	u7551
	goto	u7550
u7551:
	goto	l9523
u7550:
	goto	l9513
	line	1288
	
l1480:	
	line	1291
	
l9523:	
;led.c: 1288: }
;led.c: 1289: }
;led.c: 1291: if(temp_data2 == 1)
	decf	(G_Segment_Wink@temp_data2),w
	skipz
	goto	u7561
	goto	u7560
u7561:
	goto	l9539
u7560:
	line	1293
	
l9525:	
	line	1294
	
l9527:	
;led.c: 1294: if(g_segment_wink_state_flag != temp_data1)
	movf	(_g_segment_wink_state_flag),w
	xorwf	(G_Segment_Wink@temp_data1),w
	skipnz
	goto	u7571
	goto	u7570
u7571:
	goto	l9533
u7570:
	line	1296
	
l9529:	
;led.c: 1295: {
;led.c: 1296: g_segment_wink_time_counter = 9;
	movlw	(09h)
	movwf	(_g_segment_wink_time_counter)
	line	1297
;led.c: 1297: g_segment_wink_state_flag = temp_data1;
	movf	(G_Segment_Wink@temp_data1),w
	movwf	(_g_segment_wink_state_flag)
	line	1298
	
l9531:	
;led.c: 1298: g_segment_wink_display_flag = 0;
	clrf	(_g_segment_wink_display_flag)
	line	1299
;led.c: 1299: }
	goto	l9541
	line	1302
	
l9533:	
;led.c: 1300: else
;led.c: 1301: {
;led.c: 1302: g_segment_wink_time_counter--;
	decf	(_g_segment_wink_time_counter),f
	line	1303
;led.c: 1303: if(g_segment_wink_time_counter == 0)
	movf	(_g_segment_wink_time_counter),f
	skipz
	goto	u7581
	goto	u7580
u7581:
	goto	l9541
u7580:
	line	1305
	
l9535:	
;led.c: 1304: {
;led.c: 1305: g_segment_wink_time_counter = 10;
	movlw	(0Ah)
	movwf	(_g_segment_wink_time_counter)
	line	1306
;led.c: 1306: if(g_segment_wink_display_flag == 1) g_segment_wink_display_flag = 0;
	decf	(_g_segment_wink_display_flag),w
	skipz
	goto	u7591
	goto	u7590
u7591:
	goto	l1486
u7590:
	goto	l9531
	line	1307
	
l1486:	
;led.c: 1307: else g_segment_wink_display_flag = 1;
	clrf	(_g_segment_wink_display_flag)
	incf	(_g_segment_wink_display_flag),f
	goto	l9541
	line	1313
	
l9539:	
;led.c: 1311: else
;led.c: 1312: {
;led.c: 1313: g_segment_wink_state_flag &= (~temp_data1);
	comf	(G_Segment_Wink@temp_data1),w
	andwf	(_g_segment_wink_state_flag),f
	line	1316
	
l9541:	
;led.c: 1314: }
;led.c: 1316: if(g_segment_wink_state_flag == temp_data1)
	movf	(_g_segment_wink_state_flag),w
	xorwf	(G_Segment_Wink@temp_data1),w
	skipz
	goto	u7601
	goto	u7600
u7601:
	goto	l9549
u7600:
	line	1318
	
l9543:	
;led.c: 1317: {
;led.c: 1318: if(g_segment_wink_display_flag == 1) g_segment_displaying(i);
	decf	(_g_segment_wink_display_flag),w
	skipz
	goto	u7611
	goto	u7610
u7611:
	goto	l9547
u7610:
	
l9545:	
	movf	(G_Segment_Wink@i),w
	fcall	_g_segment_displaying
	goto	l9549
	line	1319
	
l9547:	
;led.c: 1319: else gre_displaying_end();
	fcall	_gre_displaying_end
	line	1321
	
l9549:	
;led.c: 1320: }
;led.c: 1321: temp_data1 <<= 1;
	clrc
	rlf	(G_Segment_Wink@temp_data1),f
	line	1269
	
l9551:	
	incf	(G_Segment_Wink@i),f
	
l9553:	
	movlw	(03h)
	subwf	(G_Segment_Wink@i),w
	skipc
	goto	u7621
	goto	u7620
u7621:
	goto	l9503
u7620:
	goto	l1493
	line	1324
	
l9555:	
;led.c: 1324: else g_segment_wink_state_flag = 0;
	clrf	(_g_segment_wink_state_flag)
	line	1325
	
l1493:	
	return
	opt stack 0
GLOBAL	__end_of_G_Segment_Wink
	__end_of_G_Segment_Wink:
;; =============== function _G_Segment_Wink ends ============

	signat	_G_Segment_Wink,88
	global	_down_time_display
psect	text1017,local,class=CODE,delta=2
global __ptext1017
__ptext1017:

;; *************** function _down_time_display *****************
;; Defined at:
;;		line 629 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0        unsigned int 
;;  temp_var2       1    0        unsigned char 
;;  temp_var1       1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_red_displaying_end
;;		_syn_wink_manage
;;		_yel_displaying_end
;;		_gre_displaying_end
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1017
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	629
	global	__size_of_down_time_display
	__size_of_down_time_display	equ	__end_of_down_time_display-_down_time_display
	
_down_time_display:	
	opt	stack 3
; Regs used in _down_time_display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	634
	
l9309:	
;led.c: 630: unsigned int i;
;led.c: 631: unsigned char temp_var1;
;led.c: 632: unsigned char temp_var2;
;led.c: 634: if(display_data[0] != 0)
	movf	(_display_data+1),w
	iorwf	(_display_data),w
	skipnz
	goto	u7291
	goto	u7290
u7291:
	goto	l9333
u7290:
	line	636
	
l9311:	
;led.c: 635: {
;led.c: 636: if(red_displaying_flag == 0)
	movf	(_red_displaying_flag),f
	skipz
	goto	u7301
	goto	u7300
u7301:
	goto	l9333
u7300:
	line	639
	
l9317:	
;led.c: 639: red_displaying_flag = 1;
	clrf	(_red_displaying_flag)
	incf	(_red_displaying_flag),f
	line	642
	
l9319:	
;led.c: 642: gre_displaying_flag = 0;
	clrf	(_gre_displaying_flag)
	line	643
	
l9321:	
;led.c: 643: yel_displaying_flag = 0;
	clrf	(_yel_displaying_flag)
	line	644
	
l9323:	
;led.c: 644: display_data[2] = 0;
	clrf	0+(_display_data)+04h
	clrf	1+(_display_data)+04h
	line	645
	
l9325:	
;led.c: 645: display_data[1] = 0;
	clrf	0+(_display_data)+02h
	clrf	1+(_display_data)+02h
	line	647
	
l9327:	
;led.c: 647: syn_wink_display_updata = 1;
	clrf	(_syn_wink_display_updata)
	incf	(_syn_wink_display_updata),f
	line	648
;led.c: 648: if(study_or_pulse_mode == 1) displaying_second_counter = lamp_off_time[0];
	decf	(_study_or_pulse_mode),w
	skipz
	goto	u7311
	goto	u7310
u7311:
	goto	l9331
u7310:
	
l9329:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(_lamp_off_time)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_displaying_second_counter)
	goto	l9333
	line	649
	
l9331:	
;led.c: 649: else displaying_second_counter = 0;
	clrf	(_displaying_second_counter)
	line	653
	
l9333:	
;led.c: 650: }
;led.c: 651: }
;led.c: 653: if(display_data[1] != 0)
	movlw	(02h)
	addlw	_display_data&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	incf	fsr0,f
	iorwf	indf,w
	skipnz
	goto	u7321
	goto	u7320
u7321:
	goto	l9355
u7320:
	line	655
	
l9335:	
;led.c: 654: {
;led.c: 655: if(yel_displaying_flag == 0)
	movf	(_yel_displaying_flag),f
	skipz
	goto	u7331
	goto	u7330
u7331:
	goto	l9355
u7330:
	line	658
	
l9341:	
;led.c: 658: yel_displaying_flag = 1;
	clrf	(_yel_displaying_flag)
	incf	(_yel_displaying_flag),f
	line	659
	
l9343:	
;led.c: 659: displaying_second_counter = 0;
	clrf	(_displaying_second_counter)
	line	662
	
l9345:	
;led.c: 662: red_displaying_flag = 0;
	clrf	(_red_displaying_flag)
	line	663
	
l9347:	
;led.c: 663: gre_displaying_flag = 0;
	clrf	(_gre_displaying_flag)
	line	664
	
l9349:	
;led.c: 664: display_data[0] = 0;
	clrf	(_display_data)
	clrf	(_display_data+1)
	line	665
	
l9351:	
;led.c: 665: display_data[2] = 0;
	clrf	0+(_display_data)+04h
	clrf	1+(_display_data)+04h
	line	667
	
l9353:	
;led.c: 667: syn_wink_display_updata = 1;
	clrf	(_syn_wink_display_updata)
	incf	(_syn_wink_display_updata),f
	line	671
	
l9355:	
;led.c: 668: }
;led.c: 669: }
;led.c: 671: if(display_data[2] != 0)
	movlw	(04h)
	addlw	_display_data&0ffh
	movwf	fsr0
	movf	indf,w
	incf	fsr0,f
	iorwf	indf,w
	skipnz
	goto	u7341
	goto	u7340
u7341:
	goto	l9379
u7340:
	line	673
	
l9357:	
;led.c: 672: {
;led.c: 673: if(gre_displaying_flag == 0)
	movf	(_gre_displaying_flag),f
	skipz
	goto	u7351
	goto	u7350
u7351:
	goto	l9379
u7350:
	line	676
	
l9363:	
;led.c: 676: gre_displaying_flag = 1;
	clrf	(_gre_displaying_flag)
	incf	(_gre_displaying_flag),f
	line	679
	
l9365:	
;led.c: 679: red_displaying_flag = 0;
	clrf	(_red_displaying_flag)
	line	680
	
l9367:	
;led.c: 680: yel_displaying_flag = 0;
	clrf	(_yel_displaying_flag)
	line	681
	
l9369:	
;led.c: 681: display_data[0] = 0;
	clrf	(_display_data)
	clrf	(_display_data+1)
	line	682
	
l9371:	
;led.c: 682: display_data[1] = 0;
	clrf	0+(_display_data)+02h
	clrf	1+(_display_data)+02h
	line	684
	
l9373:	
;led.c: 684: syn_wink_display_updata = 1;
	clrf	(_syn_wink_display_updata)
	incf	(_syn_wink_display_updata),f
	line	685
;led.c: 685: if(study_or_pulse_mode == 1) displaying_second_counter = lamp_off_time[2];
	decf	(_study_or_pulse_mode),w
	skipz
	goto	u7361
	goto	u7360
u7361:
	goto	l9377
u7360:
	
l9375:	
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_lamp_off_time)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_displaying_second_counter)
	goto	l9379
	line	686
	
l9377:	
;led.c: 686: else displaying_second_counter = 0;
	clrf	(_displaying_second_counter)
	line	690
	
l9379:	
;led.c: 687: }
;led.c: 688: }
;led.c: 690: if(red_displaying_flag == 1)
	decf	(_red_displaying_flag),w
	skipz
	goto	u7371
	goto	u7370
u7371:
	goto	l9417
u7370:
	line	692
	
l9381:	
;led.c: 691: {
;led.c: 692: displaying_second_counter++;
	incf	(_displaying_second_counter),f
	line	693
	
l9383:	
;led.c: 693: if(displaying_second_counter >= 100)
	movlw	(064h)
	subwf	(_displaying_second_counter),w
	skipc
	goto	u7381
	goto	u7380
u7381:
	goto	l9415
u7380:
	line	695
	
l9385:	
;led.c: 694: {
;led.c: 695: displaying_second_counter = 0;
	clrf	(_displaying_second_counter)
	line	696
;led.c: 696: if(1==0)
	goto	l9401
	line	708
	
l9399:	
	movlw	(02h)
	movwf	(_displaying_second_counter)
	goto	l9415
	line	713
	
l9401:	
;led.c: 711: else
;led.c: 712: {
;led.c: 713: if(display_data[0] <= 1)
	movlw	high(02h)
	subwf	(_display_data+1),w
	movlw	low(02h)
	skipnz
	subwf	(_display_data),w
	skipnc
	goto	u7391
	goto	u7390
u7391:
	goto	l9409
u7390:
	line	715
	
l9403:	
;led.c: 714: {
;led.c: 715: red_displaying_end();
	fcall	_red_displaying_end
	line	716
	
l9405:	
;led.c: 716: red_displaying_flag = 0;
	clrf	(_red_displaying_flag)
	line	717
	
l9407:	
;led.c: 717: display_data[0] = 0;
	clrf	(_display_data)
	clrf	(_display_data+1)
	line	718
;led.c: 718: }
	goto	l9415
	line	721
	
l9409:	
;led.c: 719: else
;led.c: 720: {
;led.c: 721: display_data[0]--;
	movlw	low(01h)
	subwf	(_display_data),f
	movlw	high(01h)
	skipc
	decf	(_display_data+1),f
	subwf	(_display_data+1),f
	line	723
	
l9411:	
;led.c: 723: syn_wink_display_updata = 1;
	clrf	(_syn_wink_display_updata)
	incf	(_syn_wink_display_updata),f
	line	724
;led.c: 724: if(display_data[0] == 1) displaying_second_counter = 2;
	decf	(_display_data),w
	iorwf	(_display_data+1),w

	skipz
	goto	u7401
	goto	u7400
u7401:
	goto	l1309
u7400:
	goto	l9399
	line	726
	
l1309:	
	line	728
	
l9415:	
;led.c: 725: }
;led.c: 726: }
;led.c: 727: }
;led.c: 728: syn_wink_manage(0);
	movlw	(0)
	fcall	_syn_wink_manage
	line	731
	
l9417:	
;led.c: 729: }
;led.c: 731: if(yel_displaying_flag == 1)
	decf	(_yel_displaying_flag),w
	skipz
	goto	u7411
	goto	u7410
u7411:
	goto	l9455
u7410:
	line	733
	
l9419:	
;led.c: 732: {
;led.c: 733: displaying_second_counter++;
	incf	(_displaying_second_counter),f
	line	734
	
l9421:	
;led.c: 734: if(displaying_second_counter >= 100)
	movlw	(064h)
	subwf	(_displaying_second_counter),w
	skipc
	goto	u7421
	goto	u7420
u7421:
	goto	l9453
u7420:
	line	736
	
l9423:	
;led.c: 735: {
;led.c: 736: displaying_second_counter = 0;
	clrf	(_displaying_second_counter)
	line	737
;led.c: 737: if(1==0)
	goto	l9439
	line	749
	
l9437:	
	movlw	(02h)
	movwf	(_displaying_second_counter)
	goto	l9453
	line	754
	
l9439:	
;led.c: 752: else
;led.c: 753: {
;led.c: 754: if(display_data[1] <= 1)
	movlw	high(02h)
	subwf	1+(_display_data)+02h,w
	movlw	low(02h)
	skipnz
	subwf	0+(_display_data)+02h,w
	skipnc
	goto	u7431
	goto	u7430
u7431:
	goto	l9447
u7430:
	line	756
	
l9441:	
;led.c: 755: {
;led.c: 756: yel_displaying_end();
	fcall	_yel_displaying_end
	line	757
	
l9443:	
;led.c: 757: yel_displaying_flag = 0;
	clrf	(_yel_displaying_flag)
	line	758
	
l9445:	
;led.c: 758: display_data[1] = 0;
	clrf	0+(_display_data)+02h
	clrf	1+(_display_data)+02h
	line	759
;led.c: 759: }
	goto	l9453
	line	762
	
l9447:	
;led.c: 760: else
;led.c: 761: {
;led.c: 762: display_data[1]--;
	movlw	low(01h)
	subwf	0+(_display_data)+02h,f
	movlw	high(01h)
	skipc
	decf	1+(_display_data)+02h,f
	subwf	1+(_display_data)+02h,f
	line	764
	
l9449:	
;led.c: 764: syn_wink_display_updata = 1;
	clrf	(_syn_wink_display_updata)
	incf	(_syn_wink_display_updata),f
	line	765
;led.c: 765: if(display_data[1] == 1) displaying_second_counter = 2;
	decf	0+(_display_data)+02h,w
	iorwf	1+(_display_data)+02h,w

	skipz
	goto	u7441
	goto	u7440
u7441:
	goto	l1319
u7440:
	goto	l9437
	line	767
	
l1319:	
	line	769
	
l9453:	
;led.c: 766: }
;led.c: 767: }
;led.c: 768: }
;led.c: 769: syn_wink_manage(1);
	movlw	(01h)
	fcall	_syn_wink_manage
	line	772
	
l9455:	
;led.c: 770: }
;led.c: 772: if(gre_displaying_flag == 1)
	decf	(_gre_displaying_flag),w
	skipz
	goto	u7451
	goto	u7450
u7451:
	goto	l1333
u7450:
	line	774
	
l9457:	
;led.c: 773: {
;led.c: 774: displaying_second_counter++;
	incf	(_displaying_second_counter),f
	line	775
	
l9459:	
;led.c: 775: if(displaying_second_counter >= 100)
	movlw	(064h)
	subwf	(_displaying_second_counter),w
	skipc
	goto	u7461
	goto	u7460
u7461:
	goto	l9491
u7460:
	line	777
	
l9461:	
;led.c: 776: {
;led.c: 777: displaying_second_counter = 0;
	clrf	(_displaying_second_counter)
	line	778
;led.c: 778: if(1==0)
	goto	l9477
	line	790
	
l9475:	
	movlw	(02h)
	movwf	(_displaying_second_counter)
	goto	l9491
	line	795
	
l9477:	
;led.c: 793: else
;led.c: 794: {
;led.c: 795: if(display_data[2] <= 1)
	movlw	high(02h)
	subwf	1+(_display_data)+04h,w
	movlw	low(02h)
	skipnz
	subwf	0+(_display_data)+04h,w
	skipnc
	goto	u7471
	goto	u7470
u7471:
	goto	l9485
u7470:
	line	797
	
l9479:	
;led.c: 796: {
;led.c: 797: gre_displaying_end();
	fcall	_gre_displaying_end
	line	798
	
l9481:	
;led.c: 798: gre_displaying_flag = 0;
	clrf	(_gre_displaying_flag)
	line	799
	
l9483:	
;led.c: 799: display_data[2] = 0;
	clrf	0+(_display_data)+04h
	clrf	1+(_display_data)+04h
	line	800
;led.c: 800: }
	goto	l9491
	line	803
	
l9485:	
;led.c: 801: else
;led.c: 802: {
;led.c: 803: display_data[2]--;
	movlw	low(01h)
	subwf	0+(_display_data)+04h,f
	movlw	high(01h)
	skipc
	decf	1+(_display_data)+04h,f
	subwf	1+(_display_data)+04h,f
	line	805
	
l9487:	
;led.c: 805: syn_wink_display_updata = 1;
	clrf	(_syn_wink_display_updata)
	incf	(_syn_wink_display_updata),f
	line	806
;led.c: 806: if(display_data[2] == 1) displaying_second_counter = 2;
	decf	0+(_display_data)+04h,w
	iorwf	1+(_display_data)+04h,w

	skipz
	goto	u7481
	goto	u7480
u7481:
	goto	l1329
u7480:
	goto	l9475
	line	808
	
l1329:	
	line	810
	
l9491:	
;led.c: 807: }
;led.c: 808: }
;led.c: 809: }
;led.c: 810: syn_wink_manage(2);
	movlw	(02h)
	fcall	_syn_wink_manage
	line	812
	
l1333:	
	return
	opt stack 0
GLOBAL	__end_of_down_time_display
	__end_of_down_time_display:
;; =============== function _down_time_display ends ============

	signat	_down_time_display,88
	global	_communication_err
psect	text1018,local,class=CODE,delta=2
global __ptext1018
__ptext1018:

;; *************** function _communication_err *****************
;; Defined at:
;;		line 1645 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_red_displaying_end
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1018
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	1645
	global	__size_of_communication_err
	__size_of_communication_err	equ	__end_of_communication_err-_communication_err
	
_communication_err:	
	opt	stack 4
; Regs used in _communication_err: [wreg+status,2+status,0+pclath+cstack]
	line	1646
	
l9295:	
;led.c: 1646: every_second_update_counter++;
	incf	(_every_second_update_counter),f
	line	1647
	
l9297:	
;led.c: 1647: if(every_second_update_counter >= 100)
	movlw	(064h)
	subwf	(_every_second_update_counter),w
	skipc
	goto	u7271
	goto	u7270
u7271:
	goto	l1591
u7270:
	line	1649
	
l9299:	
;led.c: 1648: {
;led.c: 1649: every_second_update_counter = 0;
	clrf	(_every_second_update_counter)
	line	1650
	
l9301:	
;led.c: 1650: every_second_update_delay++;
	incf	(_every_second_update_delay),f
	line	1651
	
l9303:	
;led.c: 1651: if(every_second_update_delay >= 3)
	movlw	(03h)
	subwf	(_every_second_update_delay),w
	skipc
	goto	u7281
	goto	u7280
u7281:
	goto	l1591
u7280:
	line	1653
	
l9305:	
;led.c: 1652: {
;led.c: 1653: every_second_update_flag = 0;
	clrf	(_every_second_update_flag)
	line	1654
;led.c: 1654: every_second_update_counter = 0;
	clrf	(_every_second_update_counter)
	line	1655
;led.c: 1655: every_second_update_delay = 0;
	clrf	(_every_second_update_delay)
	line	1656
	
l9307:	
;led.c: 1656: red_displaying_end();
	fcall	_red_displaying_end
	line	1661
	
l1591:	
	return
	opt stack 0
GLOBAL	__end_of_communication_err
	__end_of_communication_err:
;; =============== function _communication_err ends ============

	signat	_communication_err,88
	global	_usart_data_analyse
psect	text1019,local,class=CODE,delta=2
global __ptext1019
__ptext1019:

;; *************** function _usart_data_analyse *****************
;; Defined at:
;;		line 1441 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  down_time       2   14[BANK0 ] unsigned int 
;;  k               1   16[BANK0 ] unsigned char 
;;  temp_pointer    1   13[BANK0 ] unsigned char 
;;  TableLength     1   12[BANK0 ] unsigned char 
;;  CheckSum        1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       6       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___wmul
;;		_red_displaying_end
;;		_gre_displaying_end
;;		_yel_displaying_end
;;		_yel_displaying
;;		_gre_displaying
;;		_red_displaying
;;		_addr_write
;;		_addr_read
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1019
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	1441
	global	__size_of_usart_data_analyse
	__size_of_usart_data_analyse	equ	__end_of_usart_data_analyse-_usart_data_analyse
	
_usart_data_analyse:	
	opt	stack 4
; Regs used in _usart_data_analyse: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	1447
	
l9035:	
;led.c: 1442: unsigned char k;
;led.c: 1443: unsigned char CheckSum;
;led.c: 1444: unsigned char temp_pointer;
;led.c: 1445: unsigned char TableLength;
;led.c: 1446: unsigned int down_time;
;led.c: 1447: if(usart_rx_read != usart_rx_write)
	movf	(_usart_rx_read),w
	xorwf	(_usart_rx_write),w
	skipnz
	goto	u6941
	goto	u6940
u6941:
	goto	l1586
u6940:
	line	1449
	
l9037:	
;led.c: 1448: {
;led.c: 1449: TableLength = 0;
	clrf	(usart_data_analyse@TableLength)
	line	1450
	
l9039:	
;led.c: 1450: if((usart_rx_read >= 30)||(usart_rx_write >= 30))
	movlw	(01Eh)
	subwf	(_usart_rx_read),w
	skipnc
	goto	u6951
	goto	u6950
u6951:
	goto	l9043
u6950:
	
l9041:	
	movlw	(01Eh)
	subwf	(_usart_rx_write),w
	skipc
	goto	u6961
	goto	u6960
u6961:
	goto	l9045
u6960:
	line	1452
	
l9043:	
;led.c: 1451: {
;led.c: 1452: usart_rx_read = 0;
	clrf	(_usart_rx_read)
	line	1453
;led.c: 1453: usart_rx_write = 0;
	clrf	(_usart_rx_write)
	line	1454
;led.c: 1454: }
	goto	l9051
	line	1457
	
l9045:	
;led.c: 1455: else
;led.c: 1456: {
;led.c: 1457: if(usart_rx_read<usart_rx_write) TableLength = usart_rx_write - usart_rx_read;
	movf	(_usart_rx_write),w
	subwf	(_usart_rx_read),w
	skipnc
	goto	u6971
	goto	u6970
u6971:
	goto	l9049
u6970:
	
l9047:	
	movf	(_usart_rx_read),w
	subwf	(_usart_rx_write),w
	movwf	(usart_data_analyse@TableLength)
	goto	l9051
	line	1458
	
l9049:	
;led.c: 1458: else TableLength = 30 - (usart_rx_read - usart_rx_write);
	movf	(_usart_rx_read),w
	subwf	(_usart_rx_write),w
	addlw	01Eh
	movwf	(usart_data_analyse@TableLength)
	line	1461
	
l9051:	
;led.c: 1459: }
;led.c: 1461: if(TableLength >= 5)
	movlw	(05h)
	subwf	(usart_data_analyse@TableLength),w
	skipc
	goto	u6981
	goto	u6980
u6981:
	goto	l1586
u6980:
	line	1463
	
l9053:	
;led.c: 1462: {
;led.c: 1463: if(usart_rx_buffer[usart_rx_read] == 0xfe)
	movf	(_usart_rx_read),w
	addlw	_usart_rx_buffer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	xorlw	0FEh
	skipz
	goto	u6991
	goto	u6990
u6991:
	goto	l9271
u6990:
	line	1465
	
l9055:	
;led.c: 1464: {
;led.c: 1465: temp_pointer = usart_rx_read;
	movf	(_usart_rx_read),w
	movwf	(usart_data_analyse@temp_pointer)
	line	1466
	
l9057:	
;led.c: 1466: for(k=0;k<5;k++)
	clrf	(usart_data_analyse@k)
	line	1468
	
l9063:	
;led.c: 1467: {
;led.c: 1468: usart_temp_buffer[k] = usart_rx_buffer[temp_pointer];
	movf	(usart_data_analyse@temp_pointer),w
	addlw	_usart_rx_buffer&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_usart_data_analyse+0)+0
	movf	(usart_data_analyse@k),w
	addlw	_usart_temp_buffer&0ffh
	movwf	fsr0
	movf	(??_usart_data_analyse+0)+0,w
	movwf	indf
	line	1469
	
l9065:	
;led.c: 1469: temp_pointer++;
	incf	(usart_data_analyse@temp_pointer),f
	line	1470
	
l9067:	
;led.c: 1470: if(temp_pointer >= 30) temp_pointer = 0;
	movlw	(01Eh)
	subwf	(usart_data_analyse@temp_pointer),w
	skipc
	goto	u7001
	goto	u7000
u7001:
	goto	l9071
u7000:
	
l9069:	
	clrf	(usart_data_analyse@temp_pointer)
	line	1466
	
l9071:	
	incf	(usart_data_analyse@k),f
	
l9073:	
	movlw	(05h)
	subwf	(usart_data_analyse@k),w
	skipc
	goto	u7011
	goto	u7010
u7011:
	goto	l9063
u7010:
	line	1473
	
l9075:	
;led.c: 1471: }
;led.c: 1473: CheckSum = 0;
	clrf	(usart_data_analyse@CheckSum)
	line	1474
	
l9077:	
;led.c: 1474: for(k=1;k<4;k++)
	clrf	(usart_data_analyse@k)
	incf	(usart_data_analyse@k),f
	line	1476
	
l9083:	
;led.c: 1475: {
;led.c: 1476: CheckSum ^= usart_temp_buffer[k];
	movf	(usart_data_analyse@k),w
	addlw	_usart_temp_buffer&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(usart_data_analyse@CheckSum),f
	line	1474
	
l9085:	
	incf	(usart_data_analyse@k),f
	
l9087:	
	movlw	(04h)
	subwf	(usart_data_analyse@k),w
	skipc
	goto	u7021
	goto	u7020
u7021:
	goto	l9083
u7020:
	
l1544:	
	line	1478
;led.c: 1477: }
;led.c: 1478: CheckSum &= 0x7f;
	bcf	(usart_data_analyse@CheckSum)+(7/8),(7)&7
	line	1480
	
l9089:	
;led.c: 1480: if(CheckSum == usart_temp_buffer[4])
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_usart_temp_buffer)^080h+04h,w
	bcf	status, 5	;RP0=0, select bank0
	xorwf	(usart_data_analyse@CheckSum),w
	skipz
	goto	u7031
	goto	u7030
u7031:
	goto	l9263
u7030:
	line	1482
	
l9091:	
;led.c: 1481: {
;led.c: 1482: if((usart_temp_buffer[2] <= 0x99)&&(usart_temp_buffer[3] <= 0x99))
	movlw	(09Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	0+(_usart_temp_buffer)^080h+02h,w
	skipnc
	goto	u7041
	goto	u7040
u7041:
	goto	l9221
u7040:
	
l9093:	
	movlw	(09Ah)
	subwf	0+(_usart_temp_buffer)^080h+03h,w
	skipnc
	goto	u7051
	goto	u7050
u7051:
	goto	l9221
u7050:
	line	1484
	
l9095:	
;led.c: 1483: {
;led.c: 1484: if((usart_temp_buffer[1]&0xdc) == address_of_lamp)
	movf	0+(_usart_temp_buffer)^080h+01h,w
	andlw	0DCh
	bcf	status, 5	;RP0=0, select bank0
	xorwf	(_address_of_lamp),w
	skipz
	goto	u7061
	goto	u7060
u7061:
	goto	l9243
u7060:
	line	1486
	
l9097:	
;led.c: 1485: {
;led.c: 1486: communication_flag = 1;
	clrf	(_communication_flag)
	incf	(_communication_flag),f
	line	1487
	
l9099:	
;led.c: 1487: communication_counter = 0;
	clrf	(_communication_counter)
	line	1489
	
l9101:	
;led.c: 1489: down_time = ((usart_temp_buffer[2]>>4)&0x0f)*1000;
	bsf	status, 5	;RP0=1, select bank1
	swapf	0+(_usart_temp_buffer)^080h+02h,w
	andlw	(0ffh shr 4) & 0ffh
	andlw	0Fh
	movwf	(?___wmul)
	clrf	(?___wmul+1)
	movlw	low(03E8h)
	movwf	0+(?___wmul)+02h
	movlw	high(03E8h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(usart_data_analyse@down_time+1)
	movf	(0+(?___wmul)),w
	movwf	(usart_data_analyse@down_time)
	line	1490
	
l9103:	
;led.c: 1490: down_time += (usart_temp_buffer[2]&0x0f)*100;
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_usart_temp_buffer)^080h+02h,w
	andlw	0Fh
	movwf	(?___wmul)
	clrf	(?___wmul+1)
	movlw	064h
	movwf	0+(?___wmul)+02h
	clrf	1+(?___wmul)+02h
	fcall	___wmul
	movf	(0+(?___wmul)),w
	addwf	(usart_data_analyse@down_time),f
	skipnc
	incf	(usart_data_analyse@down_time+1),f
	movf	(1+(?___wmul)),w
	addwf	(usart_data_analyse@down_time+1),f
	line	1491
	
l9105:	
;led.c: 1491: down_time += ((usart_temp_buffer[3]>>4)&0x0f)*10;
	bsf	status, 5	;RP0=1, select bank1
	swapf	0+(_usart_temp_buffer)^080h+03h,w
	andlw	(0ffh shr 4) & 0ffh
	andlw	0Fh
	movwf	(?___wmul)
	clrf	(?___wmul+1)
	movlw	0Ah
	movwf	0+(?___wmul)+02h
	clrf	1+(?___wmul)+02h
	fcall	___wmul
	movf	(0+(?___wmul)),w
	addwf	(usart_data_analyse@down_time),f
	skipnc
	incf	(usart_data_analyse@down_time+1),f
	movf	(1+(?___wmul)),w
	addwf	(usart_data_analyse@down_time+1),f
	line	1492
	
l9107:	
;led.c: 1492: down_time += (usart_temp_buffer[3]&0x0f);
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_usart_temp_buffer)^080h+03h,w
	andlw	0Fh
	bcf	status, 5	;RP0=0, select bank0
	addwf	(usart_data_analyse@down_time),f
	skipnc
	incf	(usart_data_analyse@down_time+1),f
	line	1493
	
l9109:	
;led.c: 1493: if((usart_temp_buffer[1]&0x20)!=0)
	bsf	status, 5	;RP0=1, select bank1
	btfss	0+(_usart_temp_buffer)^080h+01h,(5)&7
	goto	u7071
	goto	u7070
u7071:
	goto	l9171
u7070:
	goto	l9169
	line	1498
	
l9113:	
;led.c: 1498: red_displaying_end();
	fcall	_red_displaying_end
	line	1499
	
l9115:	
;led.c: 1499: red_displaying_flag = 0;
	clrf	(_red_displaying_flag)
	line	1500
	
l9117:	
;led.c: 1500: gre_displaying_flag=0;
	clrf	(_gre_displaying_flag)
	line	1501
	
l9119:	
;led.c: 1501: yel_displaying_flag=0;
	clrf	(_yel_displaying_flag)
	line	1502
	
l9121:	
;led.c: 1502: display_data[0] = 0;
	clrf	(_display_data)
	clrf	(_display_data+1)
	line	1503
	
l9123:	
;led.c: 1503: display_data[1] = 0;
	clrf	0+(_display_data)+02h
	clrf	1+(_display_data)+02h
	line	1504
	
l9125:	
;led.c: 1504: display_data[2] = 0;
	clrf	0+(_display_data)+04h
	clrf	1+(_display_data)+04h
	line	1505
;led.c: 1505: break;
	goto	l9243
	line	1507
	
l9127:	
;led.c: 1507: display_data[1] = down_time;
	movf	(usart_data_analyse@down_time+1),w
	movwf	1+(_display_data)+02h
	movf	(usart_data_analyse@down_time),w
	movwf	0+(_display_data)+02h
	line	1508
;led.c: 1508: if(red_displaying_flag == 1)
	decf	(_red_displaying_flag),w
	skipz
	goto	u7081
	goto	u7080
u7081:
	goto	l9135
u7080:
	line	1510
	
l9129:	
;led.c: 1509: {
;led.c: 1510: red_displaying_flag = 0;
	clrf	(_red_displaying_flag)
	line	1511
	
l9131:	
;led.c: 1511: red_displaying_end();
	fcall	_red_displaying_end
	line	1512
	
l9133:	
;led.c: 1512: display_data[0] = 0;
	clrf	(_display_data)
	clrf	(_display_data+1)
	line	1514
	
l9135:	
;led.c: 1513: }
;led.c: 1514: if(gre_displaying_flag == 1)
	decf	(_gre_displaying_flag),w
	skipz
	goto	u7091
	goto	u7090
u7091:
	goto	l1547
u7090:
	line	1516
	
l9137:	
;led.c: 1515: {
;led.c: 1516: gre_displaying_flag=0;
	clrf	(_gre_displaying_flag)
	line	1517
;led.c: 1517: display_data[2] = 0;
	clrf	0+(_display_data)+04h
	clrf	1+(_display_data)+04h
	line	1518
	
l9139:	
;led.c: 1518: gre_displaying_end();
	fcall	_gre_displaying_end
	goto	l9243
	line	1522
	
l9141:	
;led.c: 1522: display_data[2] = down_time;
	movf	(usart_data_analyse@down_time+1),w
	movwf	1+(_display_data)+04h
	movf	(usart_data_analyse@down_time),w
	movwf	0+(_display_data)+04h
	line	1523
;led.c: 1523: if(red_displaying_flag == 1)
	decf	(_red_displaying_flag),w
	skipz
	goto	u7101
	goto	u7100
u7101:
	goto	l9149
u7100:
	line	1525
	
l9143:	
;led.c: 1524: {
;led.c: 1525: red_displaying_flag = 0;
	clrf	(_red_displaying_flag)
	line	1526
	
l9145:	
;led.c: 1526: red_displaying_end();
	fcall	_red_displaying_end
	line	1527
	
l9147:	
;led.c: 1527: display_data[0] = 0;
	clrf	(_display_data)
	clrf	(_display_data+1)
	line	1529
	
l9149:	
;led.c: 1528: }
;led.c: 1529: if(yel_displaying_flag == 1)
	decf	(_yel_displaying_flag),w
	skipz
	goto	u7111
	goto	u7110
u7111:
	goto	l1547
u7110:
	line	1531
	
l9151:	
;led.c: 1530: {
;led.c: 1531: yel_displaying_flag=0;
	clrf	(_yel_displaying_flag)
	line	1532
;led.c: 1532: display_data[1] = 0;
	clrf	0+(_display_data)+02h
	clrf	1+(_display_data)+02h
	line	1533
	
l9153:	
;led.c: 1533: yel_displaying_end();
	fcall	_yel_displaying_end
	goto	l9243
	line	1537
	
l9155:	
;led.c: 1537: display_data[0] = down_time;
	movf	(usart_data_analyse@down_time+1),w
	movwf	(_display_data+1)
	movf	(usart_data_analyse@down_time),w
	movwf	(_display_data)
	line	1538
;led.c: 1538: if(gre_displaying_flag == 1)
	decf	(_gre_displaying_flag),w
	skipz
	goto	u7121
	goto	u7120
u7121:
	goto	l9161
u7120:
	line	1540
	
l9157:	
;led.c: 1539: {
;led.c: 1540: gre_displaying_flag=0;
	clrf	(_gre_displaying_flag)
	line	1541
;led.c: 1541: display_data[2] = 0;
	clrf	0+(_display_data)+04h
	clrf	1+(_display_data)+04h
	line	1542
	
l9159:	
;led.c: 1542: gre_displaying_end();
	fcall	_gre_displaying_end
	line	1544
	
l9161:	
;led.c: 1543: }
;led.c: 1544: if(yel_displaying_flag == 1)
	decf	(_yel_displaying_flag),w
	skipz
	goto	u7131
	goto	u7130
u7131:
	goto	l1547
u7130:
	goto	l9151
	line	1495
	
l9169:	
	movf	0+(_usart_temp_buffer)^080h+01h,w
	andlw	03h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_usart_data_analyse+0)+0
	clrf	(??_usart_data_analyse+0)+0+1
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte            9     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf 1+(??_usart_data_analyse+0)+0,w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l9749
	goto	l1547
	opt asmopt_on
	
l9749:	
; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           15     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	movf 0+(??_usart_data_analyse+0)+0,w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l9113
	xorlw	1^0	; case 1
	skipnz
	goto	l9141
	xorlw	2^1	; case 2
	skipnz
	goto	l9127
	xorlw	3^2	; case 3
	skipnz
	goto	l9155
	goto	l1547
	opt asmopt_on

	line	1557
	
l9171:	
;led.c: 1555: else
;led.c: 1556: {
;led.c: 1557: if(red_displaying_flag == 1)
	bcf	status, 5	;RP0=0, select bank0
	decf	(_red_displaying_flag),w
	skipz
	goto	u7141
	goto	u7140
u7141:
	goto	l9179
u7140:
	line	1559
	
l9173:	
;led.c: 1558: {
;led.c: 1559: red_displaying_flag = 0;
	clrf	(_red_displaying_flag)
	line	1560
	
l9175:	
;led.c: 1560: red_displaying_end();
	fcall	_red_displaying_end
	line	1561
	
l9177:	
;led.c: 1561: display_data[0] = 0;
	clrf	(_display_data)
	clrf	(_display_data+1)
	line	1563
	
l9179:	
;led.c: 1562: }
;led.c: 1563: if(gre_displaying_flag == 1)
	decf	(_gre_displaying_flag),w
	skipz
	goto	u7151
	goto	u7150
u7151:
	goto	l9185
u7150:
	line	1565
	
l9181:	
;led.c: 1564: {
;led.c: 1565: gre_displaying_flag=0;
	clrf	(_gre_displaying_flag)
	line	1566
;led.c: 1566: display_data[2] = 0;
	clrf	0+(_display_data)+04h
	clrf	1+(_display_data)+04h
	line	1567
	
l9183:	
;led.c: 1567: gre_displaying_end();
	fcall	_gre_displaying_end
	line	1569
	
l9185:	
;led.c: 1568: }
;led.c: 1569: if(yel_displaying_flag == 1)
	decf	(_yel_displaying_flag),w
	skipz
	goto	u7161
	goto	u7160
u7161:
	goto	l9219
u7160:
	line	1571
	
l9187:	
;led.c: 1570: {
;led.c: 1571: yel_displaying_flag=0;
	clrf	(_yel_displaying_flag)
	line	1572
;led.c: 1572: display_data[1] = 0;
	clrf	0+(_display_data)+02h
	clrf	1+(_display_data)+02h
	line	1573
	
l9189:	
;led.c: 1573: yel_displaying_end();
	fcall	_yel_displaying_end
	goto	l9219
	line	1578
	
l9191:	
;led.c: 1578: red_displaying_end();
	fcall	_red_displaying_end
	line	1579
;led.c: 1579: break;
	goto	l9243
	line	1581
	
l9193:	
;led.c: 1581: yel_displaying(down_time);
	movf	(usart_data_analyse@down_time+1),w
	movwf	(?_yel_displaying+1)
	movf	(usart_data_analyse@down_time),w
	movwf	(?_yel_displaying)
	fcall	_yel_displaying
	line	1582
	
l9195:	
;led.c: 1582: every_second_update_flag = 1;
	clrf	(_every_second_update_flag)
	incf	(_every_second_update_flag),f
	line	1583
	
l9197:	
;led.c: 1583: every_second_update_counter = 0;
	clrf	(_every_second_update_counter)
	line	1584
	
l9199:	
;led.c: 1584: every_second_update_delay = 0;
	clrf	(_every_second_update_delay)
	line	1585
;led.c: 1585: break;
	goto	l9243
	line	1587
	
l9201:	
;led.c: 1587: gre_displaying(down_time);
	movf	(usart_data_analyse@down_time+1),w
	movwf	(?_gre_displaying+1)
	movf	(usart_data_analyse@down_time),w
	movwf	(?_gre_displaying)
	fcall	_gre_displaying
	goto	l9195
	line	1593
	
l9209:	
;led.c: 1593: red_displaying(down_time);
	movf	(usart_data_analyse@down_time+1),w
	movwf	(?_red_displaying+1)
	movf	(usart_data_analyse@down_time),w
	movwf	(?_red_displaying)
	fcall	_red_displaying
	goto	l9195
	line	1575
	
l9219:	
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_usart_temp_buffer)^080h+01h,w
	andlw	03h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_usart_data_analyse+0)+0
	clrf	(??_usart_data_analyse+0)+0+1
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte            9     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf 1+(??_usart_data_analyse+0)+0,w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l9751
	goto	l1547
	opt asmopt_on
	
l9751:	
; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           15     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	movf 0+(??_usart_data_analyse+0)+0,w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l9191
	xorlw	1^0	; case 1
	skipnz
	goto	l9201
	xorlw	2^1	; case 2
	skipnz
	goto	l9193
	xorlw	3^2	; case 3
	skipnz
	goto	l9209
	goto	l1547
	opt asmopt_on

	line	1602
	
l1547:	
	line	1603
;led.c: 1601: }
;led.c: 1602: }
;led.c: 1603: }
	goto	l9243
	line	1606
	
l9221:	
;led.c: 1604: else
;led.c: 1605: {
;led.c: 1606: if((usart_temp_buffer[2] == 0xaa)&&(usart_temp_buffer[3] == 0xbb))
	movf	0+(_usart_temp_buffer)^080h+02h,w
	xorlw	0AAh
	skipz
	goto	u7171
	goto	u7170
u7171:
	goto	l9231
u7170:
	
l9223:	
	movf	0+(_usart_temp_buffer)^080h+03h,w
	xorlw	0BBh
	skipz
	goto	u7181
	goto	u7180
u7181:
	goto	l9231
u7180:
	line	1608
	
l9225:	
;led.c: 1607: {
;led.c: 1608: addr_write(usart_temp_buffer[1]&0xdc);
	movf	0+(_usart_temp_buffer)^080h+01h,w
	andlw	0DCh
	fcall	_addr_write
	line	1609
	
l9227:	
;led.c: 1609: address_of_lamp = usart_temp_buffer[1]&0xdc;
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_usart_temp_buffer)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_address_of_lamp)
	
l9229:	
	movlw	(0DCh)
	andwf	(_address_of_lamp),f
	line	1611
	
l9231:	
;led.c: 1610: }
;led.c: 1611: if((usart_temp_buffer[2] == 0xcc)&&(usart_temp_buffer[3] == 0xdd)&&(usart_temp_buffer[1] == 0x00))
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_usart_temp_buffer)^080h+02h,w
	xorlw	0CCh
	skipz
	goto	u7191
	goto	u7190
u7191:
	goto	l9243
u7190:
	
l9233:	
	movf	0+(_usart_temp_buffer)^080h+03h,w
	xorlw	0DDh
	skipz
	goto	u7201
	goto	u7200
u7201:
	goto	l9243
u7200:
	
l9235:	
	movf	0+(_usart_temp_buffer)^080h+01h,f
	skipz
	goto	u7211
	goto	u7210
u7211:
	goto	l9243
u7210:
	line	1613
	
l9237:	
;led.c: 1612: {
;led.c: 1613: address_of_lamp = addr_read();
	fcall	_addr_read
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_address_of_lamp)
	line	1614
	
l9239:	
;led.c: 1614: communication_flag = 1;
	clrf	(_communication_flag)
	incf	(_communication_flag),f
	line	1615
	
l9241:	
;led.c: 1615: red_displaying(address_of_lamp);
	movf	(_address_of_lamp),w
	movwf	(?_red_displaying)
	clrf	(?_red_displaying+1)
	fcall	_red_displaying
	line	1619
	
l9243:	
;led.c: 1616: }
;led.c: 1617: }
;led.c: 1619: if(usart_rx_read < temp_pointer) TableLength = temp_pointer - usart_rx_read;
	bcf	status, 5	;RP0=0, select bank0
	movf	(usart_data_analyse@temp_pointer),w
	subwf	(_usart_rx_read),w
	skipnc
	goto	u7221
	goto	u7220
u7221:
	goto	l9247
u7220:
	
l9245:	
	movf	(_usart_rx_read),w
	subwf	(usart_data_analyse@temp_pointer),w
	movwf	(usart_data_analyse@TableLength)
	goto	l9249
	line	1620
	
l9247:	
;led.c: 1620: else TableLength = 30 - (usart_rx_read - temp_pointer);
	movf	(_usart_rx_read),w
	subwf	(usart_data_analyse@temp_pointer),w
	addlw	01Eh
	movwf	(usart_data_analyse@TableLength)
	line	1621
	
l9249:	
;led.c: 1621: for(k=0;k<TableLength;k++)
	clrf	(usart_data_analyse@k)
	goto	l9261
	line	1623
	
l9251:	
;led.c: 1622: {
;led.c: 1623: usart_rx_buffer[usart_rx_read]=0;
	movf	(_usart_rx_read),w
	addlw	_usart_rx_buffer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	line	1624
	
l9253:	
;led.c: 1624: usart_rx_read++;
	incf	(_usart_rx_read),f
	line	1625
	
l9255:	
;led.c: 1625: if(usart_rx_read >= 30) usart_rx_read = 0;
	movlw	(01Eh)
	subwf	(_usart_rx_read),w
	skipc
	goto	u7231
	goto	u7230
u7231:
	goto	l9259
u7230:
	
l9257:	
	clrf	(_usart_rx_read)
	line	1621
	
l9259:	
	incf	(usart_data_analyse@k),f
	
l9261:	
	movf	(usart_data_analyse@TableLength),w
	subwf	(usart_data_analyse@k),w
	skipc
	goto	u7241
	goto	u7240
u7241:
	goto	l9251
u7240:
	goto	l1586
	line	1630
	
l9263:	
;led.c: 1628: else
;led.c: 1629: {
;led.c: 1630: usart_rx_buffer[usart_rx_read]=0;
	movf	(_usart_rx_read),w
	addlw	_usart_rx_buffer&0ffh
	movwf	fsr0
	clrf	indf
	line	1631
	
l9265:	
;led.c: 1631: usart_rx_read++;
	incf	(_usart_rx_read),f
	line	1632
	
l9267:	
;led.c: 1632: if(usart_rx_read >= 30) usart_rx_read = 0;
	movlw	(01Eh)
	subwf	(_usart_rx_read),w
	skipc
	goto	u7251
	goto	u7250
u7251:
	goto	l1538
u7250:
	
l9269:	
	clrf	(_usart_rx_read)
	goto	l1586
	line	1637
	
l9271:	
;led.c: 1635: else
;led.c: 1636: {
;led.c: 1637: usart_rx_buffer[usart_rx_read]=0;
	movf	(_usart_rx_read),w
	addlw	_usart_rx_buffer&0ffh
	movwf	fsr0
	clrf	indf
	line	1638
	
l9273:	
;led.c: 1638: usart_rx_read++;
	incf	(_usart_rx_read),f
	line	1639
	
l9275:	
;led.c: 1639: if(usart_rx_read >= 30) usart_rx_read = 0;
	movlw	(01Eh)
	subwf	(_usart_rx_read),w
	skipc
	goto	u7261
	goto	u7260
u7261:
	goto	l1538
u7260:
	goto	l9269
	line	1641
	
l1538:	
	line	1643
	
l1586:	
	return
	opt stack 0
GLOBAL	__end_of_usart_data_analyse
	__end_of_usart_data_analyse:
;; =============== function _usart_data_analyse ends ============

	signat	_usart_data_analyse,88
	global	_study_mode_time_calculation
psect	text1020,local,class=CODE,delta=2
global __ptext1020
__ptext1020:

;; *************** function _study_mode_time_calculation *****************
;; Defined at:
;;		line 1011 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp_var2       2    8[BANK0 ] unsigned int 
;;  i               1   11[BANK0 ] unsigned char 
;;  temp_var1       1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       4       0       0
;;      Temps:          0       4       0       0
;;      Totals:         0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lwdiv
;;		_red_displaying_end
;;		_yel_displaying_end
;;		_gre_displaying_end
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1020
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	1011
	global	__size_of_study_mode_time_calculation
	__size_of_study_mode_time_calculation	equ	__end_of_study_mode_time_calculation-_study_mode_time_calculation
	
_study_mode_time_calculation:	
	opt	stack 4
; Regs used in _study_mode_time_calculation: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	1015
	
l8837:	
;led.c: 1012: unsigned char i;
;led.c: 1013: unsigned char temp_var1;
;led.c: 1014: unsigned int temp_var2;
;led.c: 1015: study_lamp_stab_state &= 0x07;
	movlw	(07h)
	andwf	(_study_lamp_stab_state),f
	line	1016
	
l8839:	
;led.c: 1016: temp_var1 = 0x01;
	clrf	(study_mode_time_calculation@temp_var1)
	incf	(study_mode_time_calculation@temp_var1),f
	line	1017
	
l8841:	
;led.c: 1017: for(i=0;i<3;i++)
	clrf	(study_mode_time_calculation@i)
	line	1019
	
l8847:	
;led.c: 1018: {
;led.c: 1019: if(study_lamp_stab_state==((~temp_var1)&0x07))
	comf	(study_mode_time_calculation@temp_var1),w
	andlw	07h
	xorwf	(_study_lamp_stab_state),w
	skipz
	goto	u6511
	goto	u6510
u6511:
	goto	l8929
u6510:
	line	1021
	
l8849:	
;led.c: 1020: {
;led.c: 1021: if((study_time_flag&temp_var1)==0)
	movf	(_study_time_flag),w
	andwf	(study_mode_time_calculation@temp_var1),w
	btfss	status,2
	goto	u6521
	goto	u6520
u6521:
	goto	l8921
u6520:
	line	1023
	
l8851:	
;led.c: 1022: {
;led.c: 1023: study_time_flag |= temp_var1;
	movf	(study_mode_time_calculation@temp_var1),w
	iorwf	(_study_time_flag),f
	line	1024
	
l8853:	
;led.c: 1024: current_study_counter[i]=0;
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_current_study_counter&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	1026
	
l8855:	
;led.c: 1026: if((i==2)||(i==0))
	movf	(study_mode_time_calculation@i),w
	xorlw	02h
	skipnz
	goto	u6531
	goto	u6530
u6531:
	goto	l8859
u6530:
	
l8857:	
	movf	(study_mode_time_calculation@i),f
	skipz
	goto	u6541
	goto	u6540
u6541:
	goto	l8911
u6540:
	line	1028
	
l8859:	
;led.c: 1027: {
;led.c: 1028: if(study_or_pulse_mode == 1)
	decf	(_study_or_pulse_mode),w
	skipz
	goto	u6551
	goto	u6550
u6551:
	goto	l8867
u6550:
	line	1030
	
l8861:	
;led.c: 1029: {
;led.c: 1030: pulse_to_study++;
	incf	(_pulse_to_study),f
	line	1031
	
l8863:	
;led.c: 1031: if(pulse_to_study >= 3)
	movlw	(03h)
	subwf	(_pulse_to_study),w
	skipc
	goto	u6561
	goto	u6560
u6561:
	goto	l8883
u6560:
	line	1033
	
l8865:	
;led.c: 1032: {
;led.c: 1033: study_or_pulse_mode = 0;
	clrf	(_study_or_pulse_mode)
	line	1034
;led.c: 1034: pulse_to_study = 0;
	clrf	(_pulse_to_study)
	goto	l8883
	line	1039
	
l8867:	
;led.c: 1037: else
;led.c: 1038: {
;led.c: 1039: if(study_to_pulse_flag != 0)
	movf	(_study_to_pulse_flag),w
	skipz
	goto	u6570
	goto	l8881
u6570:
	line	1041
	
l8869:	
;led.c: 1040: {
;led.c: 1041: study_to_pulse++;
	incf	(_study_to_pulse),f
	line	1042
	
l8871:	
;led.c: 1042: if(study_to_pulse >= 2)
	movlw	(02h)
	subwf	(_study_to_pulse),w
	skipc
	goto	u6581
	goto	u6580
u6581:
	goto	l8883
u6580:
	line	1044
	
l8873:	
;led.c: 1043: {
;led.c: 1044: study_to_pulse = 0;
	clrf	(_study_to_pulse)
	line	1045
	
l8875:	
;led.c: 1045: if(study_to_pulse_flag == 0x05) study_or_pulse_mode = 1;
	movf	(_study_to_pulse_flag),w
	xorlw	05h
	skipz
	goto	u6591
	goto	u6590
u6591:
	goto	l8879
u6590:
	
l8877:	
	clrf	(_study_or_pulse_mode)
	incf	(_study_or_pulse_mode),f
	line	1046
	
l8879:	
;led.c: 1046: study_to_pulse_flag = 0;
	clrf	(_study_to_pulse_flag)
	goto	l8883
	line	1049
	
l8881:	
;led.c: 1049: else study_to_pulse = 0;
	clrf	(_study_to_pulse)
	line	1051
	
l8883:	
;led.c: 1050: }
;led.c: 1051: if(communication_flag == 1)
	decf	(_communication_flag),w
	skipz
	goto	u6601
	goto	u6600
u6601:
	goto	l8891
u6600:
	line	1053
	
l8885:	
;led.c: 1052: {
;led.c: 1053: communication_counter++;
	incf	(_communication_counter),f
	line	1054
	
l8887:	
;led.c: 1054: if(communication_counter >= 3)
	movlw	(03h)
	subwf	(_communication_counter),w
	skipc
	goto	u6611
	goto	u6610
u6611:
	goto	l8891
u6610:
	line	1056
	
l8889:	
;led.c: 1055: {
;led.c: 1056: communication_counter = 0;
	clrf	(_communication_counter)
	line	1057
;led.c: 1057: communication_flag = 0;
	clrf	(_communication_flag)
	line	1060
	
l8891:	
;led.c: 1058: }
;led.c: 1059: }
;led.c: 1060: if((study_or_pulse_mode == 0)&&(communication_flag == 0))
	movf	(_study_or_pulse_mode),f
	skipz
	goto	u6621
	goto	u6620
u6621:
	goto	l9019
u6620:
	
l8893:	
	movf	(_communication_flag),f
	skipz
	goto	u6631
	goto	u6630
u6631:
	goto	l9019
u6630:
	line	1062
	
l8895:	
;led.c: 1061: {
;led.c: 1062: if((study_time_valid_flag&temp_var1)==temp_var1)
	movf	(_study_time_valid_flag),w
	andwf	(study_mode_time_calculation@temp_var1),w
	xorwf	(study_mode_time_calculation@temp_var1),w
	skipz
	goto	u6641
	goto	u6640
u6641:
	goto	l9019
u6640:
	line	1064
	
l8897:	
;led.c: 1063: {
;led.c: 1064: if(previous_study_counter[i] >= 60000) display_data[i] = 0;
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_previous_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	movlw	high(0EA60h)
	subwf	1+(??_study_mode_time_calculation+0)+0,w
	movlw	low(0EA60h)
	skipnz
	subwf	0+(??_study_mode_time_calculation+0)+0,w
	skipc
	goto	u6651
	goto	u6650
u6651:
	goto	l8901
u6650:
	
l8899:	
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_display_data&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	l9019
	line	1067
	
l8901:	
;led.c: 1065: else
;led.c: 1066: {
;led.c: 1067: display_data[i] = (previous_study_counter[i]+18)/100;
	movlw	064h
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_previous_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	movf	0+(??_study_mode_time_calculation+0)+0,w
	addlw	low(012h)
	movwf	0+(?___lwdiv)+02h
	movf	1+(??_study_mode_time_calculation+0)+0,w
	skipnc
	addlw	1
	addlw	high(012h)
	movwf	1+0+(?___lwdiv)+02h
	fcall	___lwdiv
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_display_data&0ffh
	movwf	fsr0
	movf	(0+(?___lwdiv)),w
	movwf	indf
	incf	fsr0,f
	movf	(1+(?___lwdiv)),w
	movwf	indf
	line	1068
	
l8903:	
;led.c: 1068: if(i==0)red_displaying_flag = 0;
	movf	(study_mode_time_calculation@i),f
	skipz
	goto	u6661
	goto	u6660
u6661:
	goto	l8907
u6660:
	
l8905:	
	clrf	(_red_displaying_flag)
	line	1069
	
l8907:	
;led.c: 1069: if(i==2)gre_displaying_flag = 0;
	movf	(study_mode_time_calculation@i),w
	xorlw	02h
	skipz
	goto	u6671
	goto	u6670
u6671:
	goto	l1411
u6670:
	
l8909:	
	clrf	(_gre_displaying_flag)
	goto	l9019
	line	1072
	
l1411:	
	line	1073
;led.c: 1070: }
;led.c: 1071: }
;led.c: 1072: }
;led.c: 1073: }
	goto	l9019
	line	1076
	
l8911:	
;led.c: 1074: else
;led.c: 1075: {
;led.c: 1076: if((study_time_valid_flag&temp_var1)==temp_var1)
	movf	(_study_time_valid_flag),w
	andwf	(study_mode_time_calculation@temp_var1),w
	xorwf	(study_mode_time_calculation@temp_var1),w
	skipz
	goto	u6681
	goto	u6680
u6681:
	goto	l1411
u6680:
	line	1078
	
l8913:	
;led.c: 1077: {
;led.c: 1078: yel_displaying_flag = 0;
	clrf	(_yel_displaying_flag)
	line	1079
	
l8915:	
;led.c: 1079: if(previous_study_counter[i] >= 60000) display_data[i] = 0;
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_previous_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	movlw	high(0EA60h)
	subwf	1+(??_study_mode_time_calculation+0)+0,w
	movlw	low(0EA60h)
	skipnz
	subwf	0+(??_study_mode_time_calculation+0)+0,w
	skipc
	goto	u6691
	goto	u6690
u6691:
	goto	l8919
u6690:
	
l8917:	
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_display_data&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	1080
	
l8919:	
;led.c: 1080: display_data[i] = (previous_study_counter[i]+18)/100;
	movlw	064h
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_previous_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	movf	0+(??_study_mode_time_calculation+0)+0,w
	addlw	low(012h)
	movwf	0+(?___lwdiv)+02h
	movf	1+(??_study_mode_time_calculation+0)+0,w
	skipnc
	addlw	1
	addlw	high(012h)
	movwf	1+0+(?___lwdiv)+02h
	fcall	___lwdiv
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_display_data&0ffh
	movwf	fsr0
	movf	(0+(?___lwdiv)),w
	movwf	indf
	incf	fsr0,f
	movf	(1+(?___lwdiv)),w
	movwf	indf
	goto	l9019
	line	1086
	
l8921:	
;led.c: 1084: else
;led.c: 1085: {
;led.c: 1086: current_study_counter[i]++;
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_current_study_counter&0ffh
	movwf	fsr0
	movlw	01h
	bcf	status, 7	;select IRP bank0
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	1087
;led.c: 1087: if(current_study_counter[i] >= 60000) current_study_counter[i] = 60000;
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_current_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	movlw	high(0EA60h)
	subwf	1+(??_study_mode_time_calculation+0)+0,w
	movlw	low(0EA60h)
	skipnz
	subwf	0+(??_study_mode_time_calculation+0)+0,w
	skipc
	goto	u6701
	goto	u6700
u6701:
	goto	l8925
u6700:
	
l8923:	
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_current_study_counter&0ffh
	movwf	fsr0
	movlw	low(0EA60h)
	movwf	indf
	incf	fsr0,f
	movlw	high(0EA60h)
	movwf	indf
	line	1088
	
l8925:	
;led.c: 1088: if((pulse_study_time_flag & temp_var1)==temp_var1) pulse_study_time_counter[i]++;
	movf	(_pulse_study_time_flag),w
	andwf	(study_mode_time_calculation@temp_var1),w
	xorwf	(study_mode_time_calculation@temp_var1),w
	skipz
	goto	u6711
	goto	u6710
u6711:
	goto	l9019
u6710:
	
l8927:	
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_pulse_study_time_counter&0ffh
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	goto	l9019
	line	1093
	
l8929:	
;led.c: 1091: else
;led.c: 1092: {
;led.c: 1093: if((study_time_flag&temp_var1)==temp_var1)
	movf	(_study_time_flag),w
	andwf	(study_mode_time_calculation@temp_var1),w
	xorwf	(study_mode_time_calculation@temp_var1),w
	skipz
	goto	u6721
	goto	u6720
u6721:
	goto	l8973
u6720:
	line	1095
	
l8931:	
;led.c: 1094: {
;led.c: 1095: study_time_flag &= ~temp_var1;
	comf	(study_mode_time_calculation@temp_var1),w
	andwf	(_study_time_flag),f
	line	1097
	
l8933:	
;led.c: 1097: if(previous_study_counter[i] >= current_study_counter[i])
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_current_study_counter&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_previous_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+2)+0+1
	movf	1+(??_study_mode_time_calculation+0)+0,w
	subwf	1+(??_study_mode_time_calculation+2)+0,w
	skipz
	goto	u6735
	movf	0+(??_study_mode_time_calculation+0)+0,w
	subwf	0+(??_study_mode_time_calculation+2)+0,w
u6735:
	skipc
	goto	u6731
	goto	u6730
u6731:
	goto	l8937
u6730:
	line	1099
	
l8935:	
;led.c: 1098: {
;led.c: 1099: temp_var2 = previous_study_counter[i]-current_study_counter[i];
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_current_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_previous_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+2)+0+1
	movf	0+(??_study_mode_time_calculation+0)+0,w
	subwf	0+(??_study_mode_time_calculation+2)+0,w
	movwf	(study_mode_time_calculation@temp_var2)
	movf	1+(??_study_mode_time_calculation+0)+0,w
	skipc
	incf	1+(??_study_mode_time_calculation+0)+0,w
	subwf	1+(??_study_mode_time_calculation+2)+0,w
	movwf	1+(study_mode_time_calculation@temp_var2)
	line	1100
;led.c: 1100: }
	goto	l8939
	line	1103
	
l8937:	
;led.c: 1101: else
;led.c: 1102: {
;led.c: 1103: temp_var2 = current_study_counter[i]-previous_study_counter[i];
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_previous_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_current_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+2)+0+1
	movf	0+(??_study_mode_time_calculation+0)+0,w
	subwf	0+(??_study_mode_time_calculation+2)+0,w
	movwf	(study_mode_time_calculation@temp_var2)
	movf	1+(??_study_mode_time_calculation+0)+0,w
	skipc
	incf	1+(??_study_mode_time_calculation+0)+0,w
	subwf	1+(??_study_mode_time_calculation+2)+0,w
	movwf	1+(study_mode_time_calculation@temp_var2)
	line	1105
	
l8939:	
;led.c: 1106: {
;led.c: 1107: if(0 == 0)
	movf	(_lamp_counter_valid_flag),w
	andwf	(study_mode_time_calculation@temp_var1),w
	xorwf	(study_mode_time_calculation@temp_var1),w
	skipz
	goto	u6741
	goto	u6740
u6741:
	goto	l8973
u6740:
	line	1109
	
l8941:	
;led.c: 1108: {
;led.c: 1109: if(temp_var2 > 140)
	movlw	high(08Dh)
	subwf	(study_mode_time_calculation@temp_var2+1),w
	movlw	low(08Dh)
	skipnz
	subwf	(study_mode_time_calculation@temp_var2),w
	skipc
	goto	u6751
	goto	u6750
u6751:
	goto	l8951
u6750:
	line	1111
	
l8943:	
;led.c: 1110: {
;led.c: 1111: if(previous_study_counter[i] != 0)
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_previous_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	incf	fsr0,f
	iorwf	indf,w
	skipnz
	goto	u6761
	goto	u6760
u6761:
	goto	l8951
u6760:
	line	1113
	
l8945:	
;led.c: 1112: {
;led.c: 1113: previous_study_counter[0] = 0;
	clrf	(_previous_study_counter)
	clrf	(_previous_study_counter+1)
	line	1114
;led.c: 1114: previous_study_counter[1] = 0;
	clrf	0+(_previous_study_counter)+02h
	clrf	1+(_previous_study_counter)+02h
	line	1115
;led.c: 1115: previous_study_counter[2] = 0;
	clrf	0+(_previous_study_counter)+04h
	clrf	1+(_previous_study_counter)+04h
	line	1116
	
l8947:	
;led.c: 1116: if(communication_flag == 0)
	movf	(_communication_flag),f
	skipz
	goto	u6771
	goto	u6770
u6771:
	goto	l1431
u6770:
	line	1118
	
l8949:	
;led.c: 1117: {
;led.c: 1118: display_data[0] = 0;
	clrf	(_display_data)
	clrf	(_display_data+1)
	line	1119
;led.c: 1119: display_data[1] = 0;
	clrf	0+(_display_data)+02h
	clrf	1+(_display_data)+02h
	line	1120
;led.c: 1120: display_data[2] = 0;
	clrf	0+(_display_data)+04h
	clrf	1+(_display_data)+04h
	line	1121
	
l1431:	
	line	1122
;led.c: 1121: }
;led.c: 1122: study_time_valid_flag = 0;
	clrf	(_study_time_valid_flag)
	line	1125
	
l8951:	
;led.c: 1123: }
;led.c: 1124: }
;led.c: 1125: previous_study_counter[i] = current_study_counter[i];
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_current_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_previous_study_counter&0ffh
	movwf	fsr0
	movf	0+(??_study_mode_time_calculation+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_study_mode_time_calculation+0)+0,w
	movwf	indf
	line	1126
	
l8953:	
;led.c: 1126: study_time_valid_flag |= temp_var1;
	movf	(study_mode_time_calculation@temp_var1),w
	iorwf	(_study_time_valid_flag),f
	line	1155
;led.c: 1127: }
	
l8973:	
;led.c: 1151: }
;led.c: 1152: }
;led.c: 1153: }
;led.c: 1154: }
;led.c: 1155: if(communication_flag == 0)
	movf	(_communication_flag),f
	skipz
	goto	u6781
	goto	u6780
u6781:
	goto	l9019
u6780:
	line	1157
	
l8975:	
;led.c: 1156: {
;led.c: 1157: if(i==0)
	movf	(study_mode_time_calculation@i),f
	skipz
	goto	u6791
	goto	u6790
u6791:
	goto	l8983
u6790:
	line	1159
	
l8977:	
;led.c: 1158: {
;led.c: 1159: if(red_displaying_flag == 1)
	decf	(_red_displaying_flag),w
	skipz
	goto	u6801
	goto	u6800
u6801:
	goto	l8983
u6800:
	line	1161
	
l8979:	
;led.c: 1160: {
;led.c: 1161: red_displaying_flag = 0;
	clrf	(_red_displaying_flag)
	line	1162
;led.c: 1162: display_data[0] = 0;
	clrf	(_display_data)
	clrf	(_display_data+1)
	line	1163
	
l8981:	
;led.c: 1163: red_displaying_end();
	fcall	_red_displaying_end
	line	1167
	
l8983:	
;led.c: 1164: }
;led.c: 1165: }
;led.c: 1167: if(i==1)
	decf	(study_mode_time_calculation@i),w
	skipz
	goto	u6811
	goto	u6810
u6811:
	goto	l8991
u6810:
	line	1169
	
l8985:	
;led.c: 1168: {
;led.c: 1169: if(yel_displaying_flag == 1)
	decf	(_yel_displaying_flag),w
	skipz
	goto	u6821
	goto	u6820
u6821:
	goto	l8991
u6820:
	line	1171
	
l8987:	
;led.c: 1170: {
;led.c: 1171: yel_displaying_flag = 0;
	clrf	(_yel_displaying_flag)
	line	1172
;led.c: 1172: display_data[1] = 0;
	clrf	0+(_display_data)+02h
	clrf	1+(_display_data)+02h
	line	1173
	
l8989:	
;led.c: 1173: yel_displaying_end();
	fcall	_yel_displaying_end
	line	1177
	
l8991:	
;led.c: 1174: }
;led.c: 1175: }
;led.c: 1177: if(i==2)
	movf	(study_mode_time_calculation@i),w
	xorlw	02h
	skipz
	goto	u6831
	goto	u6830
u6831:
	goto	l8999
u6830:
	line	1179
	
l8993:	
;led.c: 1178: {
;led.c: 1179: if(gre_displaying_flag == 1)
	decf	(_gre_displaying_flag),w
	skipz
	goto	u6841
	goto	u6840
u6841:
	goto	l8999
u6840:
	line	1181
	
l8995:	
;led.c: 1180: {
;led.c: 1181: gre_displaying_flag = 0;
	clrf	(_gre_displaying_flag)
	line	1182
;led.c: 1182: display_data[2] = 0;
	clrf	0+(_display_data)+04h
	clrf	1+(_display_data)+04h
	line	1183
	
l8997:	
;led.c: 1183: gre_displaying_end();
	fcall	_gre_displaying_end
	line	1187
	
l8999:	
;led.c: 1184: }
;led.c: 1185: }
;led.c: 1187: if((pulse_study_time_flag&temp_var1)==temp_var1)
	movf	(_pulse_study_time_flag),w
	andwf	(study_mode_time_calculation@temp_var1),w
	xorwf	(study_mode_time_calculation@temp_var1),w
	skipz
	goto	u6851
	goto	u6850
u6851:
	goto	l9019
u6850:
	line	1189
	
l9001:	
;led.c: 1188: {
;led.c: 1189: if(pulse_down_times[i] >= pulse_study_time_counter[i]) temp_var2 = pulse_down_times[i] - pulse_study_time_counter[i];
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_pulse_study_time_counter&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_pulse_down_times&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+2)+0+1
	movf	1+(??_study_mode_time_calculation+0)+0,w
	subwf	1+(??_study_mode_time_calculation+2)+0,w
	skipz
	goto	u6865
	movf	0+(??_study_mode_time_calculation+0)+0,w
	subwf	0+(??_study_mode_time_calculation+2)+0,w
u6865:
	skipc
	goto	u6861
	goto	u6860
u6861:
	goto	l9005
u6860:
	
l9003:	
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_pulse_study_time_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_pulse_down_times&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+2)+0+1
	movf	0+(??_study_mode_time_calculation+0)+0,w
	subwf	0+(??_study_mode_time_calculation+2)+0,w
	movwf	(study_mode_time_calculation@temp_var2)
	movf	1+(??_study_mode_time_calculation+0)+0,w
	skipc
	incf	1+(??_study_mode_time_calculation+0)+0,w
	subwf	1+(??_study_mode_time_calculation+2)+0,w
	movwf	1+(study_mode_time_calculation@temp_var2)
	goto	l9007
	line	1190
	
l9005:	
;led.c: 1190: else temp_var2 = pulse_study_time_counter[i] - pulse_down_times[i];
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_pulse_down_times&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_pulse_study_time_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+2)+0+1
	movf	0+(??_study_mode_time_calculation+0)+0,w
	subwf	0+(??_study_mode_time_calculation+2)+0,w
	movwf	(study_mode_time_calculation@temp_var2)
	movf	1+(??_study_mode_time_calculation+0)+0,w
	skipc
	incf	1+(??_study_mode_time_calculation+0)+0,w
	subwf	1+(??_study_mode_time_calculation+2)+0,w
	movwf	1+(study_mode_time_calculation@temp_var2)
	line	1191
	
l9007:	
;led.c: 1191: if(temp_var2 > 140)
	movlw	high(08Dh)
	subwf	(study_mode_time_calculation@temp_var2+1),w
	movlw	low(08Dh)
	skipnz
	subwf	(study_mode_time_calculation@temp_var2),w
	skipc
	goto	u6871
	goto	u6870
u6871:
	goto	l9013
u6870:
	line	1193
	
l9009:	
;led.c: 1192: {
;led.c: 1193: if(pulse_down_times[i] != 0)
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_pulse_down_times&0ffh
	movwf	fsr0
	movf	indf,w
	incf	fsr0,f
	iorwf	indf,w
	skipnz
	goto	u6881
	goto	u6880
u6881:
	goto	l9013
u6880:
	line	1195
	
l9011:	
;led.c: 1194: {
;led.c: 1195: pulse_down_time_valid_flag = 0;
	clrf	(_pulse_down_time_valid_flag)
	line	1196
;led.c: 1196: pulse_down_times[0] = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_pulse_down_times)^080h
	clrf	(_pulse_down_times+1)^080h
	line	1197
;led.c: 1197: pulse_down_times[1] = 0;
	clrf	0+(_pulse_down_times)^080h+02h
	clrf	1+(_pulse_down_times)^080h+02h
	line	1198
;led.c: 1198: pulse_down_times[2] = 0;
	clrf	0+(_pulse_down_times)^080h+04h
	clrf	1+(_pulse_down_times)^080h+04h
	line	1201
	
l9013:	
;led.c: 1199: }
;led.c: 1200: }
;led.c: 1201: pulse_down_times[i] = pulse_study_time_counter[i];
	bcf	status, 5	;RP0=0, select bank0
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_pulse_study_time_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_study_mode_time_calculation+0)+0+1
	clrc
	rlf	(study_mode_time_calculation@i),w
	addlw	_pulse_down_times&0ffh
	movwf	fsr0
	movf	0+(??_study_mode_time_calculation+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_study_mode_time_calculation+0)+0,w
	movwf	indf
	line	1202
	
l9015:	
;led.c: 1202: pulse_down_time_valid_flag |= temp_var1;
	movf	(study_mode_time_calculation@temp_var1),w
	iorwf	(_pulse_down_time_valid_flag),f
	line	1203
	
l9017:	
;led.c: 1203: pulse_study_time_flag &= ~temp_var1;
	comf	(study_mode_time_calculation@temp_var1),w
	andwf	(_pulse_study_time_flag),f
	line	1207
	
l9019:	
;led.c: 1204: }
;led.c: 1205: }
;led.c: 1206: }
;led.c: 1207: if(((study_lamp_stab_state&temp_var1)==temp_var1)&&(study_lamp_stab_state!=0x07))
	movf	(_study_lamp_stab_state),w
	andwf	(study_mode_time_calculation@temp_var1),w
	xorwf	(study_mode_time_calculation@temp_var1),w
	skipz
	goto	u6891
	goto	u6890
u6891:
	goto	l9031
u6890:
	
l9021:	
	movf	(_study_lamp_stab_state),w
	xorlw	07h
	skipnz
	goto	u6901
	goto	u6900
u6901:
	goto	l9031
u6900:
	line	1209
	
l9023:	
;led.c: 1208: {
;led.c: 1209: if(temp_var1 == 0x01)
	decf	(study_mode_time_calculation@temp_var1),w
	skipz
	goto	u6911
	goto	u6910
u6911:
	goto	l9027
u6910:
	line	1211
	
l9025:	
;led.c: 1210: {
;led.c: 1211: if(restart_flag != 0) lamp_counter_valid_flag |= temp_var1;
	movf	(_restart_flag),w
	skipz
	goto	u6920
	goto	l9031
u6920:
	
l9027:	
	movf	(study_mode_time_calculation@temp_var1),w
	iorwf	(_lamp_counter_valid_flag),f
	line	1215
	
l9031:	
;led.c: 1214: }
;led.c: 1215: temp_var1 <<= 1;
	clrc
	rlf	(study_mode_time_calculation@temp_var1),f
	line	1017
	
l9033:	
	incf	(study_mode_time_calculation@i),f
	movlw	(03h)
	subwf	(study_mode_time_calculation@i),w
	skipc
	goto	u6931
	goto	u6930
u6931:
	goto	l8847
u6930:
	line	1217
	
l1453:	
	return
	opt stack 0
GLOBAL	__end_of_study_mode_time_calculation
	__end_of_study_mode_time_calculation:
;; =============== function _study_mode_time_calculation ends ============

	signat	_study_mode_time_calculation,88
	global	_syn_wink_manage
psect	text1021,local,class=CODE,delta=2
global __ptext1021
__ptext1021:

;; *************** function _syn_wink_manage *****************
;; Defined at:
;;		line 574 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1   11[BANK0 ] unsigned char 
;;  tempdata        1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_red_displaying
;;		_yel_displaying
;;		_gre_displaying
;;		_red_displaying_end
;; This function is called by:
;;		_down_time_display
;; This function uses a non-reentrant model
;;
psect	text1021
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	574
	global	__size_of_syn_wink_manage
	__size_of_syn_wink_manage	equ	__end_of_syn_wink_manage-_syn_wink_manage
	
_syn_wink_manage:	
	opt	stack 3
; Regs used in _syn_wink_manage: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;syn_wink_manage@channel stored from wreg
	line	579
	movwf	(syn_wink_manage@channel)
	
l8777:	
;led.c: 578: {
;led.c: 579: tempdata = (0x01<<channel);
	movlw	(01h)
	movwf	(??_syn_wink_manage+0)+0
	incf	(syn_wink_manage@channel),w
	goto	u6414
u6415:
	clrc
	rlf	(??_syn_wink_manage+0)+0,f
u6414:
	addlw	-1
	skipz
	goto	u6415
	movf	0+(??_syn_wink_manage+0)+0,w
	movwf	(syn_wink_manage@tempdata)
	line	580
	
l8779:	
;led.c: 580: if(syn_wink_display_updata == 1)
	decf	(_syn_wink_display_updata),w
	skipz
	goto	u6421
	goto	u6420
u6421:
	goto	l8801
u6420:
	line	582
	
l8781:	
;led.c: 581: {
;led.c: 582: syn_wink_display_updata = 0;
	clrf	(_syn_wink_display_updata)
	line	583
	
l8783:	
;led.c: 583: if((lamp_stab_state&tempdata) == 0)
	movf	(_lamp_stab_state),w
	andwf	(syn_wink_manage@tempdata),w
	btfss	status,2
	goto	u6431
	goto	u6430
u6431:
	goto	l8797
u6430:
	line	585
	
l8785:	
;led.c: 584: {
;led.c: 585: if(channel == 0) red_displaying(display_data[0]);
	movf	(syn_wink_manage@channel),f
	skipz
	goto	u6441
	goto	u6440
u6441:
	goto	l8789
u6440:
	
l8787:	
	movf	(_display_data+1),w
	movwf	(?_red_displaying+1)
	movf	(_display_data),w
	movwf	(?_red_displaying)
	fcall	_red_displaying
	goto	l8795
	line	586
	
l8789:	
;led.c: 586: else if(channel == 1) yel_displaying(display_data[1]);
	decf	(syn_wink_manage@channel),w
	skipz
	goto	u6451
	goto	u6450
u6451:
	goto	l8793
u6450:
	
l8791:	
	movf	1+(_display_data)+02h,w
	movwf	(?_yel_displaying+1)
	movf	0+(_display_data)+02h,w
	movwf	(?_yel_displaying)
	fcall	_yel_displaying
	goto	l8795
	line	587
	
l8793:	
;led.c: 587: else gre_displaying(display_data[2]);
	movf	1+(_display_data)+04h,w
	movwf	(?_gre_displaying+1)
	movf	0+(_display_data)+04h,w
	movwf	(?_gre_displaying)
	fcall	_gre_displaying
	line	588
	
l8795:	
;led.c: 588: syn_wink_display_state = 1;
	clrf	(_syn_wink_display_state)
	incf	(_syn_wink_display_state),f
	line	589
;led.c: 589: }
	goto	l8801
	line	592
	
l8797:	
;led.c: 590: else
;led.c: 591: {
;led.c: 592: red_displaying_end();
	fcall	_red_displaying_end
	line	593
	
l8799:	
;led.c: 593: syn_wink_display_state = 0;
	clrf	(_syn_wink_display_state)
	line	597
	
l8801:	
;led.c: 594: }
;led.c: 595: }
;led.c: 597: if(syn_wink_display_state == 1)
	decf	(_syn_wink_display_state),w
	skipz
	goto	u6461
	goto	u6460
u6461:
	goto	l8809
u6460:
	line	599
	
l8803:	
;led.c: 598: {
;led.c: 599: if((lamp_stab_state&tempdata) != 0)
	movf	(_lamp_stab_state),w
	andwf	(syn_wink_manage@tempdata),w
	btfsc	status,2
	goto	u6471
	goto	u6470
u6471:
	goto	l1287
u6470:
	line	601
	
l8805:	
;led.c: 600: {
;led.c: 601: red_displaying_end();
	fcall	_red_displaying_end
	line	602
	
l8807:	
;led.c: 602: syn_wink_display_state = 0;
	clrf	(_syn_wink_display_state)
	goto	l1287
	line	607
	
l8809:	
;led.c: 605: else
;led.c: 606: {
;led.c: 607: if((lamp_stab_state&tempdata) == 0)
	movf	(_lamp_stab_state),w
	andwf	(syn_wink_manage@tempdata),w
	btfss	status,2
	goto	u6481
	goto	u6480
u6481:
	goto	l1287
u6480:
	line	609
	
l8811:	
;led.c: 608: {
;led.c: 609: if(channel == 0) red_displaying(display_data[0]);
	movf	(syn_wink_manage@channel),f
	skipz
	goto	u6491
	goto	u6490
u6491:
	goto	l8815
u6490:
	
l8813:	
	movf	(_display_data+1),w
	movwf	(?_red_displaying+1)
	movf	(_display_data),w
	movwf	(?_red_displaying)
	fcall	_red_displaying
	goto	l8821
	line	610
	
l8815:	
;led.c: 610: else if(channel == 1) yel_displaying(display_data[1]);
	decf	(syn_wink_manage@channel),w
	skipz
	goto	u6501
	goto	u6500
u6501:
	goto	l8819
u6500:
	
l8817:	
	movf	1+(_display_data)+02h,w
	movwf	(?_yel_displaying+1)
	movf	0+(_display_data)+02h,w
	movwf	(?_yel_displaying)
	fcall	_yel_displaying
	goto	l8821
	line	611
	
l8819:	
;led.c: 611: else gre_displaying(display_data[2]);
	movf	1+(_display_data)+04h,w
	movwf	(?_gre_displaying+1)
	movf	0+(_display_data)+04h,w
	movwf	(?_gre_displaying)
	fcall	_gre_displaying
	line	612
	
l8821:	
;led.c: 612: syn_wink_display_state = 1;
	clrf	(_syn_wink_display_state)
	incf	(_syn_wink_display_state),f
	line	626
	
l1287:	
	return
	opt stack 0
GLOBAL	__end_of_syn_wink_manage
	__end_of_syn_wink_manage:
;; =============== function _syn_wink_manage ends ============

	signat	_syn_wink_manage,4216
	global	_g_segment_displaying
psect	text1022,local,class=CODE,delta=2
global __ptext1022
__ptext1022:

;; *************** function _g_segment_displaying *****************
;; Defined at:
;;		line 542 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;  number          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  number          1    4[BANK0 ] unsigned char 
;;  k               1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_red_displaydrv
;;		_yel_displaydrv
;;		_gre_displaydrv
;;		_gre_displaying_end
;; This function is called by:
;;		_G_Segment_Wink
;; This function uses a non-reentrant model
;;
psect	text1022
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	542
	global	__size_of_g_segment_displaying
	__size_of_g_segment_displaying	equ	__end_of_g_segment_displaying-_g_segment_displaying
	
_g_segment_displaying:	
	opt	stack 3
; Regs used in _g_segment_displaying: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;g_segment_displaying@number stored from wreg
	movwf	(g_segment_displaying@number)
	line	544
	
l8727:	
;led.c: 543: unsigned char k;
;led.c: 544: switch(number)
	goto	l8775
	line	547
	
l8729:	
;led.c: 547: red_displaydrv(REDWORDS[11]);
	movlw	(_REDWORDS-__stringbase)+016h
	movwf	fsr0
	fcall	stringdir
	movwf	(?_red_displaydrv)
	fcall	stringdir
	movwf	(?_red_displaydrv+1)
	fcall	_red_displaydrv
	line	548
;led.c: 548: red_displaydrv(REDWORDS[11]);
	movlw	(_REDWORDS-__stringbase)+016h
	movwf	fsr0
	fcall	stringdir
	movwf	(?_red_displaydrv)
	fcall	stringdir
	movwf	(?_red_displaydrv+1)
	fcall	_red_displaydrv
	line	549
	
l8731:	
;led.c: 549: RB5=1;
	bsf	(53/8),(53)&7
	line	550
	
l8733:	
;led.c: 550: for(k=0;k<12;k++);
	clrf	(g_segment_displaying@k)
	
l8739:	
	incf	(g_segment_displaying@k),f
	
l8741:	
	movlw	(0Ch)
	subwf	(g_segment_displaying@k),w
	skipc
	goto	u6381
	goto	u6380
u6381:
	goto	l8739
u6380:
	
l1253:	
	line	551
;led.c: 551: RB5=0;
	bcf	(53/8),(53)&7
	line	552
;led.c: 552: break;
	goto	l1262
	line	554
	
l8743:	
;led.c: 554: yel_displaydrv(YELWORDS[11]);
	movlw	(_YELWORDS-__stringbase)+016h
	movwf	fsr0
	fcall	stringdir
	movwf	(?_yel_displaydrv)
	fcall	stringdir
	movwf	(?_yel_displaydrv+1)
	fcall	_yel_displaydrv
	line	555
;led.c: 555: yel_displaydrv(YELWORDS[11]);
	movlw	(_YELWORDS-__stringbase)+016h
	movwf	fsr0
	fcall	stringdir
	movwf	(?_yel_displaydrv)
	fcall	stringdir
	movwf	(?_yel_displaydrv+1)
	fcall	_yel_displaydrv
	line	556
	
l8745:	
;led.c: 556: RB5=1;
	bsf	(53/8),(53)&7
	line	557
	
l8747:	
;led.c: 557: for(k=0;k<12;k++);
	clrf	(g_segment_displaying@k)
	
l8753:	
	incf	(g_segment_displaying@k),f
	
l8755:	
	movlw	(0Ch)
	subwf	(g_segment_displaying@k),w
	skipc
	goto	u6391
	goto	u6390
u6391:
	goto	l8753
u6390:
	goto	l1253
	line	561
	
l8757:	
;led.c: 561: gre_displaydrv(GREWORDS[11]);
	movlw	(_GREWORDS-__stringbase)+016h
	movwf	fsr0
	fcall	stringdir
	movwf	(?_gre_displaydrv)
	fcall	stringdir
	movwf	(?_gre_displaydrv+1)
	fcall	_gre_displaydrv
	line	562
;led.c: 562: gre_displaydrv(GREWORDS[11]);
	movlw	(_GREWORDS-__stringbase)+016h
	movwf	fsr0
	fcall	stringdir
	movwf	(?_gre_displaydrv)
	fcall	stringdir
	movwf	(?_gre_displaydrv+1)
	fcall	_gre_displaydrv
	line	563
	
l8759:	
;led.c: 563: RB5=1;
	bsf	(53/8),(53)&7
	line	564
	
l8761:	
;led.c: 564: for(k=0;k<12;k++);
	clrf	(g_segment_displaying@k)
	
l8767:	
	incf	(g_segment_displaying@k),f
	
l8769:	
	movlw	(0Ch)
	subwf	(g_segment_displaying@k),w
	skipc
	goto	u6401
	goto	u6400
u6401:
	goto	l8767
u6400:
	goto	l1253
	line	568
	
l8771:	
;led.c: 568: gre_displaying_end();
	fcall	_gre_displaying_end
	line	569
;led.c: 569: break;
	goto	l1262
	line	544
	
l8775:	
	movf	(g_segment_displaying@number),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           13     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l8729
	xorlw	1^0	; case 1
	skipnz
	goto	l8743
	xorlw	2^1	; case 2
	skipnz
	goto	l8757
	goto	l8771
	opt asmopt_on

	line	571
	
l1262:	
	return
	opt stack 0
GLOBAL	__end_of_g_segment_displaying
	__end_of_g_segment_displaying:
;; =============== function _g_segment_displaying ends ============

	signat	_g_segment_displaying,4216
	global	_seek_down_pulse
psect	text1023,local,class=CODE,delta=2
global __ptext1023
__ptext1023:

;; *************** function _seek_down_pulse *****************
;; Defined at:
;;		line 865 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    7[BANK0 ] unsigned char 
;;  temp_var1       1    6[BANK0 ] unsigned char 
;;  temp_var3       1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lwdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1023
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	865
	global	__size_of_seek_down_pulse
	__size_of_seek_down_pulse	equ	__end_of_seek_down_pulse-_seek_down_pulse
	
_seek_down_pulse:	
	opt	stack 5
; Regs used in _seek_down_pulse: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	869
	
l8631:	
;led.c: 866: unsigned char i;
;led.c: 867: unsigned char temp_var1;
;led.c: 868: unsigned char temp_var3;
;led.c: 869: temp_var1 = 0x01;
	clrf	(seek_down_pulse@temp_var1)
	incf	(seek_down_pulse@temp_var1),f
	line	870
	
l8633:	
;led.c: 870: for(i=0;i<3;i++)
	clrf	(seek_down_pulse@i)
	line	872
	
l8639:	
;led.c: 871: {
;led.c: 872: temp_var3 = ((~temp_var1)&0x07);
	comf	(seek_down_pulse@temp_var1),w
	movwf	(seek_down_pulse@temp_var3)
	
l8641:	
	movlw	(07h)
	andwf	(seek_down_pulse@temp_var3),f
	line	873
	
l8643:	
;led.c: 873: if(i != 1)
	decf	(seek_down_pulse@i),w
	skipnz
	goto	u6191
	goto	u6190
u6191:
	goto	l8721
u6190:
	line	875
	
l8645:	
;led.c: 874: {
;led.c: 875: if((lamp_stab_state&temp_var1)==0)
	movf	(_lamp_stab_state),w
	andwf	(seek_down_pulse@temp_var1),w
	btfss	status,2
	goto	u6201
	goto	u6200
u6201:
	goto	l8709
u6200:
	line	877
	
l8647:	
;led.c: 876: {
;led.c: 877: if((lamp_on_flag&temp_var1)==0)
	movf	(_lamp_on_flag),w
	andwf	(seek_down_pulse@temp_var1),w
	btfss	status,2
	goto	u6211
	goto	u6210
u6211:
	goto	l8705
u6210:
	line	879
	
l8649:	
;led.c: 878: {
;led.c: 879: lamp_on_flag |= temp_var1;
	movf	(seek_down_pulse@temp_var1),w
	iorwf	(_lamp_on_flag),f
	line	880
;led.c: 880: lamp_off_flag &= ~temp_var1;
	comf	(seek_down_pulse@temp_var1),w
	andwf	(_lamp_off_flag),f
	line	881
	
l8651:	
;led.c: 881: if((lamp_off_counter[i] >= (80-34))&&(lamp_off_counter[i] <= (350+5)))
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_off_counter&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_seek_down_pulse+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_seek_down_pulse+0)+0+1
	movlw	high(02Eh)
	subwf	1+(??_seek_down_pulse+0)+0,w
	movlw	low(02Eh)
	skipnz
	subwf	0+(??_seek_down_pulse+0)+0,w
	skipc
	goto	u6221
	goto	u6220
u6221:
	goto	l8703
u6220:
	
l8653:	
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_off_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_seek_down_pulse+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_seek_down_pulse+0)+0+1
	movlw	high(0164h)
	subwf	1+(??_seek_down_pulse+0)+0,w
	movlw	low(0164h)
	skipnz
	subwf	0+(??_seek_down_pulse+0)+0,w
	skipnc
	goto	u6231
	goto	u6230
u6231:
	goto	l8703
u6230:
	line	883
	
l8655:	
;led.c: 882: {
;led.c: 883: if(lamp_on_counter[i]>=900)
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_on_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_seek_down_pulse+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_seek_down_pulse+0)+0+1
	movlw	high(0384h)
	subwf	1+(??_seek_down_pulse+0)+0,w
	movlw	low(0384h)
	skipnz
	subwf	0+(??_seek_down_pulse+0)+0,w
	skipc
	goto	u6241
	goto	u6240
u6241:
	goto	l8703
u6240:
	line	885
	
l8657:	
;led.c: 884: {
;led.c: 885: if(study_or_pulse_mode == 1)
	decf	(_study_or_pulse_mode),w
	skipz
	goto	u6251
	goto	u6250
u6251:
	goto	l8693
u6250:
	line	887
	
l8659:	
;led.c: 886: {
;led.c: 887: pulse_to_study = 0;
	clrf	(_pulse_to_study)
	line	888
	
l8661:	
;led.c: 888: if(communication_flag == 0)
	movf	(_communication_flag),f
	skipz
	goto	u6261
	goto	u6260
u6261:
	goto	l1367
u6260:
	line	890
	
l8663:	
;led.c: 889: {
;led.c: 890: if(lamp_stab_state == temp_var3)
	movf	(_lamp_stab_state),w
	xorwf	(seek_down_pulse@temp_var3),w
	skipz
	goto	u6271
	goto	u6270
u6271:
	goto	l1367
u6270:
	line	900
	
l8677:	
;led.c: 898: else
;led.c: 899: {
;led.c: 900: if((display_data[i] == 0)&&(pulse_down_time_valid_flag & temp_var1)==temp_var1)
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_display_data&0ffh
	movwf	fsr0
	movf	indf,w
	incf	fsr0,f
	iorwf	indf,w
	skipz
	goto	u6281
	goto	u6280
u6281:
	goto	l8691
u6280:
	
l8679:	
	movf	(_pulse_down_time_valid_flag),w
	andwf	(seek_down_pulse@temp_var1),w
	xorwf	(seek_down_pulse@temp_var1),w
	skipz
	goto	u6291
	goto	u6290
u6291:
	goto	l8691
u6290:
	line	902
	
l8681:	
;led.c: 901: {
;led.c: 902: if(i==0)red_displaying_flag = 0;
	movf	(seek_down_pulse@i),f
	skipz
	goto	u6301
	goto	u6300
u6301:
	goto	l8685
u6300:
	
l8683:	
	clrf	(_red_displaying_flag)
	line	903
	
l8685:	
;led.c: 903: if(i==2)gre_displaying_flag = 0;
	movf	(seek_down_pulse@i),w
	xorlw	02h
	skipz
	goto	u6311
	goto	u6310
u6311:
	goto	l8689
u6310:
	
l8687:	
	clrf	(_gre_displaying_flag)
	line	904
	
l8689:	
;led.c: 904: display_data[i] = (pulse_down_times[i]+18)/100;
	movlw	064h
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_pulse_down_times&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_seek_down_pulse+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_seek_down_pulse+0)+0+1
	movf	0+(??_seek_down_pulse+0)+0,w
	addlw	low(012h)
	movwf	0+(?___lwdiv)+02h
	movf	1+(??_seek_down_pulse+0)+0,w
	skipnc
	addlw	1
	addlw	high(012h)
	movwf	1+0+(?___lwdiv)+02h
	fcall	___lwdiv
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_display_data&0ffh
	movwf	fsr0
	movf	(0+(?___lwdiv)),w
	movwf	indf
	incf	fsr0,f
	movf	(1+(?___lwdiv)),w
	movwf	indf
	line	907
	
l8691:	
;led.c: 905: }
;led.c: 906: }
;led.c: 907: lamp_off_time[i] = (lamp_off_counter[i]/10)-3;
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_off_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	0+(?___lwdiv)+02h
	incf	fsr0,f
	movf	indf,w
	movwf	1+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	0FDh
	movwf	(??_seek_down_pulse+0)+0
	movf	(seek_down_pulse@i),w
	addlw	_lamp_off_time&0ffh
	movwf	fsr0
	movf	(??_seek_down_pulse+0)+0,w
	movwf	indf
	goto	l1367
	line	913
	
l8693:	
;led.c: 911: else
;led.c: 912: {
;led.c: 913: if((study_to_pulse_flag & temp_var1)==temp_var1) study_to_pulse_flag &= (~temp_var1);
	movf	(_study_to_pulse_flag),w
	andwf	(seek_down_pulse@temp_var1),w
	xorwf	(seek_down_pulse@temp_var1),w
	skipz
	goto	u6321
	goto	u6320
u6321:
	goto	l8697
u6320:
	
l8695:	
	comf	(seek_down_pulse@temp_var1),w
	andwf	(_study_to_pulse_flag),f
	goto	l1367
	line	914
	
l8697:	
;led.c: 914: else study_to_pulse_flag |= temp_var1;
	movf	(seek_down_pulse@temp_var1),w
	iorwf	(_study_to_pulse_flag),f
	line	915
	
l1367:	
	line	917
;led.c: 915: }
;led.c: 917: if((pulse_study_time_flag & temp_var1)==0)
	movf	(_pulse_study_time_flag),w
	andwf	(seek_down_pulse@temp_var1),w
	btfss	status,2
	goto	u6331
	goto	u6330
u6331:
	goto	l8703
u6330:
	line	919
	
l8699:	
;led.c: 918: {
;led.c: 919: pulse_study_time_flag |= temp_var1;
	movf	(seek_down_pulse@temp_var1),w
	iorwf	(_pulse_study_time_flag),f
	line	920
	
l8701:	
;led.c: 920: pulse_study_time_counter[i]=lamp_off_counter[i]/10;
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_off_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	0+(?___lwdiv)+02h
	incf	fsr0,f
	movf	indf,w
	movwf	1+(?___lwdiv)+02h
	fcall	___lwdiv
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_pulse_study_time_counter&0ffh
	movwf	fsr0
	movf	(0+(?___lwdiv)),w
	movwf	indf
	incf	fsr0,f
	movf	(1+(?___lwdiv)),w
	movwf	indf
	line	924
	
l8703:	
;led.c: 921: }
;led.c: 922: }
;led.c: 923: }
;led.c: 924: lamp_on_counter[i]=0;
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_on_counter&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	925
;led.c: 925: }
	goto	l8721
	line	928
	
l8705:	
;led.c: 926: else
;led.c: 927: {
;led.c: 928: lamp_on_counter[i]++;
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_on_counter&0ffh
	movwf	fsr0
	movlw	01h
	bcf	status, 7	;select IRP bank1
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	929
;led.c: 929: if(lamp_on_counter[i] >= 50000) lamp_on_counter[i] = 50000;
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_on_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_seek_down_pulse+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_seek_down_pulse+0)+0+1
	movlw	high(0C350h)
	subwf	1+(??_seek_down_pulse+0)+0,w
	movlw	low(0C350h)
	skipnz
	subwf	0+(??_seek_down_pulse+0)+0,w
	skipc
	goto	u6341
	goto	u6340
u6341:
	goto	l1373
u6340:
	
l8707:	
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_on_counter&0ffh
	movwf	fsr0
	movlw	low(0C350h)
	movwf	indf
	incf	fsr0,f
	movlw	high(0C350h)
	movwf	indf
	goto	l8721
	line	934
	
l8709:	
;led.c: 932: else
;led.c: 933: {
;led.c: 934: if((lamp_off_flag & temp_var1)==0)
	movf	(_lamp_off_flag),w
	andwf	(seek_down_pulse@temp_var1),w
	btfss	status,2
	goto	u6351
	goto	u6350
u6351:
	goto	l8717
u6350:
	line	936
	
l8711:	
;led.c: 935: {
;led.c: 936: lamp_off_flag |= temp_var1;
	movf	(seek_down_pulse@temp_var1),w
	iorwf	(_lamp_off_flag),f
	line	937
	
l8713:	
;led.c: 937: lamp_off_counter[i]=0;
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_off_counter&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	938
	
l8715:	
;led.c: 938: lamp_on_flag &= ~temp_var1;
	comf	(seek_down_pulse@temp_var1),w
	andwf	(_lamp_on_flag),f
	line	939
;led.c: 939: }
	goto	l8721
	line	942
	
l8717:	
;led.c: 940: else
;led.c: 941: {
;led.c: 942: lamp_off_counter[i]++;
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_off_counter&0ffh
	movwf	fsr0
	movlw	01h
	bcf	status, 7	;select IRP bank1
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	943
;led.c: 943: if(lamp_off_counter[i] >= 50000) lamp_off_counter[i]=50000;
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_off_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_seek_down_pulse+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_seek_down_pulse+0)+0+1
	movlw	high(0C350h)
	subwf	1+(??_seek_down_pulse+0)+0,w
	movlw	low(0C350h)
	skipnz
	subwf	0+(??_seek_down_pulse+0)+0,w
	skipc
	goto	u6361
	goto	u6360
u6361:
	goto	l1373
u6360:
	
l8719:	
	clrc
	rlf	(seek_down_pulse@i),w
	addlw	_lamp_off_counter&0ffh
	movwf	fsr0
	movlw	low(0C350h)
	movwf	indf
	incf	fsr0,f
	movlw	high(0C350h)
	movwf	indf
	goto	l8721
	line	945
	
l1373:	
	line	947
	
l8721:	
;led.c: 944: }
;led.c: 945: }
;led.c: 946: }
;led.c: 947: temp_var1 <<= 1;
	clrc
	rlf	(seek_down_pulse@temp_var1),f
	line	870
	
l8723:	
	incf	(seek_down_pulse@i),f
	
l8725:	
	movlw	(03h)
	subwf	(seek_down_pulse@i),w
	skipc
	goto	u6371
	goto	u6370
u6371:
	goto	l8639
u6370:
	line	949
	
l1377:	
	return
	opt stack 0
GLOBAL	__end_of_seek_down_pulse
	__end_of_seek_down_pulse:
;; =============== function _seek_down_pulse ends ============

	signat	_seek_down_pulse,88
	global	_gre_displaying_end
psect	text1024,local,class=CODE,delta=2
global __ptext1024
__ptext1024:

;; *************** function _gre_displaying_end *****************
;; Defined at:
;;		line 532 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_gre_displaydrv
;; This function is called by:
;;		_g_segment_displaying
;;		_down_time_display
;;		_study_mode_time_calculation
;;		_G_Segment_Wink
;;		_usart_data_analyse
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1024
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	532
	global	__size_of_gre_displaying_end
	__size_of_gre_displaying_end	equ	__end_of_gre_displaying_end-_gre_displaying_end
	
_gre_displaying_end:	
	opt	stack 4
; Regs used in _gre_displaying_end: [wreg+status,2+status,0+pclath+cstack]
	line	534
	
l8617:	
;led.c: 533: unsigned char k;
;led.c: 534: gre_displaydrv(0x0000);
	clrf	(?_gre_displaydrv)
	clrf	(?_gre_displaydrv+1)
	fcall	_gre_displaydrv
	line	535
;led.c: 535: gre_displaydrv(0x0000);
	clrf	(?_gre_displaydrv)
	clrf	(?_gre_displaydrv+1)
	fcall	_gre_displaydrv
	line	536
	
l8619:	
;led.c: 536: RB5=1;
	bsf	(53/8),(53)&7
	line	537
	
l8621:	
;led.c: 537: for(k=0;k<12;k++);
	clrf	(gre_displaying_end@k)
	
l8627:	
	incf	(gre_displaying_end@k),f
	
l8629:	
	movlw	(0Ch)
	subwf	(gre_displaying_end@k),w
	skipc
	goto	u6181
	goto	u6180
u6181:
	goto	l8627
u6180:
	
l1246:	
	line	538
;led.c: 538: RB5=0;
	bcf	(53/8),(53)&7
	line	539
	
l1247:	
	return
	opt stack 0
GLOBAL	__end_of_gre_displaying_end
	__end_of_gre_displaying_end:
;; =============== function _gre_displaying_end ends ============

	signat	_gre_displaying_end,88
	global	_gre_displaying
psect	text1025,local,class=CODE,delta=2
global __ptext1025
__ptext1025:

;; *************** function _gre_displaying *****************
;; Defined at:
;;		line 510 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;  number          2    4[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  temp_gre_var    1    8[BANK0 ] unsigned char 
;;  temp_gre_var    1    7[BANK0 ] unsigned char 
;;  temp_gre_var    1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lbdiv
;;		___lbmod
;;		_gre_displaydrv
;; This function is called by:
;;		_syn_wink_manage
;;		_usart_data_analyse
;; This function uses a non-reentrant model
;;
psect	text1025
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	510
	global	__size_of_gre_displaying
	__size_of_gre_displaying	equ	__end_of_gre_displaying-_gre_displaying
	
_gre_displaying:	
	opt	stack 4
; Regs used in _gre_displaying: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	515
	
l8585:	
;led.c: 511: unsigned char temp_gre_var0;
;led.c: 512: unsigned char temp_gre_var1;
;led.c: 513: unsigned char temp_gre_var2;
;led.c: 515: if(number > 99) temp_gre_var2 = 99;
	movlw	high(064h)
	subwf	(gre_displaying@number+1),w
	movlw	low(064h)
	skipnz
	subwf	(gre_displaying@number),w
	skipc
	goto	u6161
	goto	u6160
u6161:
	goto	l8589
u6160:
	
l8587:	
	movlw	(063h)
	movwf	(gre_displaying@temp_gre_var2)
	goto	l8591
	line	516
	
l8589:	
;led.c: 516: else temp_gre_var2 = number;
	movf	(gre_displaying@number),w
	movwf	(gre_displaying@temp_gre_var2)
	line	518
	
l8591:	
;led.c: 518: temp_gre_var0 = temp_gre_var2/10;
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(gre_displaying@temp_gre_var2),w
	fcall	___lbdiv
	movwf	(gre_displaying@temp_gre_var0)
	line	521
	
l8599:	
;led.c: 521: temp_gre_var1 = temp_gre_var2%10;
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(gre_displaying@temp_gre_var2),w
	fcall	___lbmod
	movwf	(gre_displaying@temp_gre_var1)
	line	523
	
l8601:	
;led.c: 523: gre_displaydrv(GREWORDS[temp_gre_var0]);
	clrc
	rlf	(gre_displaying@temp_gre_var0),w
	addlw	low((_GREWORDS-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_gre_displaydrv)
	fcall	stringdir
	movwf	(?_gre_displaydrv+1)
	fcall	_gre_displaydrv
	line	524
	
l8603:	
;led.c: 524: gre_displaydrv(GREWORDS[temp_gre_var1]);
	clrc
	rlf	(gre_displaying@temp_gre_var1),w
	addlw	low((_GREWORDS-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_gre_displaydrv)
	fcall	stringdir
	movwf	(?_gre_displaydrv+1)
	fcall	_gre_displaydrv
	line	526
	
l8605:	
;led.c: 526: RB5=1;
	bsf	(53/8),(53)&7
	line	527
	
l8607:	
;led.c: 527: for(temp_gre_var2=0;temp_gre_var2<12;temp_gre_var2++);
	clrf	(gre_displaying@temp_gre_var2)
	
l8613:	
	incf	(gre_displaying@temp_gre_var2),f
	
l8615:	
	movlw	(0Ch)
	subwf	(gre_displaying@temp_gre_var2),w
	skipc
	goto	u6171
	goto	u6170
u6171:
	goto	l8613
u6170:
	
l1241:	
	line	528
;led.c: 528: RB5=0;
	bcf	(53/8),(53)&7
	line	529
	
l1242:	
	return
	opt stack 0
GLOBAL	__end_of_gre_displaying
	__end_of_gre_displaying:
;; =============== function _gre_displaying ends ============

	signat	_gre_displaying,4216
	global	_yel_displaying_end
psect	text1026,local,class=CODE,delta=2
global __ptext1026
__ptext1026:

;; *************** function _yel_displaying_end *****************
;; Defined at:
;;		line 500 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_yel_displaydrv
;; This function is called by:
;;		_down_time_display
;;		_study_mode_time_calculation
;;		_usart_data_analyse
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1026
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	500
	global	__size_of_yel_displaying_end
	__size_of_yel_displaying_end	equ	__end_of_yel_displaying_end-_yel_displaying_end
	
_yel_displaying_end:	
	opt	stack 4
; Regs used in _yel_displaying_end: [wreg+status,2+status,0+pclath+cstack]
	line	502
	
l8571:	
;led.c: 501: unsigned char k;
;led.c: 502: yel_displaydrv(0x0000);
	clrf	(?_yel_displaydrv)
	clrf	(?_yel_displaydrv+1)
	fcall	_yel_displaydrv
	line	503
;led.c: 503: yel_displaydrv(0x0000);
	clrf	(?_yel_displaydrv)
	clrf	(?_yel_displaydrv+1)
	fcall	_yel_displaydrv
	line	504
	
l8573:	
;led.c: 504: RB5=1;
	bsf	(53/8),(53)&7
	line	505
	
l8575:	
;led.c: 505: for(k=0;k<12;k++);
	clrf	(yel_displaying_end@k)
	
l8581:	
	incf	(yel_displaying_end@k),f
	
l8583:	
	movlw	(0Ch)
	subwf	(yel_displaying_end@k),w
	skipc
	goto	u6151
	goto	u6150
u6151:
	goto	l8581
u6150:
	
l1233:	
	line	506
;led.c: 506: RB5=0;
	bcf	(53/8),(53)&7
	line	507
	
l1234:	
	return
	opt stack 0
GLOBAL	__end_of_yel_displaying_end
	__end_of_yel_displaying_end:
;; =============== function _yel_displaying_end ends ============

	signat	_yel_displaying_end,88
	global	_yel_displaying
psect	text1027,local,class=CODE,delta=2
global __ptext1027
__ptext1027:

;; *************** function _yel_displaying *****************
;; Defined at:
;;		line 479 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;  number          2    4[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  temp_yel_var    1    8[BANK0 ] unsigned char 
;;  temp_yel_var    1    7[BANK0 ] unsigned char 
;;  temp_yel_var    1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lbdiv
;;		___lbmod
;;		_yel_displaydrv
;; This function is called by:
;;		_syn_wink_manage
;;		_usart_data_analyse
;; This function uses a non-reentrant model
;;
psect	text1027
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	479
	global	__size_of_yel_displaying
	__size_of_yel_displaying	equ	__end_of_yel_displaying-_yel_displaying
	
_yel_displaying:	
	opt	stack 4
; Regs used in _yel_displaying: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	484
	
l8539:	
;led.c: 480: unsigned char temp_yel_var0;
;led.c: 481: unsigned char temp_yel_var1;
;led.c: 482: unsigned char temp_yel_var2;
;led.c: 484: if(number > 99) temp_yel_var2 = 99;
	movlw	high(064h)
	subwf	(yel_displaying@number+1),w
	movlw	low(064h)
	skipnz
	subwf	(yel_displaying@number),w
	skipc
	goto	u6131
	goto	u6130
u6131:
	goto	l8543
u6130:
	
l8541:	
	movlw	(063h)
	movwf	(yel_displaying@temp_yel_var2)
	goto	l8545
	line	485
	
l8543:	
;led.c: 485: else temp_yel_var2 = number;
	movf	(yel_displaying@number),w
	movwf	(yel_displaying@temp_yel_var2)
	line	487
	
l8545:	
;led.c: 487: temp_yel_var0 = temp_yel_var2/10;
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(yel_displaying@temp_yel_var2),w
	fcall	___lbdiv
	movwf	(yel_displaying@temp_yel_var0)
	line	490
	
l8553:	
;led.c: 490: temp_yel_var1 = temp_yel_var2%10;
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(yel_displaying@temp_yel_var2),w
	fcall	___lbmod
	movwf	(yel_displaying@temp_yel_var1)
	line	492
	
l8555:	
;led.c: 492: yel_displaydrv(YELWORDS[temp_yel_var0]);
	clrc
	rlf	(yel_displaying@temp_yel_var0),w
	addlw	low((_YELWORDS-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_yel_displaydrv)
	fcall	stringdir
	movwf	(?_yel_displaydrv+1)
	fcall	_yel_displaydrv
	line	493
	
l8557:	
;led.c: 493: yel_displaydrv(YELWORDS[temp_yel_var1]);
	clrc
	rlf	(yel_displaying@temp_yel_var1),w
	addlw	low((_YELWORDS-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_yel_displaydrv)
	fcall	stringdir
	movwf	(?_yel_displaydrv+1)
	fcall	_yel_displaydrv
	line	494
	
l8559:	
;led.c: 494: RB5=1;
	bsf	(53/8),(53)&7
	line	495
	
l8561:	
;led.c: 495: for(temp_yel_var2=0;temp_yel_var2<12;temp_yel_var2++);
	clrf	(yel_displaying@temp_yel_var2)
	
l8567:	
	incf	(yel_displaying@temp_yel_var2),f
	
l8569:	
	movlw	(0Ch)
	subwf	(yel_displaying@temp_yel_var2),w
	skipc
	goto	u6141
	goto	u6140
u6141:
	goto	l8567
u6140:
	
l1228:	
	line	496
;led.c: 496: RB5=0;
	bcf	(53/8),(53)&7
	line	497
	
l1229:	
	return
	opt stack 0
GLOBAL	__end_of_yel_displaying
	__end_of_yel_displaying:
;; =============== function _yel_displaying ends ============

	signat	_yel_displaying,4216
	global	_red_displaying_end
psect	text1028,local,class=CODE,delta=2
global __ptext1028
__ptext1028:

;; *************** function _red_displaying_end *****************
;; Defined at:
;;		line 469 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_red_displaydrv
;; This function is called by:
;;		_syn_wink_manage
;;		_down_time_display
;;		_study_mode_time_calculation
;;		_usart_data_analyse
;;		_communication_err
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1028
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	469
	global	__size_of_red_displaying_end
	__size_of_red_displaying_end	equ	__end_of_red_displaying_end-_red_displaying_end
	
_red_displaying_end:	
	opt	stack 4
; Regs used in _red_displaying_end: [wreg+status,2+status,0+pclath+cstack]
	line	471
	
l8525:	
;led.c: 470: unsigned char k;
;led.c: 471: red_displaydrv(0x0000);
	clrf	(?_red_displaydrv)
	clrf	(?_red_displaydrv+1)
	fcall	_red_displaydrv
	line	472
;led.c: 472: red_displaydrv(0x0000);
	clrf	(?_red_displaydrv)
	clrf	(?_red_displaydrv+1)
	fcall	_red_displaydrv
	line	473
	
l8527:	
;led.c: 473: RB5=1;
	bsf	(53/8),(53)&7
	line	474
	
l8529:	
;led.c: 474: for(k=0;k<12;k++);
	clrf	(red_displaying_end@k)
	
l8535:	
	incf	(red_displaying_end@k),f
	
l8537:	
	movlw	(0Ch)
	subwf	(red_displaying_end@k),w
	skipc
	goto	u6121
	goto	u6120
u6121:
	goto	l8535
u6120:
	
l1220:	
	line	475
;led.c: 475: RB5=0;
	bcf	(53/8),(53)&7
	line	476
	
l1221:	
	return
	opt stack 0
GLOBAL	__end_of_red_displaying_end
	__end_of_red_displaying_end:
;; =============== function _red_displaying_end ends ============

	signat	_red_displaying_end,88
	global	_red_displaying
psect	text1029,local,class=CODE,delta=2
global __ptext1029
__ptext1029:

;; *************** function _red_displaying *****************
;; Defined at:
;;		line 447 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;  number          2    4[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  temp_red_var    1    8[BANK0 ] unsigned char 
;;  temp_red_var    1    7[BANK0 ] unsigned char 
;;  temp_red_var    1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lbdiv
;;		___lbmod
;;		_red_displaydrv
;; This function is called by:
;;		_syn_wink_manage
;;		_usart_data_analyse
;; This function uses a non-reentrant model
;;
psect	text1029
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	447
	global	__size_of_red_displaying
	__size_of_red_displaying	equ	__end_of_red_displaying-_red_displaying
	
_red_displaying:	
	opt	stack 4
; Regs used in _red_displaying: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	452
	
l8493:	
;led.c: 448: unsigned char temp_red_var0;
;led.c: 449: unsigned char temp_red_var1;
;led.c: 450: unsigned char temp_red_var2;
;led.c: 452: if(number > 99) temp_red_var2 = 99;
	movlw	high(064h)
	subwf	(red_displaying@number+1),w
	movlw	low(064h)
	skipnz
	subwf	(red_displaying@number),w
	skipc
	goto	u6101
	goto	u6100
u6101:
	goto	l8497
u6100:
	
l8495:	
	movlw	(063h)
	movwf	(red_displaying@temp_red_var2)
	goto	l8499
	line	453
	
l8497:	
;led.c: 453: else temp_red_var2 = number;
	movf	(red_displaying@number),w
	movwf	(red_displaying@temp_red_var2)
	line	455
	
l8499:	
;led.c: 455: temp_red_var0 = temp_red_var2/10;
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(red_displaying@temp_red_var2),w
	fcall	___lbdiv
	movwf	(red_displaying@temp_red_var0)
	line	458
	
l8507:	
;led.c: 458: temp_red_var1 = temp_red_var2%10;
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(red_displaying@temp_red_var2),w
	fcall	___lbmod
	movwf	(red_displaying@temp_red_var1)
	line	460
	
l8509:	
;led.c: 460: red_displaydrv(REDWORDS[temp_red_var0]);
	clrc
	rlf	(red_displaying@temp_red_var0),w
	addlw	low((_REDWORDS-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_red_displaydrv)
	fcall	stringdir
	movwf	(?_red_displaydrv+1)
	fcall	_red_displaydrv
	line	461
	
l8511:	
;led.c: 461: red_displaydrv(REDWORDS[temp_red_var1]);
	clrc
	rlf	(red_displaying@temp_red_var1),w
	addlw	low((_REDWORDS-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?_red_displaydrv)
	fcall	stringdir
	movwf	(?_red_displaydrv+1)
	fcall	_red_displaydrv
	line	463
	
l8513:	
;led.c: 463: RB5=1;
	bsf	(53/8),(53)&7
	line	464
	
l8515:	
;led.c: 464: for(temp_red_var2=0;temp_red_var2<12;temp_red_var2++);
	clrf	(red_displaying@temp_red_var2)
	
l8521:	
	incf	(red_displaying@temp_red_var2),f
	
l8523:	
	movlw	(0Ch)
	subwf	(red_displaying@temp_red_var2),w
	skipc
	goto	u6111
	goto	u6110
u6111:
	goto	l8521
u6110:
	
l1215:	
	line	465
;led.c: 465: RB5=0;
	bcf	(53/8),(53)&7
	line	466
	
l1216:	
	return
	opt stack 0
GLOBAL	__end_of_red_displaying
	__end_of_red_displaying:
;; =============== function _red_displaying ends ============

	signat	_red_displaying,4216
	global	_addr_read
psect	text1030,local,class=CODE,delta=2
global __ptext1030
__ptext1030:

;; *************** function _addr_read *****************
;; Defined at:
;;		line 321 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 160/20
;;		On exit  : 60/40
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_usart_data_analyse
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1030
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	321
	global	__size_of_addr_read
	__size_of_addr_read	equ	__end_of_addr_read-_addr_read
	
_addr_read:	
	opt	stack 5
; Regs used in _addr_read: [wreg]
	line	322
	
l8483:	
;led.c: 322: EEADR = 0x10;
	movlw	(010h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	323
	
l8485:	
;led.c: 323: EEPGD = 0;
	bsf	status, 5	;RP0=1, select bank3
	bcf	(3175/8)^0180h,(3175)&7
	line	324
	
l8487:	
;led.c: 324: RD = 1;
	bsf	(3168/8)^0180h,(3168)&7
	line	325
	
l8489:	
;led.c: 325: _nop();
	nop
	line	326
;led.c: 326: return EEDATA;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(268)^0100h,w	;volatile
	line	327
	
l1163:	
	return
	opt stack 0
GLOBAL	__end_of_addr_read
	__end_of_addr_read:
;; =============== function _addr_read ends ============

	signat	_addr_read,89
	global	___lbmod
psect	text1031,local,class=CODE,delta=2
global __ptext1031
__ptext1031:

;; *************** function ___lbmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lbmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    5[COMMON] unsigned char 
;;  rem             1    7[COMMON] unsigned char 
;;  counter         1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         1       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_red_displaying
;;		_yel_displaying
;;		_gre_displaying
;; This function uses a non-reentrant model
;;
psect	text1031
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lbmod.c"
	line	5
	global	__size_of___lbmod
	__size_of___lbmod	equ	__end_of___lbmod-___lbmod
	
___lbmod:	
	opt	stack 4
; Regs used in ___lbmod: [wreg+status,2+status,0]
;___lbmod@dividend stored from wreg
	line	9
	movwf	(___lbmod@dividend)
	
l8465:	
	movlw	(08h)
	movwf	(___lbmod@counter)
	line	10
	
l8467:	
	clrf	(___lbmod@rem)
	line	12
	
l8469:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u6075:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u6075
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l8471:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l8473:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u6081
	goto	u6080
u6081:
	goto	l8477
u6080:
	line	15
	
l8475:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l8477:	
	decfsz	(___lbmod@counter),f
	goto	u6091
	goto	u6090
u6091:
	goto	l8469
u6090:
	line	17
	
l8479:	
	movf	(___lbmod@rem),w
	line	18
	
l2584:	
	return
	opt stack 0
GLOBAL	__end_of___lbmod
	__end_of___lbmod:
;; =============== function ___lbmod ends ============

	signat	___lbmod,8313
	global	___lbdiv
psect	text1032,local,class=CODE,delta=2
global __ptext1032
__ptext1032:

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    4[COMMON] unsigned char 
;;  quotient        1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         1       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_red_displaying
;;		_yel_displaying
;;		_gre_displaying
;; This function uses a non-reentrant model
;;
psect	text1032
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lbdiv.c"
	line	5
	global	__size_of___lbdiv
	__size_of___lbdiv	equ	__end_of___lbdiv-___lbdiv
	
___lbdiv:	
	opt	stack 4
; Regs used in ___lbdiv: [wreg+status,2+status,0]
;___lbdiv@dividend stored from wreg
	line	9
	movwf	(___lbdiv@dividend)
	
l8441:	
	clrf	(___lbdiv@quotient)
	line	10
	
l8443:	
	movf	(___lbdiv@divisor),w
	skipz
	goto	u6030
	goto	l8461
u6030:
	line	11
	
l8445:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l8449
	
l2573:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l8447:	
	incf	(___lbdiv@counter),f
	line	12
	
l8449:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u6041
	goto	u6040
u6041:
	goto	l2573
u6040:
	line	16
	
l2575:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l8451:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u6051
	goto	u6050
u6051:
	goto	l8457
u6050:
	line	19
	
l8453:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l8455:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l8457:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l8459:	
	decfsz	(___lbdiv@counter),f
	goto	u6061
	goto	u6060
u6061:
	goto	l2575
u6060:
	line	25
	
l8461:	
	movf	(___lbdiv@quotient),w
	line	26
	
l2578:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
;; =============== function ___lbdiv ends ============

	signat	___lbdiv,8313
	global	___lwdiv
psect	text1033,local,class=CODE,delta=2
global __ptext1033
__ptext1033:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    3[COMMON] unsigned int 
;;  dividend        2    5[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    1[BANK0 ] unsigned int 
;;  counter         1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    3[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       0       0       0
;;      Totals:         4       3       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_seek_down_pulse
;;		_study_mode_time_calculation
;; This function uses a non-reentrant model
;;
psect	text1033
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 5
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l8415:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l8417:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u5991
	goto	u5990
u5991:
	goto	l8437
u5990:
	line	11
	
l8419:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	12
	goto	l8423
	line	13
	
l8421:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	14
	incf	(___lwdiv@counter),f
	line	12
	
l8423:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u6001
	goto	u6000
u6001:
	goto	l8421
u6000:
	line	17
	
l8425:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	18
	
l8427:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u6015
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u6015:
	skipc
	goto	u6011
	goto	u6010
u6011:
	goto	l8433
u6010:
	line	19
	
l8429:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l8431:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	22
	
l8433:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	23
	
l8435:	
	decfsz	(___lwdiv@counter),f
	goto	u6021
	goto	u6020
u6021:
	goto	l8425
u6020:
	line	25
	
l8437:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	26
	
l2558:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text1034,local,class=CODE,delta=2
global __ptext1034
__ptext1034:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    3[COMMON] unsigned int 
;;  multiplicand    2    5[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    0[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    3[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/20
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       0       0       0
;;      Totals:         4       2       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_usart_data_analyse
;; This function uses a non-reentrant model
;;
psect	text1034
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 5
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l8399:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	line	7
	
l8401:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u5971
	goto	u5970
u5971:
	goto	l8405
u5970:
	line	8
	
l8403:	
	movf	(___wmul@multiplicand),w
	bcf	status, 5	;RP0=0, select bank0
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	line	9
	
l8405:	
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	line	10
	
l8407:	
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	line	11
	
l8409:	
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u5981
	goto	u5980
u5981:
	goto	l8401
u5980:
	line	12
	
l8411:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(___wmul@product+1),w
	movwf	(?___wmul+1)
	movf	(___wmul@product),w
	movwf	(?___wmul)
	line	13
	
l2548:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_g_segment_afresh_analyse
psect	text1035,local,class=CODE,delta=2
global __ptext1035
__ptext1035:

;; *************** function _g_segment_afresh_analyse *****************
;; Defined at:
;;		line 1328 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp_data       1    0        unsigned char 
;;  i               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       6       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1035
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	1328
	global	__size_of_g_segment_afresh_analyse
	__size_of_g_segment_afresh_analyse	equ	__end_of_g_segment_afresh_analyse-_g_segment_afresh_analyse
	
_g_segment_afresh_analyse:	
	opt	stack 6
; Regs used in _g_segment_afresh_analyse: [wreg-fsr0h+status,2+status,0]
	line	1332
	
l8325:	
;led.c: 1329: unsigned char i;
;led.c: 1330: unsigned char temp_data;
;led.c: 1332: if(study_or_pulse_mode != 0)
	movf	(_study_or_pulse_mode),w
	skipz
	goto	u5840
	goto	l8363
u5840:
	line	1334
	
l8327:	
;led.c: 1333: {
;led.c: 1334: if(g_segment_afresh_state != pulse_study_time_flag)
	movf	(_g_segment_afresh_state),w
	xorwf	(_pulse_study_time_flag),w
	skipnz
	goto	u5851
	goto	u5850
u5851:
	goto	l8347
u5850:
	line	1336
	
l8329:	
;led.c: 1335: {
;led.c: 1336: g_segment_afresh_state = pulse_study_time_flag;
	movf	(_pulse_study_time_flag),w
	movwf	(_g_segment_afresh_state)
	line	1337
	
l8331:	
;led.c: 1337: g_segment_afresh_counter = 0;
	clrf	(_g_segment_afresh_counter)
	line	1338
	
l8333:	
;led.c: 1338: g_segment_afresh_number = 3;
	movlw	(03h)
	movwf	(_g_segment_afresh_number)
	line	1339
	
l8335:	
;led.c: 1339: if((pulse_down_time_valid_flag&g_segment_afresh_state) != 0)
	movf	(_pulse_down_time_valid_flag),w
	andwf	(_g_segment_afresh_state),w
	btfsc	status,2
	goto	u5861
	goto	u5860
u5861:
	goto	l8347
u5860:
	goto	l8345
	line	1344
	
l8339:	
;led.c: 1344: g_segment_afresh_number = 0;
	clrf	(_g_segment_afresh_number)
	line	1345
;led.c: 1345: break;
	goto	l8347
	line	1347
	
l8341:	
;led.c: 1347: g_segment_afresh_number = 2;
	movlw	(02h)
	movwf	(_g_segment_afresh_number)
	line	1348
;led.c: 1348: break;
	goto	l8347
	line	1341
	
l8345:	
	movf	(_g_segment_afresh_state),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte           18    10 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l8339
	xorlw	4^1	; case 4
	skipnz
	goto	l8341
	goto	l1498
	opt asmopt_on

	line	1352
	
l1498:	
	line	1354
	
l8347:	
;led.c: 1352: }
;led.c: 1353: }
;led.c: 1354: if(g_segment_afresh_number < 3)
	movlw	(03h)
	subwf	(_g_segment_afresh_number),w
	skipnc
	goto	u5871
	goto	u5870
u5871:
	goto	l1521
u5870:
	line	1356
	
l8349:	
;led.c: 1355: {
;led.c: 1356: g_segment_afresh_counter++;
	incf	(_g_segment_afresh_counter),f
	line	1357
	
l8351:	
;led.c: 1357: if(g_segment_afresh_counter >= 100)
	movlw	(064h)
	subwf	(_g_segment_afresh_counter),w
	skipc
	goto	u5881
	goto	u5880
u5881:
	goto	l1521
u5880:
	line	1359
	
l8353:	
;led.c: 1358: {
;led.c: 1359: g_segment_afresh_counter = 0;
	clrf	(_g_segment_afresh_counter)
	line	1360
	
l8355:	
;led.c: 1360: if(pulse_study_time_counter[g_segment_afresh_number] > pulse_down_times[g_segment_afresh_number])
	clrc
	rlf	(_g_segment_afresh_number),w
	addlw	_pulse_study_time_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+0)+0+1
	clrc
	rlf	(_g_segment_afresh_number),w
	addlw	_pulse_down_times&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+2)+0+1
	movf	1+(??_g_segment_afresh_analyse+0)+0,w
	subwf	1+(??_g_segment_afresh_analyse+2)+0,w
	skipz
	goto	u5895
	movf	0+(??_g_segment_afresh_analyse+0)+0,w
	subwf	0+(??_g_segment_afresh_analyse+2)+0,w
u5895:
	skipnc
	goto	u5891
	goto	u5890
u5891:
	goto	l1521
u5890:
	line	1362
	
l8357:	
;led.c: 1361: {
;led.c: 1362: if((pulse_study_time_counter[g_segment_afresh_number] - pulse_down_times[g_segment_afresh_number]) > 140)
	clrc
	rlf	(_g_segment_afresh_number),w
	addlw	_pulse_down_times&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+0)+0+1
	clrc
	rlf	(_g_segment_afresh_number),w
	addlw	_pulse_study_time_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+2)+0+1
	movf	0+(??_g_segment_afresh_analyse+0)+0,w
	subwf	0+(??_g_segment_afresh_analyse+2)+0,w
	movwf	(??_g_segment_afresh_analyse+4)+0
	movf	1+(??_g_segment_afresh_analyse+0)+0,w
	skipc
	incf	1+(??_g_segment_afresh_analyse+0)+0,w
	subwf	1+(??_g_segment_afresh_analyse+2)+0,w
	movwf	1+(??_g_segment_afresh_analyse+4)+0
	movlw	high(08Dh)
	subwf	1+(??_g_segment_afresh_analyse+4)+0,w
	movlw	low(08Dh)
	skipnz
	subwf	0+(??_g_segment_afresh_analyse+4)+0,w
	skipc
	goto	u5901
	goto	u5900
u5901:
	goto	l1504
u5900:
	line	1364
	
l8359:	
;led.c: 1363: {
;led.c: 1364: pulse_down_time_valid_flag = 0;
	clrf	(_pulse_down_time_valid_flag)
	line	1365
	
l8361:	
;led.c: 1365: g_segment_afresh_number = 3;
	movlw	(03h)
	movwf	(_g_segment_afresh_number)
	goto	l1521
	line	1369
	
l1504:	
	line	1370
;led.c: 1366: }
;led.c: 1367: }
;led.c: 1368: }
;led.c: 1369: }
;led.c: 1370: }
	goto	l1521
	line	1373
	
l8363:	
;led.c: 1371: else
;led.c: 1372: {
;led.c: 1373: if(g_segment_afresh_state != study_time_flag)
	movf	(_g_segment_afresh_state),w
	xorwf	(_study_time_flag),w
	skipnz
	goto	u5911
	goto	u5910
u5911:
	goto	l8383
u5910:
	line	1375
	
l8365:	
;led.c: 1374: {
;led.c: 1375: g_segment_afresh_state = study_time_flag;
	movf	(_study_time_flag),w
	movwf	(_g_segment_afresh_state)
	line	1376
	
l8367:	
;led.c: 1376: g_segment_afresh_counter = 0;
	clrf	(_g_segment_afresh_counter)
	line	1377
	
l8369:	
;led.c: 1377: g_segment_afresh_number = 3;
	movlw	(03h)
	movwf	(_g_segment_afresh_number)
	line	1378
	
l8371:	
;led.c: 1378: if((study_time_valid_flag&g_segment_afresh_state) != 0)
	movf	(_study_time_valid_flag),w
	andwf	(_g_segment_afresh_state),w
	btfsc	status,2
	goto	u5921
	goto	u5920
u5921:
	goto	l8383
u5920:
	goto	l8381
	line	1383
	
l8375:	
;led.c: 1383: g_segment_afresh_number = 0;
	clrf	(_g_segment_afresh_number)
	line	1384
;led.c: 1384: break;
	goto	l8383
	line	1385
;led.c: 1385: case 0x02:
	
l1514:	
	line	1386
;led.c: 1386: g_segment_afresh_number = 1;
	clrf	(_g_segment_afresh_number)
	incf	(_g_segment_afresh_number),f
	line	1387
;led.c: 1387: break;
	goto	l8383
	line	1389
	
l8377:	
;led.c: 1389: g_segment_afresh_number = 2;
	movlw	(02h)
	movwf	(_g_segment_afresh_number)
	line	1390
;led.c: 1390: break;
	goto	l8383
	line	1380
	
l8381:	
	movf	(_g_segment_afresh_state),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           18    10 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l8375
	xorlw	2^1	; case 2
	skipnz
	goto	l1514
	xorlw	4^2	; case 4
	skipnz
	goto	l8377
	goto	l1510
	opt asmopt_on

	line	1394
	
l1510:	
	line	1396
	
l8383:	
;led.c: 1394: }
;led.c: 1395: }
;led.c: 1396: if(g_segment_afresh_number < 3)
	movlw	(03h)
	subwf	(_g_segment_afresh_number),w
	skipnc
	goto	u5931
	goto	u5930
u5931:
	goto	l1521
u5930:
	line	1398
	
l8385:	
;led.c: 1397: {
;led.c: 1398: g_segment_afresh_counter++;
	incf	(_g_segment_afresh_counter),f
	line	1399
	
l8387:	
;led.c: 1399: if(g_segment_afresh_counter >= 100)
	movlw	(064h)
	subwf	(_g_segment_afresh_counter),w
	skipc
	goto	u5941
	goto	u5940
u5941:
	goto	l1521
u5940:
	line	1401
	
l8389:	
;led.c: 1400: {
;led.c: 1401: g_segment_afresh_counter = 0;
	clrf	(_g_segment_afresh_counter)
	line	1402
	
l8391:	
;led.c: 1402: if(current_study_counter[g_segment_afresh_number] > previous_study_counter[g_segment_afresh_number])
	clrc
	rlf	(_g_segment_afresh_number),w
	addlw	_current_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+0)+0+1
	clrc
	rlf	(_g_segment_afresh_number),w
	addlw	_previous_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+2)+0+1
	movf	1+(??_g_segment_afresh_analyse+0)+0,w
	subwf	1+(??_g_segment_afresh_analyse+2)+0,w
	skipz
	goto	u5955
	movf	0+(??_g_segment_afresh_analyse+0)+0,w
	subwf	0+(??_g_segment_afresh_analyse+2)+0,w
u5955:
	skipnc
	goto	u5951
	goto	u5950
u5951:
	goto	l1521
u5950:
	line	1404
	
l8393:	
;led.c: 1403: {
;led.c: 1404: if((current_study_counter[g_segment_afresh_number] - previous_study_counter[g_segment_afresh_number]) > 140)
	clrc
	rlf	(_g_segment_afresh_number),w
	addlw	_previous_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+0)+0+1
	clrc
	rlf	(_g_segment_afresh_number),w
	addlw	_current_study_counter&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_g_segment_afresh_analyse+2)+0+1
	movf	0+(??_g_segment_afresh_analyse+0)+0,w
	subwf	0+(??_g_segment_afresh_analyse+2)+0,w
	movwf	(??_g_segment_afresh_analyse+4)+0
	movf	1+(??_g_segment_afresh_analyse+0)+0,w
	skipc
	incf	1+(??_g_segment_afresh_analyse+0)+0,w
	subwf	1+(??_g_segment_afresh_analyse+2)+0,w
	movwf	1+(??_g_segment_afresh_analyse+4)+0
	movlw	high(08Dh)
	subwf	1+(??_g_segment_afresh_analyse+4)+0,w
	movlw	low(08Dh)
	skipnz
	subwf	0+(??_g_segment_afresh_analyse+4)+0,w
	skipc
	goto	u5961
	goto	u5960
u5961:
	goto	l1504
u5960:
	line	1406
	
l8395:	
;led.c: 1405: {
;led.c: 1406: study_time_valid_flag = 0;
	clrf	(_study_time_valid_flag)
	goto	l8361
	line	1413
	
l1521:	
	return
	opt stack 0
GLOBAL	__end_of_g_segment_afresh_analyse
	__end_of_g_segment_afresh_analyse:
;; =============== function _g_segment_afresh_analyse ends ============

	signat	_g_segment_afresh_analyse,88
	global	_lamp_err_state_check
psect	text1036,local,class=CODE,delta=2
global __ptext1036
__ptext1036:

;; *************** function _lamp_err_state_check *****************
;; Defined at:
;;		line 1220 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1036
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	1220
	global	__size_of_lamp_err_state_check
	__size_of_lamp_err_state_check	equ	__end_of_lamp_err_state_check-_lamp_err_state_check
	
_lamp_err_state_check:	
	opt	stack 6
; Regs used in _lamp_err_state_check: [wreg-fsr0h+status,2+status,0]
	line	1221
	
l8297:	
;led.c: 1221: if((study_lamp_stab_state & 0x01)==0) restart_flag = 0x55;
	btfsc	(_study_lamp_stab_state),(0)&7
	goto	u5801
	goto	u5800
u5801:
	goto	l8301
u5800:
	
l8299:	
	movlw	(055h)
	movwf	(_restart_flag)
	line	1223
	
l8301:	
;led.c: 1223: if((study_lamp_stab_state&0x07)==0x07)
	movf	(_study_lamp_stab_state),w
	andlw	07h
	xorlw	07h
	skipz
	goto	u5811
	goto	u5810
u5811:
	goto	l8309
u5810:
	line	1225
	
l8303:	
;led.c: 1224: {
;led.c: 1225: no_lamp_on_counter++;
	incf	(_no_lamp_on_counter),f
	line	1226
	
l8305:	
;led.c: 1226: if(no_lamp_on_counter >= 50)
	movlw	(032h)
	subwf	(_no_lamp_on_counter),w
	skipc
	goto	u5821
	goto	u5820
u5821:
	goto	l8321
u5820:
	line	1228
	
l8307:	
;led.c: 1227: {
;led.c: 1228: no_lamp_on_counter = 0;
	clrf	(_no_lamp_on_counter)
	line	1229
;led.c: 1229: study_time_valid_flag = 0;
	clrf	(_study_time_valid_flag)
	line	1230
;led.c: 1230: previous_study_counter[0] = 0;
	clrf	(_previous_study_counter)
	clrf	(_previous_study_counter+1)
	line	1231
;led.c: 1231: previous_study_counter[1] = 0;
	clrf	0+(_previous_study_counter)+02h
	clrf	1+(_previous_study_counter)+02h
	line	1232
;led.c: 1232: previous_study_counter[2] = 0;
	clrf	0+(_previous_study_counter)+04h
	clrf	1+(_previous_study_counter)+04h
	line	1233
;led.c: 1233: lamp_counter_valid_flag = 0;
	clrf	(_lamp_counter_valid_flag)
	line	1234
;led.c: 1234: pulse_down_time_valid_flag = 0;
	clrf	(_pulse_down_time_valid_flag)
	goto	l8321
	line	1237
	
l8309:	
;led.c: 1237: else no_lamp_on_counter = 0;
	clrf	(_no_lamp_on_counter)
	goto	l8321
	line	1243
	
l1463:	
	line	1245
	
l8311:	
;led.c: 1242: case 1:
;led.c: 1243: case 2:
;led.c: 1244: case 4:
;led.c: 1245: sametime_on_counter++;
	incf	(_sametime_on_counter),f
	line	1246
	
l8313:	
;led.c: 1246: if(sametime_on_counter >= 50)
	movlw	(032h)
	subwf	(_sametime_on_counter),w
	skipc
	goto	u5831
	goto	u5830
u5831:
	goto	l1468
u5830:
	line	1248
	
l8315:	
;led.c: 1247: {
;led.c: 1248: sametime_on_counter = 0;
	clrf	(_sametime_on_counter)
	line	1249
;led.c: 1249: study_time_valid_flag = 0;
	clrf	(_study_time_valid_flag)
	line	1250
;led.c: 1250: lamp_counter_valid_flag = 0;
	clrf	(_lamp_counter_valid_flag)
	line	1251
;led.c: 1251: pulse_down_time_valid_flag = 0;
	clrf	(_pulse_down_time_valid_flag)
	goto	l1468
	line	1255
	
l8317:	
;led.c: 1255: sametime_on_counter = 0;
	clrf	(_sametime_on_counter)
	line	1256
;led.c: 1256: break;
	goto	l1468
	line	1239
	
l8321:	
	movf	(_study_lamp_stab_state),w
	andlw	07h
	movwf	(??_lamp_err_state_check+0)+0
	clrf	(??_lamp_err_state_check+0)+0+1
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte            9     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf 1+(??_lamp_err_state_check+0)+0,w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l9753
	goto	l8317
	opt asmopt_on
	
l9753:	
; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           17     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             9     6 (fixed)
; spacedrange           16     9 (fixed)
; locatedrange           5     3 (fixed)
;	Chosen strategy is simple_byte

	movf 0+(??_lamp_err_state_check+0)+0,w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l1463
	xorlw	1^0	; case 1
	skipnz
	goto	l8311
	xorlw	2^1	; case 2
	skipnz
	goto	l8311
	xorlw	4^2	; case 4
	skipnz
	goto	l8311
	goto	l8317
	opt asmopt_on

	line	1259
	
l1468:	
	return
	opt stack 0
GLOBAL	__end_of_lamp_err_state_check
	__end_of_lamp_err_state_check:
;; =============== function _lamp_err_state_check ends ============

	signat	_lamp_err_state_check,88
	global	_study_mode_filterAC_DC
psect	text1037,local,class=CODE,delta=2
global __ptext1037
__ptext1037:

;; *************** function _study_mode_filterAC_DC *****************
;; Defined at:
;;		line 952 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    6[COMMON] unsigned char 
;;  temp_var1       1    5[COMMON] unsigned char 
;;  temp_var3       1    4[COMMON] unsigned char 
;;  temp_var2       1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         4       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1037
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	952
	global	__size_of_study_mode_filterAC_DC
	__size_of_study_mode_filterAC_DC	equ	__end_of_study_mode_filterAC_DC-_study_mode_filterAC_DC
	
_study_mode_filterAC_DC:	
	opt	stack 6
; Regs used in _study_mode_filterAC_DC: [wreg-fsr0h+status,2+status,0]
	line	958
	
l8247:	
;led.c: 953: unsigned char i;
;led.c: 954: unsigned char temp_var1;
;led.c: 955: unsigned char temp_var2;
;led.c: 956: unsigned char temp_var3;
;led.c: 958: temp_var1 = 0x01;
	clrf	(study_mode_filterAC_DC@temp_var1)
	incf	(study_mode_filterAC_DC@temp_var1),f
	line	959
	
l8249:	
;led.c: 959: lamp_stab_state &= 0x07;
	movlw	(07h)
	andwf	(_lamp_stab_state),f
	line	960
;led.c: 960: temp_var2 = lamp_stab_state ^ study_lamp_stab_state;
	movf	(_lamp_stab_state),w
	xorwf	(_study_lamp_stab_state),w
	movwf	(study_mode_filterAC_DC@temp_var2)
	line	962
	
l8251:	
;led.c: 962: if(temp_var2 != 0)
	movf	(study_mode_filterAC_DC@temp_var2),w
	skipz
	goto	u5730
	goto	l8295
u5730:
	line	964
	
l8253:	
;led.c: 963: {
;led.c: 964: for(i=0;i<3;i++)
	clrf	(study_mode_filterAC_DC@i)
	line	966
	
l8259:	
;led.c: 965: {
;led.c: 966: if((temp_var2&temp_var1)==temp_var1)
	movf	(study_mode_filterAC_DC@temp_var2),w
	andwf	(study_mode_filterAC_DC@temp_var1),w
	xorwf	(study_mode_filterAC_DC@temp_var1),w
	skipz
	goto	u5741
	goto	u5740
u5741:
	goto	l8287
u5740:
	line	968
	
l8261:	
;led.c: 967: {
;led.c: 968: study_chge_counter[i]++;
	movf	(study_mode_filterAC_DC@i),w
	addlw	_study_chge_counter&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	incf	indf,f
	line	969
	
l8263:	
;led.c: 969: if((study_lamp_stab_state&temp_var1)==temp_var1)
	movf	(_study_lamp_stab_state),w
	andwf	(study_mode_filterAC_DC@temp_var1),w
	xorwf	(study_mode_filterAC_DC@temp_var1),w
	skipz
	goto	u5751
	goto	u5750
u5751:
	goto	l8271
u5750:
	line	971
	
l8265:	
;led.c: 970: {
;led.c: 971: if(study_chge_counter[i] >= 10)
	movf	(study_mode_filterAC_DC@i),w
	addlw	_study_chge_counter&0ffh
	movwf	fsr0
	movlw	(0Ah)
	subwf	indf,w
	skipc
	goto	u5761
	goto	u5760
u5761:
	goto	l8289
u5760:
	line	973
	
l8267:	
;led.c: 972: {
;led.c: 973: study_chge_counter[i] = 0;
	movf	(study_mode_filterAC_DC@i),w
	addlw	_study_chge_counter&0ffh
	movwf	fsr0
	clrf	indf
	line	974
	
l8269:	
;led.c: 974: study_lamp_stab_state ^= temp_var1;
	movf	(study_mode_filterAC_DC@temp_var1),w
	xorwf	(_study_lamp_stab_state),f
	goto	l8289
	line	979
	
l8271:	
;led.c: 977: else
;led.c: 978: {
;led.c: 979: temp_var3 = (~temp_var1)&0x07;
	comf	(study_mode_filterAC_DC@temp_var1),w
	movwf	(study_mode_filterAC_DC@temp_var3)
	
l8273:	
	movlw	(07h)
	andwf	(study_mode_filterAC_DC@temp_var3),f
	line	980
	
l8275:	
;led.c: 980: if((study_lamp_stab_state&temp_var3) == temp_var3)
	movf	(_study_lamp_stab_state),w
	andwf	(study_mode_filterAC_DC@temp_var3),w
	xorwf	(study_mode_filterAC_DC@temp_var3),w
	skipz
	goto	u5771
	goto	u5770
u5771:
	goto	l8267
u5770:
	line	982
	
l8277:	
;led.c: 981: {
;led.c: 982: if(study_chge_counter[i] >= 75)
	movf	(study_mode_filterAC_DC@i),w
	addlw	_study_chge_counter&0ffh
	movwf	fsr0
	movlw	(04Bh)
	subwf	indf,w
	skipc
	goto	u5781
	goto	u5780
u5781:
	goto	l1386
u5780:
	goto	l8267
	line	993
	
l1386:	
	line	994
;led.c: 992: }
;led.c: 993: }
;led.c: 994: }
	goto	l8289
	line	997
	
l8287:	
;led.c: 995: else
;led.c: 996: {
;led.c: 997: study_chge_counter[i] = 0;
	movf	(study_mode_filterAC_DC@i),w
	addlw	_study_chge_counter&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	line	999
	
l8289:	
;led.c: 998: }
;led.c: 999: temp_var1 <<= 1;
	clrc
	rlf	(study_mode_filterAC_DC@temp_var1),f
	line	964
	
l8291:	
	incf	(study_mode_filterAC_DC@i),f
	
l8293:	
	movlw	(03h)
	subwf	(study_mode_filterAC_DC@i),w
	skipc
	goto	u5791
	goto	u5790
u5791:
	goto	l8259
u5790:
	goto	l1392
	line	1004
	
l8295:	
;led.c: 1002: else
;led.c: 1003: {
;led.c: 1004: study_chge_counter[0] = 0;
	clrf	(_study_chge_counter)
	line	1005
;led.c: 1005: study_chge_counter[1] = 0;
	clrf	0+(_study_chge_counter)+01h
	line	1006
;led.c: 1006: study_chge_counter[2] = 0;
	clrf	0+(_study_chge_counter)+02h
	line	1008
	
l1392:	
	return
	opt stack 0
GLOBAL	__end_of_study_mode_filterAC_DC
	__end_of_study_mode_filterAC_DC:
;; =============== function _study_mode_filterAC_DC ends ============

	signat	_study_mode_filterAC_DC,88
	global	_filterAC_DC
psect	text1038,local,class=CODE,delta=2
global __ptext1038
__ptext1038:

;; *************** function _filterAC_DC *****************
;; Defined at:
;;		line 815 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    6[COMMON] unsigned char 
;;  temp_var2       1    5[COMMON] unsigned char 
;;  temp_var1       1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1038
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	815
	global	__size_of_filterAC_DC
	__size_of_filterAC_DC	equ	__end_of_filterAC_DC-_filterAC_DC
	
_filterAC_DC:	
	opt	stack 6
; Regs used in _filterAC_DC: [wreg-fsr0h+status,2+status,0]
	line	819
	
l8203:	
;led.c: 816: unsigned char i;
;led.c: 817: unsigned char temp_var1;
;led.c: 818: unsigned char temp_var2;
;led.c: 819: lamp_temp_state = ((PORTC>>2)&0x07);
	movf	(7),w	;volatile
	movwf	(??_filterAC_DC+0)+0
	clrc
	rrf	(??_filterAC_DC+0)+0,f
	clrc
	rrf	(??_filterAC_DC+0)+0,f
	movf	0+(??_filterAC_DC+0)+0,w
	movwf	(_lamp_temp_state)
	movlw	(07h)
	andwf	(_lamp_temp_state),f
	line	820
	
l8205:	
;led.c: 820: if(lamp_temp_state == 4)lamp_temp_state = 6;
	movf	(_lamp_temp_state),w
	xorlw	04h
	skipz
	goto	u5661
	goto	u5660
u5661:
	goto	l8209
u5660:
	
l8207:	
	movlw	(06h)
	movwf	(_lamp_temp_state)
	line	822
	
l8209:	
;led.c: 822: temp_var1 = lamp_temp_state ^ lamp_stab_state;
	movf	(_lamp_temp_state),w
	xorwf	(_lamp_stab_state),w
	movwf	(filterAC_DC@temp_var1)
	line	823
	
l8211:	
;led.c: 823: if(temp_var1!=0)
	movf	(filterAC_DC@temp_var1),w
	skipz
	goto	u5670
	goto	l8245
u5670:
	line	825
	
l8213:	
;led.c: 824: {
;led.c: 825: temp_var2 = 0x01;
	clrf	(filterAC_DC@temp_var2)
	incf	(filterAC_DC@temp_var2),f
	line	826
	
l8215:	
;led.c: 826: for(i=0;i<3;i++)
	clrf	(filterAC_DC@i)
	line	828
	
l8221:	
;led.c: 827: {
;led.c: 828: if((temp_var1 & temp_var2)==temp_var2)
	movf	(filterAC_DC@temp_var1),w
	andwf	(filterAC_DC@temp_var2),w
	xorwf	(filterAC_DC@temp_var2),w
	skipz
	goto	u5681
	goto	u5680
u5681:
	goto	l8229
u5680:
	line	830
	
l8223:	
;led.c: 829: {
;led.c: 830: if((lamp_stab_state & temp_var2)==temp_var2)
	movf	(_lamp_stab_state),w
	andwf	(filterAC_DC@temp_var2),w
	xorwf	(filterAC_DC@temp_var2),w
	skipz
	goto	u5691
	goto	u5690
u5691:
	goto	l8231
u5690:
	line	832
	
l8225:	
;led.c: 831: {
;led.c: 832: lamp_chge_counter[i]++;
	movf	(filterAC_DC@i),w
	addlw	_lamp_chge_counter&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	incf	indf,f
	line	833
;led.c: 833: if(lamp_chge_counter[i] >= 2)
	movf	(filterAC_DC@i),w
	addlw	_lamp_chge_counter&0ffh
	movwf	fsr0
	movlw	(02h)
	subwf	indf,w
	skipc
	goto	u5701
	goto	u5700
u5701:
	goto	l8239
u5700:
	line	835
	
l8227:	
;led.c: 834: {
;led.c: 835: lamp_stab_state ^= temp_var2;
	movf	(filterAC_DC@temp_var2),w
	xorwf	(_lamp_stab_state),f
	line	836
	
l8229:	
;led.c: 836: lamp_chge_counter[i] = 0;
	movf	(filterAC_DC@i),w
	addlw	_lamp_chge_counter&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l8239
	line	841
	
l8231:	
;led.c: 839: else
;led.c: 840: {
;led.c: 841: lamp_chge_counter[i]++;
	movf	(filterAC_DC@i),w
	addlw	_lamp_chge_counter&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	incf	indf,f
	line	842
;led.c: 842: if(lamp_chge_counter[i] >= 21)
	movf	(filterAC_DC@i),w
	addlw	_lamp_chge_counter&0ffh
	movwf	fsr0
	movlw	(015h)
	subwf	indf,w
	skipc
	goto	u5711
	goto	u5710
u5711:
	goto	l8239
u5710:
	goto	l8227
	line	853
	
l8239:	
;led.c: 852: }
;led.c: 853: temp_var2 <<= 1;
	clrc
	rlf	(filterAC_DC@temp_var2),f
	line	826
	
l8241:	
	incf	(filterAC_DC@i),f
	
l8243:	
	movlw	(03h)
	subwf	(filterAC_DC@i),w
	skipc
	goto	u5721
	goto	u5720
u5721:
	goto	l8221
u5720:
	goto	l1347
	line	858
	
l8245:	
;led.c: 856: else
;led.c: 857: {
;led.c: 858: lamp_chge_counter[0] = 0;
	clrf	(_lamp_chge_counter)
	line	859
;led.c: 859: lamp_chge_counter[1] = 0;
	clrf	0+(_lamp_chge_counter)+01h
	line	860
;led.c: 860: lamp_chge_counter[2] = 0;
	clrf	0+(_lamp_chge_counter)+02h
	line	862
	
l1347:	
	return
	opt stack 0
GLOBAL	__end_of_filterAC_DC
	__end_of_filterAC_DC:
;; =============== function _filterAC_DC ends ============

	signat	_filterAC_DC,88
	global	_gre_displaydrv
psect	text1039,local,class=CODE,delta=2
global __ptext1039
__ptext1039:

;; *************** function _gre_displaydrv *****************
;; Defined at:
;;		line 425 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;  drvword         2    3[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  tempdata        2    0[BANK0 ] unsigned int 
;;  k               1    3[BANK0 ] unsigned char 
;;  i               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         0       4       0       0
;;      Temps:          2       0       0       0
;;      Totals:         4       4       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_gre_displaying
;;		_gre_displaying_end
;;		_g_segment_displaying
;; This function uses a non-reentrant model
;;
psect	text1039
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	425
	global	__size_of_gre_displaydrv
	__size_of_gre_displaydrv	equ	__end_of_gre_displaydrv-_gre_displaydrv
	
_gre_displaydrv:	
	opt	stack 4
; Regs used in _gre_displaydrv: [wreg+status,2+status,0]
	line	429
	
l8159:	
;led.c: 426: unsigned int tempdata;
;led.c: 427: unsigned char i;
;led.c: 428: unsigned char k;
;led.c: 429: tempdata = 0x8000;
	movlw	low(08000h)
	movwf	(gre_displaydrv@tempdata)
	movlw	high(08000h)
	movwf	((gre_displaydrv@tempdata))+1
	line	430
	
l8161:	
;led.c: 430: RB0=0;
	bcf	(48/8),(48)&7
	line	431
	
l8163:	
;led.c: 431: RB1=0;
	bcf	(49/8),(49)&7
	line	432
	
l8165:	
;led.c: 432: RB5=0;
	bcf	(53/8),(53)&7
	line	433
	
l8167:	
;led.c: 433: RB3=0;
	bcf	(51/8),(51)&7
	line	434
	
l8169:	
;led.c: 434: for(i=0;i<16;i++)
	clrf	(gre_displaydrv@i)
	line	436
	
l8175:	
;led.c: 435: {
;led.c: 436: if((drvword & tempdata)==0) RB2=0;
	movf	(gre_displaydrv@tempdata),w
	andwf	(gre_displaydrv@drvword),w
	movwf	(??_gre_displaydrv+0)+0
	movf	(gre_displaydrv@tempdata+1),w
	andwf	(gre_displaydrv@drvword+1),w
	movwf	1+(??_gre_displaydrv+0)+0
	movf	1+(??_gre_displaydrv+0)+0,w
	iorwf	0+(??_gre_displaydrv+0)+0,w
	skipz
	goto	u5621
	goto	u5620
u5621:
	goto	l1202
u5620:
	
l8177:	
	bcf	(50/8),(50)&7
	goto	l8179
	line	437
	
l1202:	
;led.c: 437: else RB2=1;
	bsf	(50/8),(50)&7
	line	438
	
l8179:	
;led.c: 438: for(k=0;k<1;k++);
	clrf	(gre_displaydrv@k)
	
l8185:	
	incf	(gre_displaydrv@k),f
	
l8187:	
	movf	(gre_displaydrv@k),w
	skipz
	goto	u5630
	goto	l8185
u5630:
	
l1205:	
	line	439
;led.c: 439: RB3=1;
	bsf	(51/8),(51)&7
	line	440
	
l8189:	
;led.c: 440: for(k=0;k<5;k++);
	clrf	(gre_displaydrv@k)
	
l8195:	
	incf	(gre_displaydrv@k),f
	
l8197:	
	movlw	(05h)
	subwf	(gre_displaydrv@k),w
	skipc
	goto	u5641
	goto	u5640
u5641:
	goto	l8195
u5640:
	
l1207:	
	line	441
;led.c: 441: RB3=0;
	bcf	(51/8),(51)&7
	line	442
	
l8199:	
;led.c: 442: tempdata >>= 1;
	clrc
	rrf	(gre_displaydrv@tempdata+1),f
	rrf	(gre_displaydrv@tempdata),f
	line	434
	incf	(gre_displaydrv@i),f
	
l8201:	
	movlw	(010h)
	subwf	(gre_displaydrv@i),w
	skipc
	goto	u5651
	goto	u5650
u5651:
	goto	l8175
u5650:
	line	444
	
l1208:	
	return
	opt stack 0
GLOBAL	__end_of_gre_displaydrv
	__end_of_gre_displaydrv:
;; =============== function _gre_displaydrv ends ============

	signat	_gre_displaydrv,4216
	global	_yel_displaydrv
psect	text1040,local,class=CODE,delta=2
global __ptext1040
__ptext1040:

;; *************** function _yel_displaydrv *****************
;; Defined at:
;;		line 403 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;  drvword         2    3[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  tempdata        2    0[BANK0 ] unsigned int 
;;  k               1    3[BANK0 ] unsigned char 
;;  i               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         0       4       0       0
;;      Temps:          2       0       0       0
;;      Totals:         4       4       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_yel_displaying
;;		_yel_displaying_end
;;		_g_segment_displaying
;; This function uses a non-reentrant model
;;
psect	text1040
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	403
	global	__size_of_yel_displaydrv
	__size_of_yel_displaydrv	equ	__end_of_yel_displaydrv-_yel_displaydrv
	
_yel_displaydrv:	
	opt	stack 4
; Regs used in _yel_displaydrv: [wreg+status,2+status,0]
	line	407
	
l8115:	
;led.c: 404: unsigned int tempdata;
;led.c: 405: unsigned char i;
;led.c: 406: unsigned char k;
;led.c: 407: tempdata = 0x8000;
	movlw	low(08000h)
	movwf	(yel_displaydrv@tempdata)
	movlw	high(08000h)
	movwf	((yel_displaydrv@tempdata))+1
	line	408
	
l8117:	
;led.c: 408: RB0=0;
	bcf	(48/8),(48)&7
	line	409
	
l8119:	
;led.c: 409: RB2=0;
	bcf	(50/8),(50)&7
	line	410
	
l8121:	
;led.c: 410: RB5=0;
	bcf	(53/8),(53)&7
	line	411
	
l8123:	
;led.c: 411: RB3=0;
	bcf	(51/8),(51)&7
	line	412
	
l8125:	
;led.c: 412: for(i=0;i<16;i++)
	clrf	(yel_displaydrv@i)
	line	414
	
l8131:	
;led.c: 413: {
;led.c: 414: if((drvword & tempdata)==0) RB1=0;
	movf	(yel_displaydrv@tempdata),w
	andwf	(yel_displaydrv@drvword),w
	movwf	(??_yel_displaydrv+0)+0
	movf	(yel_displaydrv@tempdata+1),w
	andwf	(yel_displaydrv@drvword+1),w
	movwf	1+(??_yel_displaydrv+0)+0
	movf	1+(??_yel_displaydrv+0)+0,w
	iorwf	0+(??_yel_displaydrv+0)+0,w
	skipz
	goto	u5581
	goto	u5580
u5581:
	goto	l1191
u5580:
	
l8133:	
	bcf	(49/8),(49)&7
	goto	l8135
	line	415
	
l1191:	
;led.c: 415: else RB1=1;
	bsf	(49/8),(49)&7
	line	416
	
l8135:	
;led.c: 416: for(k=0;k<1;k++);
	clrf	(yel_displaydrv@k)
	
l8141:	
	incf	(yel_displaydrv@k),f
	
l8143:	
	movf	(yel_displaydrv@k),w
	skipz
	goto	u5590
	goto	l8141
u5590:
	
l1194:	
	line	417
;led.c: 417: RB3=1;
	bsf	(51/8),(51)&7
	line	418
	
l8145:	
;led.c: 418: for(k=0;k<5;k++);
	clrf	(yel_displaydrv@k)
	
l8151:	
	incf	(yel_displaydrv@k),f
	
l8153:	
	movlw	(05h)
	subwf	(yel_displaydrv@k),w
	skipc
	goto	u5601
	goto	u5600
u5601:
	goto	l8151
u5600:
	
l1196:	
	line	419
;led.c: 419: RB3=0;
	bcf	(51/8),(51)&7
	line	420
	
l8155:	
;led.c: 420: tempdata >>= 1;
	clrc
	rrf	(yel_displaydrv@tempdata+1),f
	rrf	(yel_displaydrv@tempdata),f
	line	412
	incf	(yel_displaydrv@i),f
	
l8157:	
	movlw	(010h)
	subwf	(yel_displaydrv@i),w
	skipc
	goto	u5611
	goto	u5610
u5611:
	goto	l8131
u5610:
	line	422
	
l1197:	
	return
	opt stack 0
GLOBAL	__end_of_yel_displaydrv
	__end_of_yel_displaydrv:
;; =============== function _yel_displaydrv ends ============

	signat	_yel_displaydrv,4216
	global	_red_displaydrv
psect	text1041,local,class=CODE,delta=2
global __ptext1041
__ptext1041:

;; *************** function _red_displaydrv *****************
;; Defined at:
;;		line 380 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;  drvword         2    3[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  tempdata        2    0[BANK0 ] unsigned int 
;;  k               1    3[BANK0 ] unsigned char 
;;  i               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         0       4       0       0
;;      Temps:          2       0       0       0
;;      Totals:         4       4       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_red_displaying
;;		_red_displaying_end
;;		_g_segment_displaying
;; This function uses a non-reentrant model
;;
psect	text1041
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	380
	global	__size_of_red_displaydrv
	__size_of_red_displaydrv	equ	__end_of_red_displaydrv-_red_displaydrv
	
_red_displaydrv:	
	opt	stack 4
; Regs used in _red_displaydrv: [wreg+status,2+status,0]
	line	384
	
l8071:	
;led.c: 381: unsigned int tempdata;
;led.c: 382: unsigned char i;
;led.c: 383: unsigned char k;
;led.c: 384: tempdata = 0x8000;
	movlw	low(08000h)
	movwf	(red_displaydrv@tempdata)
	movlw	high(08000h)
	movwf	((red_displaydrv@tempdata))+1
	line	385
	
l8073:	
;led.c: 385: RB1=0;
	bcf	(49/8),(49)&7
	line	386
	
l8075:	
;led.c: 386: RB2=0;
	bcf	(50/8),(50)&7
	line	387
	
l8077:	
;led.c: 387: RB5=0;
	bcf	(53/8),(53)&7
	line	388
	
l8079:	
;led.c: 388: RB3=0;
	bcf	(51/8),(51)&7
	line	390
	
l8081:	
;led.c: 390: for(i=0;i<16;i++)
	clrf	(red_displaydrv@i)
	line	392
	
l8087:	
;led.c: 391: {
;led.c: 392: if((drvword & tempdata)==0) RB0=0;
	movf	(red_displaydrv@tempdata),w
	andwf	(red_displaydrv@drvword),w
	movwf	(??_red_displaydrv+0)+0
	movf	(red_displaydrv@tempdata+1),w
	andwf	(red_displaydrv@drvword+1),w
	movwf	1+(??_red_displaydrv+0)+0
	movf	1+(??_red_displaydrv+0)+0,w
	iorwf	0+(??_red_displaydrv+0)+0,w
	skipz
	goto	u5541
	goto	u5540
u5541:
	goto	l1180
u5540:
	
l8089:	
	bcf	(48/8),(48)&7
	goto	l8091
	line	393
	
l1180:	
;led.c: 393: else RB0=1;
	bsf	(48/8),(48)&7
	line	394
	
l8091:	
;led.c: 394: for(k=0;k<1;k++);
	clrf	(red_displaydrv@k)
	
l8097:	
	incf	(red_displaydrv@k),f
	
l8099:	
	movf	(red_displaydrv@k),w
	skipz
	goto	u5550
	goto	l8097
u5550:
	
l1183:	
	line	395
;led.c: 395: RB3=1;
	bsf	(51/8),(51)&7
	line	396
	
l8101:	
;led.c: 396: for(k=0;k<5;k++);
	clrf	(red_displaydrv@k)
	
l8107:	
	incf	(red_displaydrv@k),f
	
l8109:	
	movlw	(05h)
	subwf	(red_displaydrv@k),w
	skipc
	goto	u5561
	goto	u5560
u5561:
	goto	l8107
u5560:
	
l1185:	
	line	397
;led.c: 397: RB3=0;
	bcf	(51/8),(51)&7
	line	398
	
l8111:	
;led.c: 398: tempdata >>= 1;
	clrc
	rrf	(red_displaydrv@tempdata+1),f
	rrf	(red_displaydrv@tempdata),f
	line	390
	incf	(red_displaydrv@i),f
	
l8113:	
	movlw	(010h)
	subwf	(red_displaydrv@i),w
	skipc
	goto	u5571
	goto	u5570
u5571:
	goto	l8087
u5570:
	line	400
	
l1186:	
	return
	opt stack 0
GLOBAL	__end_of_red_displaydrv
	__end_of_red_displaydrv:
;; =============== function _red_displaydrv ends ============

	signat	_red_displaydrv,4216
	global	_timer1init
psect	text1042,local,class=CODE,delta=2
global __ptext1042
__ptext1042:

;; *************** function _timer1init *****************
;; Defined at:
;;		line 368 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1042
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	368
	global	__size_of_timer1init
	__size_of_timer1init	equ	__end_of_timer1init-_timer1init
	
_timer1init:	
	opt	stack 6
; Regs used in _timer1init: [wreg+status,2]
	line	369
	
l8059:	
;led.c: 369: T1CON=0X21;
	movlw	(021h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(16)	;volatile
	line	370
	
l8061:	
;led.c: 370: TMR1IF=0;
	bcf	(96/8),(96)&7
	line	371
	
l8063:	
;led.c: 371: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	372
;led.c: 372: TMR1H=0xFB;
	movlw	(0FBh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(15)	;volatile
	line	373
;led.c: 373: TMR1L=0x85;
	movlw	(085h)
	movwf	(14)	;volatile
	line	374
	
l8065:	
;led.c: 374: PIR1=0;
	clrf	(12)	;volatile
	line	375
	
l8067:	
;led.c: 375: PEIE=1;
	bsf	(94/8),(94)&7
	line	376
	
l8069:	
;led.c: 376: GIE=1;
	bsf	(95/8),(95)&7
	line	377
	
l1175:	
	return
	opt stack 0
GLOBAL	__end_of_timer1init
	__end_of_timer1init:
;; =============== function _timer1init ends ============

	signat	_timer1init,88
	global	_usartinit
psect	text1043,local,class=CODE,delta=2
global __ptext1043
__ptext1043:

;; *************** function _usartinit *****************
;; Defined at:
;;		line 345 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1043
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	345
	global	__size_of_usartinit
	__size_of_usartinit	equ	__end_of_usartinit-_usartinit
	
_usartinit:	
	opt	stack 6
; Regs used in _usartinit: [wreg+status,2]
	line	346
	
l8031:	
;led.c: 346: SYNC = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	347
;led.c: 347: BRGH = 0;
	bcf	(1218/8)^080h,(1218)&7
	line	348
;led.c: 348: BRG16 = 1;
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3131/8)^0180h,(3131)&7
	line	349
	
l8033:	
;led.c: 349: SPBRGH=0X00;SPBRG=0X77;;
	bcf	status, 6	;RP1=0, select bank1
	clrf	(154)^080h	;volatile
	
l8035:	
	movlw	(077h)
	movwf	(153)^080h	;volatile
	line	350
	
l8037:	
;led.c: 350: SPEN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(199/8),(199)&7
	line	351
	
l8039:	
;led.c: 351: CREN = 1;
	bsf	(196/8),(196)&7
	line	352
	
l8041:	
;led.c: 352: TXIE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	353
	
l8043:	
;led.c: 353: TXEN = 1;
	bsf	(1221/8)^080h,(1221)&7
	line	354
	
l8045:	
;led.c: 354: RX9 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(198/8),(198)&7
	line	355
	
l8047:	
;led.c: 355: TX9 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1222/8)^080h,(1222)&7
	line	357
	
l8049:	
;led.c: 357: TRISC6=1;
	bsf	(1086/8)^080h,(1086)&7
	line	358
	
l8051:	
;led.c: 358: TRISC7=1;
	bsf	(1087/8)^080h,(1087)&7
	line	359
	
l8053:	
;led.c: 359: PEIE=1;
	bsf	(94/8),(94)&7
	line	360
	
l8055:	
;led.c: 360: GIE=1;
	bsf	(95/8),(95)&7
	line	361
	
l8057:	
;led.c: 361: RCIE = 1;
	bsf	(1125/8)^080h,(1125)&7
	line	362
	
l1172:	
	return
	opt stack 0
GLOBAL	__end_of_usartinit
	__end_of_usartinit:
;; =============== function _usartinit ends ============

	signat	_usartinit,88
	global	_addr_write
psect	text1044,local,class=CODE,delta=2
global __ptext1044
__ptext1044:

;; *************** function _addr_write *****************
;; Defined at:
;;		line 330 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;  indata          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  indata          1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 160/20
;;		On exit  : 160/60
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_usart_data_analyse
;; This function uses a non-reentrant model
;;
psect	text1044
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	330
	global	__size_of_addr_write
	__size_of_addr_write	equ	__end_of_addr_write-_addr_write
	
_addr_write:	
	opt	stack 5
; Regs used in _addr_write: [wreg]
;addr_write@indata stored from wreg
	movwf	(addr_write@indata)
	line	331
	
l8017:	
;led.c: 331: EEADR = 0x10;
	movlw	(010h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	332
;led.c: 332: EEDATA = indata;
	movf	(addr_write@indata),w
	movwf	(268)^0100h	;volatile
	line	333
	
l8019:	
;led.c: 333: EEPGD = 0;
	bsf	status, 5	;RP0=1, select bank3
	bcf	(3175/8)^0180h,(3175)&7
	line	334
	
l8021:	
;led.c: 334: WREN = 1;
	bsf	(3170/8)^0180h,(3170)&7
	line	335
	
l8023:	
;led.c: 335: GIE = 0;
	bcf	(95/8),(95)&7
	line	336
;led.c: 336: EECON2 = 0X55;
	movlw	(055h)
	movwf	(397)^0180h	;volatile
	line	337
;led.c: 337: EECON2 = 0XAA;
	movlw	(0AAh)
	movwf	(397)^0180h	;volatile
	line	338
	
l8025:	
;led.c: 338: WR = 1;
	bsf	(3169/8)^0180h,(3169)&7
	line	339
	
l8027:	
;led.c: 339: GIE = 1;
	bsf	(95/8),(95)&7
	line	340
	
l8029:	
;led.c: 340: WREN = 0;
	bcf	(3170/8)^0180h,(3170)&7
	line	341
;led.c: 341: while(WR);
	
l1166:	
	btfsc	(3169/8)^0180h,(3169)&7
	goto	u5531
	goto	u5530
u5531:
	goto	l1166
u5530:
	line	342
	
l1169:	
	return
	opt stack 0
GLOBAL	__end_of_addr_write
	__end_of_addr_write:
;; =============== function _addr_write ends ============

	signat	_addr_write,4216
	global	_ioinit
psect	text1045,local,class=CODE,delta=2
global __ptext1045
__ptext1045:

;; *************** function _ioinit *****************
;; Defined at:
;;		line 238 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 15F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1045
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	238
	global	__size_of_ioinit
	__size_of_ioinit	equ	__end_of_ioinit-_ioinit
	
_ioinit:	
	opt	stack 6
; Regs used in _ioinit: [wreg-fsr0h+status,2+status,0]
	line	240
	
l7921:	
;led.c: 239: unsigned char i;
;led.c: 240: OSCCON=0X08;
	movlw	(08h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	241
	
l7923:	
;led.c: 241: ANSEL=0X00;
	bsf	status, 6	;RP1=1, select bank3
	clrf	(392)^0180h	;volatile
	line	242
	
l7925:	
;led.c: 242: ANSELH=0X00;
	clrf	(393)^0180h	;volatile
	line	243
	
l7927:	
;led.c: 243: nRBPU = 1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1039/8)^080h,(1039)&7
	line	244
	
l7929:	
;led.c: 244: PORTB=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(6)	;volatile
	line	245
	
l7931:	
;led.c: 245: TRISB=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(134)^080h	;volatile
	line	246
;led.c: 246: TRISC=0B00011100;
	movlw	(01Ch)
	movwf	(135)^080h	;volatile
	line	248
	
l7933:	
;led.c: 248: TFG = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_TFG)
	line	249
	
l7935:	
;led.c: 249: wdtcounter = 0;
	clrf	(_wdtcounter)
	line	250
	
l7937:	
;led.c: 250: ledstate = 0;
	clrf	(_ledstate)
	line	252
	
l7939:	
;led.c: 252: lamp_stab_state = 0x07;
	movlw	(07h)
	movwf	(_lamp_stab_state)
	line	253
;led.c: 253: lamp_on_flag = 0;
	clrf	(_lamp_on_flag)
	line	254
;led.c: 254: lamp_off_flag = 0;
	clrf	(_lamp_off_flag)
	line	255
;led.c: 255: pulse_study_time_flag = 0;
	clrf	(_pulse_study_time_flag)
	line	256
;led.c: 256: pulse_down_time_valid_flag = 0;
	clrf	(_pulse_down_time_valid_flag)
	line	258
;led.c: 258: for(i=0;i<3;i++)
	clrf	(ioinit@i)
	line	260
	
l7945:	
;led.c: 259: {
;led.c: 260: lamp_chge_counter[i]=0;
	movf	(ioinit@i),w
	addlw	_lamp_chge_counter&0ffh
	movwf	fsr0
	clrf	indf
	line	261
;led.c: 261: lamp_on_counter[i] = 0;
	clrc
	rlf	(ioinit@i),w
	addlw	_lamp_on_counter&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	262
;led.c: 262: lamp_off_counter[i] = 0;
	clrc
	rlf	(ioinit@i),w
	addlw	_lamp_off_counter&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	263
;led.c: 263: previous_study_counter[i] = 0;
	clrc
	rlf	(ioinit@i),w
	addlw	_previous_study_counter&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	264
;led.c: 264: current_study_counter[i] = 0;
	clrc
	rlf	(ioinit@i),w
	addlw	_current_study_counter&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	265
;led.c: 265: study_chge_counter[i] = 0;
	movf	(ioinit@i),w
	addlw	_study_chge_counter&0ffh
	movwf	fsr0
	clrf	indf
	line	266
;led.c: 266: display_data[i] = 0;
	clrc
	rlf	(ioinit@i),w
	addlw	_display_data&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	267
;led.c: 267: lamp_off_time[i] = 0;
	movf	(ioinit@i),w
	addlw	_lamp_off_time&0ffh
	movwf	fsr0
	clrf	indf
	line	268
;led.c: 268: pulse_study_time_counter[i] = 0;
	clrc
	rlf	(ioinit@i),w
	addlw	_pulse_study_time_counter&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	269
;led.c: 269: pulse_down_times[i] = 0;
	clrc
	rlf	(ioinit@i),w
	addlw	_pulse_down_times&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	258
	
l7947:	
	incf	(ioinit@i),f
	
l7949:	
	movlw	(03h)
	subwf	(ioinit@i),w
	skipc
	goto	u5521
	goto	u5520
u5521:
	goto	l7945
u5520:
	line	271
	
l7951:	
;led.c: 270: }
;led.c: 271: study_lamp_stab_state = 0x07;
	movlw	(07h)
	movwf	(_study_lamp_stab_state)
	line	272
	
l7953:	
;led.c: 272: study_time_flag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_study_time_flag)
	line	273
	
l7955:	
;led.c: 273: study_time_valid_flag = 0;
	clrf	(_study_time_valid_flag)
	line	274
	
l7957:	
;led.c: 274: study_or_pulse_mode = 1;
	clrf	(_study_or_pulse_mode)
	incf	(_study_or_pulse_mode),f
	line	276
	
l7959:	
;led.c: 276: pulse_to_study = 0;
	clrf	(_pulse_to_study)
	line	277
	
l7961:	
;led.c: 277: study_to_pulse = 0;
	clrf	(_study_to_pulse)
	line	278
	
l7963:	
;led.c: 278: study_to_pulse_flag = 0;
	clrf	(_study_to_pulse_flag)
	line	279
	
l7965:	
;led.c: 279: sametime_on_counter = 0;
	clrf	(_sametime_on_counter)
	line	281
	
l7967:	
;led.c: 281: red_displaying_flag = 0;
	clrf	(_red_displaying_flag)
	line	282
	
l7969:	
;led.c: 282: gre_displaying_flag = 0;
	clrf	(_gre_displaying_flag)
	line	283
	
l7971:	
;led.c: 283: yel_displaying_flag = 0;
	clrf	(_yel_displaying_flag)
	line	285
	
l7973:	
;led.c: 285: displaying_second_counter = 0;
	clrf	(_displaying_second_counter)
	line	287
	
l7975:	
;led.c: 287: ten_mm_counter = 0;
	clrf	(_ten_mm_counter)
	line	288
	
l7977:	
;led.c: 288: no_lamp_on_counter = 0;
	clrf	(_no_lamp_on_counter)
	line	289
	
l7979:	
;led.c: 290: if(1 == 1) restart_flag = 0x55;
	clrf	(_lamp_counter_valid_flag)
	line	290
	
l7981:	
	movlw	(055h)
	movwf	(_restart_flag)
	line	291
	
l1159:	
	line	293
;led.c: 293: usart_rx_write = 0;
	clrf	(_usart_rx_write)
	line	294
;led.c: 294: usart_rx_read = 0;
	clrf	(_usart_rx_read)
	line	295
;led.c: 295: communication_flag = 0;
	clrf	(_communication_flag)
	line	296
;led.c: 296: communication_counter=0;
	clrf	(_communication_counter)
	line	297
	
l7985:	
;led.c: 297: address_of_lamp = 0xff;
	movlw	(0FFh)
	movwf	(_address_of_lamp)
	line	299
	
l7987:	
;led.c: 299: every_second_update_flag = 0;
	clrf	(_every_second_update_flag)
	line	300
	
l7989:	
;led.c: 300: every_second_update_counter = 0;
	clrf	(_every_second_update_counter)
	line	301
	
l7991:	
;led.c: 301: every_second_update_delay = 0;
	clrf	(_every_second_update_delay)
	line	302
	
l7993:	
;led.c: 302: RC5=1;
	bsf	(61/8),(61)&7
	line	304
	
l7995:	
;led.c: 304: g_segment_wink_time_counter = 0;;
	clrf	(_g_segment_wink_time_counter)
	line	305
	
l7997:	
;led.c: 305: g_segment_wink_state_flag = 0;
	clrf	(_g_segment_wink_state_flag)
	line	306
	
l7999:	
;led.c: 306: g_segment_wink_display_flag = 0;
	clrf	(_g_segment_wink_display_flag)
	line	307
	
l8001:	
;led.c: 307: g_segment_100ms_counter = 0;
	clrf	(_g_segment_100ms_counter)
	line	308
	
l8003:	
;led.c: 308: g_segment_afresh_state = 0;
	clrf	(_g_segment_afresh_state)
	line	309
	
l8005:	
;led.c: 309: g_segment_afresh_counter = 0;
	clrf	(_g_segment_afresh_counter)
	line	310
;led.c: 310: g_segment_afresh_number = 3;
	movlw	(03h)
	movwf	(_g_segment_afresh_number)
	line	312
	
l8007:	
;led.c: 312: syn_wink_display_state = 0;
	clrf	(_syn_wink_display_state)
	line	313
	
l8009:	
;led.c: 313: syn_wink_display_updata = 0;
	clrf	(_syn_wink_display_updata)
	line	315
	
l8011:	
;led.c: 315: RB4=0;
	bcf	(52/8),(52)&7
	line	316
	
l8013:	
;led.c: 316: RB5=0;
	bcf	(53/8),(53)&7
	line	317
	
l8015:	
;led.c: 317: RB6=0;
	bcf	(54/8),(54)&7
	line	318
	
l1160:	
	return
	opt stack 0
GLOBAL	__end_of_ioinit
	__end_of_ioinit:
;; =============== function _ioinit ends ============

	signat	_ioinit,88
	global	_change_DM13H
psect	text1046,local,class=CODE,delta=2
global __ptext1046
__ptext1046:

;; *************** function _change_DM13H *****************
;; Defined at:
;;		line 119 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               1    6[COMMON] unsigned char 
;;  i               1    5[COMMON] unsigned char 
;;  temp            1    4[COMMON] unsigned char 
;;  ss              1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         4       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1046
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	119
	global	__size_of_change_DM13H
	__size_of_change_DM13H	equ	__end_of_change_DM13H-_change_DM13H
	
_change_DM13H:	
	opt	stack 6
; Regs used in _change_DM13H: [wreg+status,2+status,0]
	line	124
	
l7561:	
;led.c: 121: unsigned char i,ss,k,temp;
;led.c: 124: RB5 = 1;
	bsf	(53/8),(53)&7
	line	125
	
l7563:	
;led.c: 125: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7569:	
	incf	(change_DM13H@k),f
	
l7571:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5171
	goto	u5170
u5171:
	goto	l7569
u5170:
	
l1084:	
	line	126
;led.c: 126: RB3 = 0;
	bcf	(51/8),(51)&7
	line	127
	
l7573:	
;led.c: 127: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7579:	
	incf	(change_DM13H@k),f
	
l7581:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5181
	goto	u5180
u5181:
	goto	l7579
u5180:
	
l1086:	
	line	128
;led.c: 128: RB3 = 1;
	bsf	(51/8),(51)&7
	line	129
	
l7583:	
;led.c: 129: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7589:	
	incf	(change_DM13H@k),f
	
l7591:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5191
	goto	u5190
u5191:
	goto	l7589
u5190:
	
l1088:	
	line	130
;led.c: 130: RB3 = 0;
	bcf	(51/8),(51)&7
	line	131
	
l7593:	
;led.c: 131: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7599:	
	incf	(change_DM13H@k),f
	
l7601:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5201
	goto	u5200
u5201:
	goto	l7599
u5200:
	
l1090:	
	line	132
;led.c: 132: RB3 = 1;
	bsf	(51/8),(51)&7
	line	133
	
l7603:	
;led.c: 133: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7609:	
	incf	(change_DM13H@k),f
	
l7611:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5211
	goto	u5210
u5211:
	goto	l7609
u5210:
	
l1092:	
	line	134
;led.c: 134: RB3 = 0;
	bcf	(51/8),(51)&7
	line	135
	
l7613:	
;led.c: 135: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7619:	
	incf	(change_DM13H@k),f
	
l7621:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5221
	goto	u5220
u5221:
	goto	l7619
u5220:
	
l1094:	
	line	136
;led.c: 136: RB3 = 1;
	bsf	(51/8),(51)&7
	line	137
	
l7623:	
;led.c: 137: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7629:	
	incf	(change_DM13H@k),f
	
l7631:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5231
	goto	u5230
u5231:
	goto	l7629
u5230:
	
l1096:	
	line	138
;led.c: 138: RB3 = 0;
	bcf	(51/8),(51)&7
	line	139
	
l7633:	
;led.c: 139: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7639:	
	incf	(change_DM13H@k),f
	
l7641:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5241
	goto	u5240
u5241:
	goto	l7639
u5240:
	
l1098:	
	line	140
;led.c: 140: RB3 = 1;
	bsf	(51/8),(51)&7
	line	141
	
l7643:	
;led.c: 141: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7649:	
	incf	(change_DM13H@k),f
	
l7651:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5251
	goto	u5250
u5251:
	goto	l7649
u5250:
	
l1100:	
	line	142
;led.c: 142: RB3 = 0;
	bcf	(51/8),(51)&7
	line	143
	
l7653:	
;led.c: 143: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7659:	
	incf	(change_DM13H@k),f
	
l7661:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5261
	goto	u5260
u5261:
	goto	l7659
u5260:
	
l1102:	
	line	144
;led.c: 144: RB5 = 0;
	bcf	(53/8),(53)&7
	line	145
	
l7663:	
;led.c: 145: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7669:	
	incf	(change_DM13H@k),f
	
l7671:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5271
	goto	u5270
u5271:
	goto	l7669
u5270:
	line	147
	
l7673:	
;led.c: 147: ss = 0B1000000;
	movlw	(040h)
	movwf	(change_DM13H@ss)
	line	148
;led.c: 148: temp = 0x40;
	movlw	(040h)
	movwf	(change_DM13H@temp)
	line	149
	
l7675:	
;led.c: 149: for(i=0; i<=6;i++)
	clrf	(change_DM13H@i)
	line	151
	
l7681:	
;led.c: 150: {
;led.c: 151: if(ss & temp)
	movf	(change_DM13H@ss),w
	andwf	(change_DM13H@temp),w
	btfsc	status,2
	goto	u5281
	goto	u5280
u5281:
	goto	l7685
u5280:
	line	154
	
l7683:	
;led.c: 152: {
;led.c: 154: PORTB |= 0x07;
	movlw	(07h)
	iorwf	(6),f	;volatile
	line	155
;led.c: 155: }
	goto	l7687
	line	159
	
l7685:	
;led.c: 156: else
;led.c: 157: {
;led.c: 159: PORTB &= 0xf8;
	movlw	(0F8h)
	andwf	(6),f	;volatile
	line	162
	
l7687:	
;led.c: 160: }
;led.c: 162: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7693:	
	incf	(change_DM13H@k),f
	
l7695:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5291
	goto	u5290
u5291:
	goto	l7693
u5290:
	
l1110:	
	line	163
;led.c: 163: RB3=1;
	bsf	(51/8),(51)&7
	line	164
	
l7697:	
;led.c: 164: for(k=0;k<6;k++);
	clrf	(change_DM13H@k)
	
l7703:	
	incf	(change_DM13H@k),f
	
l7705:	
	movlw	(06h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5301
	goto	u5300
u5301:
	goto	l7703
u5300:
	
l1112:	
	line	165
;led.c: 165: RB3=0;
	bcf	(51/8),(51)&7
	line	166
;led.c: 166: temp >>= 1;
	clrc
	rrf	(change_DM13H@temp),f
	line	149
	
l7707:	
	incf	(change_DM13H@i),f
	
l7709:	
	movlw	(07h)
	subwf	(change_DM13H@i),w
	skipc
	goto	u5311
	goto	u5310
u5311:
	goto	l7681
u5310:
	line	169
	
l7711:	
;led.c: 167: }
;led.c: 169: PORTB |= 0x07;
	movlw	(07h)
	iorwf	(6),f	;volatile
	line	170
	
l7713:	
;led.c: 170: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7719:	
	incf	(change_DM13H@k),f
	
l7721:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5321
	goto	u5320
u5321:
	goto	l7719
u5320:
	
l1114:	
	line	171
;led.c: 171: RB3=1;
	bsf	(51/8),(51)&7
	line	172
	
l7723:	
;led.c: 172: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7729:	
	incf	(change_DM13H@k),f
	
l7731:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5331
	goto	u5330
u5331:
	goto	l7729
u5330:
	
l1116:	
	line	173
;led.c: 173: RB3=0;
	bcf	(51/8),(51)&7
	line	174
	
l7733:	
;led.c: 174: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7739:	
	incf	(change_DM13H@k),f
	
l7741:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5341
	goto	u5340
u5341:
	goto	l7739
u5340:
	line	176
	
l7743:	
;led.c: 176: PORTB &= 0xf8;
	movlw	(0F8h)
	andwf	(6),f	;volatile
	line	177
	
l7745:	
;led.c: 177: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7751:	
	incf	(change_DM13H@k),f
	
l7753:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5351
	goto	u5350
u5351:
	goto	l7751
u5350:
	
l1120:	
	line	178
;led.c: 178: RB3=1;
	bsf	(51/8),(51)&7
	line	179
	
l7755:	
;led.c: 179: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7761:	
	incf	(change_DM13H@k),f
	
l7763:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5361
	goto	u5360
u5361:
	goto	l7761
u5360:
	
l1122:	
	line	180
;led.c: 180: RB3=0;
	bcf	(51/8),(51)&7
	line	182
	
l7765:	
;led.c: 182: PORTB &= 0xf8;
	movlw	(0F8h)
	andwf	(6),f	;volatile
	line	183
	
l7767:	
;led.c: 183: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7773:	
	incf	(change_DM13H@k),f
	
l7775:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5371
	goto	u5370
u5371:
	goto	l7773
u5370:
	
l1124:	
	line	184
;led.c: 184: RB3=1;
	bsf	(51/8),(51)&7
	line	185
	
l7777:	
;led.c: 185: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7783:	
	incf	(change_DM13H@k),f
	
l7785:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5381
	goto	u5380
u5381:
	goto	l7783
u5380:
	
l1126:	
	line	186
;led.c: 186: RB3=0;
	bcf	(51/8),(51)&7
	line	189
	
l7787:	
;led.c: 189: ss = 0B1000000;
	movlw	(040h)
	movwf	(change_DM13H@ss)
	line	190
;led.c: 190: temp = 0x40;
	movlw	(040h)
	movwf	(change_DM13H@temp)
	line	191
	
l7789:	
;led.c: 191: for(i=0; i<=6;i++)
	clrf	(change_DM13H@i)
	line	193
	
l7795:	
;led.c: 192: {
;led.c: 193: if(ss & temp)
	movf	(change_DM13H@ss),w
	andwf	(change_DM13H@temp),w
	btfsc	status,2
	goto	u5391
	goto	u5390
u5391:
	goto	l7799
u5390:
	line	196
	
l7797:	
;led.c: 194: {
;led.c: 196: PORTB |= 0x07;
	movlw	(07h)
	iorwf	(6),f	;volatile
	line	197
;led.c: 197: }
	goto	l7801
	line	201
	
l7799:	
;led.c: 198: else
;led.c: 199: {
;led.c: 201: PORTB &= 0xf8;
	movlw	(0F8h)
	andwf	(6),f	;volatile
	line	204
	
l7801:	
;led.c: 202: }
;led.c: 204: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7807:	
	incf	(change_DM13H@k),f
	
l7809:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5401
	goto	u5400
u5401:
	goto	l7807
u5400:
	
l1132:	
	line	205
;led.c: 205: RB3=1;
	bsf	(51/8),(51)&7
	line	206
	
l7811:	
;led.c: 206: for(k=0;k<6;k++);
	clrf	(change_DM13H@k)
	
l7817:	
	incf	(change_DM13H@k),f
	
l7819:	
	movlw	(06h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5411
	goto	u5410
u5411:
	goto	l7817
u5410:
	
l1134:	
	line	207
;led.c: 207: RB3=0;
	bcf	(51/8),(51)&7
	line	208
;led.c: 208: temp >>= 1;
	clrc
	rrf	(change_DM13H@temp),f
	line	191
	
l7821:	
	incf	(change_DM13H@i),f
	
l7823:	
	movlw	(07h)
	subwf	(change_DM13H@i),w
	skipc
	goto	u5421
	goto	u5420
u5421:
	goto	l7795
u5420:
	line	211
	
l7825:	
;led.c: 209: }
;led.c: 211: PORTB |= 0x07;
	movlw	(07h)
	iorwf	(6),f	;volatile
	line	212
	
l7827:	
;led.c: 212: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7833:	
	incf	(change_DM13H@k),f
	
l7835:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5431
	goto	u5430
u5431:
	goto	l7833
u5430:
	
l1136:	
	line	213
;led.c: 213: RB3=1;
	bsf	(51/8),(51)&7
	line	214
	
l7837:	
;led.c: 214: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7843:	
	incf	(change_DM13H@k),f
	
l7845:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5441
	goto	u5440
u5441:
	goto	l7843
u5440:
	
l1138:	
	line	215
;led.c: 215: RB3=0;
	bcf	(51/8),(51)&7
	line	216
	
l7847:	
;led.c: 216: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7853:	
	incf	(change_DM13H@k),f
	
l7855:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5451
	goto	u5450
u5451:
	goto	l7853
u5450:
	line	218
	
l7857:	
;led.c: 218: PORTB &= 0xf8;
	movlw	(0F8h)
	andwf	(6),f	;volatile
	line	219
	
l7859:	
;led.c: 219: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7865:	
	incf	(change_DM13H@k),f
	
l7867:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5461
	goto	u5460
u5461:
	goto	l7865
u5460:
	
l1142:	
	line	220
;led.c: 220: RB3=1;
	bsf	(51/8),(51)&7
	line	221
	
l7869:	
;led.c: 221: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7875:	
	incf	(change_DM13H@k),f
	
l7877:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5471
	goto	u5470
u5471:
	goto	l7875
u5470:
	
l1144:	
	line	222
;led.c: 222: RB3=0;
	bcf	(51/8),(51)&7
	line	224
	
l7879:	
;led.c: 224: PORTB &= 0xf8;
	movlw	(0F8h)
	andwf	(6),f	;volatile
	line	225
	
l7881:	
;led.c: 225: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7887:	
	incf	(change_DM13H@k),f
	
l7889:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5481
	goto	u5480
u5481:
	goto	l7887
u5480:
	
l1146:	
	line	226
;led.c: 226: RB3=1;
	bsf	(51/8),(51)&7
	line	227
	
l7891:	
;led.c: 227: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7897:	
	incf	(change_DM13H@k),f
	
l7899:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5491
	goto	u5490
u5491:
	goto	l7897
u5490:
	
l1148:	
	line	228
;led.c: 228: RB3=0;
	bcf	(51/8),(51)&7
	line	231
	
l7901:	
;led.c: 231: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7907:	
	incf	(change_DM13H@k),f
	
l7909:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5501
	goto	u5500
u5501:
	goto	l7907
u5500:
	
l1150:	
	line	232
;led.c: 232: RB5 = 1;
	bsf	(53/8),(53)&7
	line	233
	
l7911:	
;led.c: 233: for(k=0;k<2;k++);
	clrf	(change_DM13H@k)
	
l7917:	
	incf	(change_DM13H@k),f
	
l7919:	
	movlw	(02h)
	subwf	(change_DM13H@k),w
	skipc
	goto	u5511
	goto	u5510
u5511:
	goto	l7917
u5510:
	
l1152:	
	line	234
;led.c: 234: RB5 = 0;
	bcf	(53/8),(53)&7
	line	235
	
l1153:	
	return
	opt stack 0
GLOBAL	__end_of_change_DM13H
	__end_of_change_DM13H:
;; =============== function _change_DM13H ends ============

	signat	_change_DM13H,88
	global	_ISR
psect	text1047,local,class=CODE,delta=2
global __ptext1047
__ptext1047:

;; *************** function _ISR *****************
;; Defined at:
;;		line 1419 in file "D:\project\DJS\sanse88+RS485\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          3       0       0       0
;;      Totals:         3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1047
	file	"D:\project\DJS\sanse88+RS485\led.c"
	line	1419
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg-fsr0h+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	fsr0,w
	movwf	(??_ISR+1)
	movf	pclath,w
	movwf	(??_ISR+2)
	ljmp	_ISR
psect	text1047
	line	1420
	
i1l6161:	
;led.c: 1420: if(TMR1IF == 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l6169
u339_20:
	line	1422
	
i1l6163:	
;led.c: 1421: {
;led.c: 1422: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	1423
	
i1l6165:	
;led.c: 1423: TMR1H=0xFB;
	movlw	(0FBh)
	movwf	(15)	;volatile
	line	1424
;led.c: 1424: TMR1L=0x85;
	movlw	(085h)
	movwf	(14)	;volatile
	line	1425
	
i1l6167:	
;led.c: 1425: TFG=1;
	clrf	(_TFG)
	incf	(_TFG),f
	line	1427
	
i1l6169:	
;led.c: 1426: }
;led.c: 1427: if(RCIF == 1)
	btfss	(101/8),(101)&7
	goto	u340_21
	goto	u340_20
u340_21:
	goto	i1l1528
u340_20:
	line	1429
	
i1l6171:	
;led.c: 1428: {
;led.c: 1429: usart_rx_buffer[usart_rx_write] = RCREG;
	movf	(_usart_rx_write),w
	addlw	_usart_rx_buffer&0ffh
	movwf	fsr0
	movf	(26),w	;volatile
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	1430
	
i1l6173:	
;led.c: 1430: usart_rx_write++;
	incf	(_usart_rx_write),f
	line	1431
	
i1l6175:	
;led.c: 1431: if(usart_rx_write >= 30) usart_rx_write=0;
	movlw	(01Eh)
	subwf	(_usart_rx_write),w
	skipc
	goto	u341_21
	goto	u341_20
u341_21:
	goto	i1l6179
u341_20:
	
i1l6177:	
	clrf	(_usart_rx_write)
	line	1432
	
i1l6179:	
;led.c: 1432: if(OERR == 1)
	btfss	(193/8),(193)&7
	goto	u342_21
	goto	u342_20
u342_21:
	goto	i1l1528
u342_20:
	line	1434
	
i1l6181:	
;led.c: 1433: {
;led.c: 1434: CREN = 0;
	bcf	(196/8),(196)&7
	line	1435
;led.c: 1435: CREN = 1;
	bsf	(196/8),(196)&7
	line	1438
	
i1l1528:	
	movf	(??_ISR+2),w
	movwf	pclath
	movf	(??_ISR+1),w
	movwf	fsr0
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text1048,local,class=CODE,delta=2
global __ptext1048
__ptext1048:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
