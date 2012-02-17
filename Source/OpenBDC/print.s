;###############################################################################
;# S12CBase - PRINT - Print routines                                           #
;###############################################################################
;#    Copyright 2010 Dirk Heisswolf                                            #
;#    This file is part of the S12CBase framework for Freescale's S12C MCU     #
;#    family.                                                                  #
;#                                                                             #
;#    S12CBase is free software: you can redistribute it and/or modify         #
;#    it under the terms of the GNU General Public License as published by     #
;#    the Free Software Foundation, either version 3 of the License, or        #
;#    (at your option) any later version.                                      #
;#                                                                             #
;#    S12CBase is distributed in the hope that it will be useful,              #
;#    but WITHOUT ANY WARRANTY; without even the implied warranty of           #
;#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            #
;#    GNU General Public License for more details.                             #
;#                                                                             #
;#    You should have received a copy of the GNU General Public License        #
;#    along with S12CBase.  If not, see <http://www.gnu.org/licenses/>.        #
;###############################################################################
;# Description:                                                                #
;#    This module implements various print routines for the SCI driver:        #
;#    PRINT_STR        - print an unformated   string                          #
;#    PRINT_LSTR       - print a left aligned  string                          #
;#    PRINT_RSTR       - print a right aligned string                          #
;#    PRINT_UINT       - print an unformated   unsigned integer value          #
;#    PRINT_LUINT      - print a left aligned  unsigned integer value          #
;#    PRINT_RUINT      - print a right aligned unsigned integer value          #
;#    PRINT_SINT       - print an unformated   signed   integer value          #
;#    PRINT_LSINT      - print a left aligned  signed   integer value          #
;#    PRINT_RSINT      - print a right aligned signed   integer value          #
;#    PRINT_UDBL       - print an unformated   unsigned double  value          #
;#    PRINT_LUDBL      - print a left aligned  unsigned double  value          #
;#    PRINT_RUDBL      - print a right aligned unsigned double  value          #
;#    PRINT_SDBL       - print an unformated   signed   double  value          #
;#    PRINT_LSDBL      - print a left aligned  signed   double  value          #
;#    PRINT_RSDBL      - print a right aligned signed   double  value          #
;#    PRINT_STRCNT     - count the characters of a string                      #
;#    PRINT_UINTCNT    - count the digits of an unsigned integer value         #
;#    PRINT_SINTCNT    - count the digits of a  signed   integer value         #
;#    PRINT_UDBLCNT    - count the digits of an unsigned double  value         #
;#    PRINT_SDBLCNT    - count the digits of a  signed   double  value         #
;#    PRINT_LINE_BREAK - prints the line break sequence                        #
;#    PRINT_SPCS       - prints a number of space characters                   #
;#    PRINT_SPC        - prints a space character                              #
;#    PRINT_BEEP       - sends a beep                                          #
;#    PRINT_BYTE       - prints a 2-digit hexadecimal number                   #
;#    PRINT_WORD       - prints a 4-digit hexadecimal number                   #
;#    PRINT_BITS       - prints a 8-digit binary number                        #
;#    PRINT_CHAR       - prints a ASCII character                              #
;#    PRINT_UPPER_B    - converts an ASCII character to upper case             #
;#    PRINT_LOWER_B    - converts an ASCII character to lower case             #
;#    PRINT_WAIT       - wait until output has been printed                    #
;#                                                                             #
;#    Each of these functions has a coresponding macro definition              #
;###############################################################################
;# Required Modules:                                                           #
;#    SCI    - SCI driver                                                      #
;#    SSTACK - Subroutine Stack Handler                                        #
;#                                                                             #
;# Requirements to Software Using this Module:                                 #
;#    - none                                                                   #
;###############################################################################
;# Version History:                                                            #
;#    Apr  4, 2010                                                             #
;#      - Initial release                                                      #
;#    Apr 29, 2010                                                             #
;#      - Added macros "PRINT_UPPER_B" and "PRINT_LOWER_B"                     #
;#    Jul 29, 2010                                                             #
;#      - fixed PRINT_SINTCNT                                                  #
;###############################################################################
	
;###############################################################################
;# Constants                                                                   #
;###############################################################################
;#ASCII code 
PRINT_SYM_BEEP		EQU	$07 	;acoustic signal
PRINT_SYM_BACKSPACE	EQU	$08 	;backspace symbol
PRINT_SYM_TAB		EQU	$09 	;tab symbol
PRINT_SYM_LF		EQU	$0A 	;line feed symbol
PRINT_SYM_CR		EQU	$0D 	;carriage return symbol
PRINT_SYM_SPACE		EQU	$20 	;space symbol
PRINT_SYM_DEL		EQU	$7F 	;delete symbol

;#String ternination 
PRINT_STRING_TERM	EQU	$80 	;MSB for string termination
	
;Valid number base
PRINT_BASE_MIN	EQU	2		;binary
PRINT_BASE_MAX	EQU	PRINT_SYMTAB_END-PRINT_SYMTAB	;max base value determined by symbol table
PRINT_BASE_DEF	EQU	10		;default base (decimal)
	
;###############################################################################
;# Variables                                                                   #
;###############################################################################
			ORG	PRINT_VARS_START
PRINT_VARS_END		EQU	*

;###############################################################################
;# Macros                                                                      #
;###############################################################################
;#Initialization
#macro	PRINT_INIT, 0
#emac	

;#Print a signed integer value
; args:   X: signed integer value
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
#macro	PRINT_SINT 0
	SSTACK_JOBSR	PRINT_SINT
#emac	

;#Print a left aligned signed integer value
; args:   X: signed integer value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
#macro	PRINT_LSINT, 0
	SSTACK_JOBSR	PRINT_LSINT
#emac	

;#Print an unsigned integer value
; args:   X: unsigned integer value
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
#macro	PRINT_UINT, 0
	SSTACK_JOBSR	PRINT_UINT
#emac	

;#Print a left aligned unsigned integer value
; args:   X: unsigned integer value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
#macro	PRINT_LUINT, 0
	SSTACK_JOBSR	PRINT_LUINT
#emac	

;#Print a signed double value
; args: Y:X: signed double value
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
#macro	PRINT_SDBL, 0
	SSTACK_JOBSR	PRINT_SDBL
#emac	

;#Print a left aligned signed double value
; args: Y:X: signed double value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
#macro	PRINT_LSDBL, 0
	SSTACK_JOBSR	PRINT_LSDBL
#emac	

;#Print an unsigned double value
; args: Y:X: unsigned double value
; 	  B: base   (2<=base<=16)
; SSTACK: 24 bytes
;         X, Y and D are preserved
#macro	PRINT_UDBL, 0
	SSTACK_JOBSR	PRINT_UDBL
#emac	

;#Fix base value
; args:   B: base
; result: B: fixed base (2<=base<=16)
; SSTACK: 2 bytes
;         X, Y and A are preserved
#macro	PRINT_FIX_BASE, 0
	SSTACK_JOBSR	PRINT_FIX_BASE
#emac	

;#Print a left aligned unsigned double value
; args: Y:X: unsigned double value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
#macro	PRINT_LUDBL, 0
	SSTACK_JOBSR	PRINT_LUDBL
#emac	

;#Print a right aligned unsigned double value
; args: Y:X: unsigned double value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
#macro	PRINT_RUDBL, 0
	SSTACK_JOBSR	PRINT_RUDBL
#emac	

;#Print a right aligned signed double value
; args: Y:X: signed double value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
#macro	PRINT_RSDBL, 0
	SSTACK_JOBSR	PRINT_RSDBL
#emac	

;#Print a right aligned unsigned integer value
; args:   X: unsigned integer value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
#macro	PRINT_RUINT, 0
	SSTACK_JOBSR	PRINT_RUINT
#emac	

;#Print a right aligned signed integer value
; args:   X: signed integer value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
#macro	PRINT_RSINT, 0
	SSTACK_JOBSR	PRINT_RSINT
#emac	

;#Count digits of an unsigned double value
; args:   Y:X: unsigned double value
; 	  B: base   (2<=base<=16)
; result: A: number of digits
; SSTACK: 13 bytes
;         X, Y and B are preserved
#macro	PRINT_UDBLCNT, 0
	SSTACK_JOBSR	PRINT_UDBLCNT
#emac	

;#Count digits of a signed double value
; args:   Y:X: signed double value
; 	  B: base   (2<=base<=16)
; result: A: number of digits
; SSTACK: 13 bytes
;         X, Y and B are preserved
#macro	PRINT_SDBLCNT, 0
	SSTACK_JOBSR	PRINT_SDBLCNT
#emac	

;#Count digits of an unsigned integer value
; args:   X: unsigned integer value
; 	  B: base   (2<=base<=16)
; result: A: number of digits
; SSTACK: 13 bytes
;         X, Y and B are preserved
#macro	PRINT_UINTCNT, 0
	SSTACK_JOBSR	PRINT_UINTCNT
#emac	

;#Count digits of a signed double value
; args:   X: signed double value
; 	  B: base   (2<=base<=16)
; result: A: number of digits
; SSTACK: 13 bytes
;         X, Y and B are preserved
#macro	PRINT_SINTCNT, 0
	SSTACK_JOBSR	PRINT_SINTCNT
#emac	

;#Print spaces
; args:   A: character count
; result: none
; SSTACK: 12 bytes
;         X, Y and D are preserved
#macro	PRINT_SPCS, 0
	SSTACK_JOBSR	PRINT_SPCS
#emac	

;#Print space
; args:   none
; result: none
; SSTACK: 12 bytes
;         X, Y and D are preserved
#macro	PRINT_SPC, 0
	SSTACK_JOBSR	PRINT_SPC
#emac	

;#Count characters of a string
; args:   X: start of the string
; result: A: character count (saturated at 255)
; SSTACK: 2 bytes
;         X, Y and B are preserved
#macro	PRINT_STRCNT, 0
	SSTACK_JOBSR	PRINT_STRCNT
#emac
	
;#Print a right aligned string to the SCI
; args:   X: start of the string
;         A: minimum lenght of the output
; result: none
; SSTACK: 18 bytes
;         X, Y and D are preserved
#macro	PRINT_RSTR, 0
	SSTACK_JOBSR	PRINT_RSTR
#emac	

;#Print a left aligned string to the SCI
; args:   X: start of the string
;         A: minimum lenght of the output
; SSTACK: 14 bytes
;         X, Y and D are preserved
#macro	PRINT_LSTR, 0
	SSTACK_JOBSR	PRINT_LSTR
#emac	

;#Print a string to the SCI (without alignment)
; args:   X: start of the string
; SSTACK: 14 bytes
;         X, Y and D are preserved
#macro	PRINT_STR, 0
	SSTACK_JOBSR	PRINT_STR
#emac	

;#Print a line break to the SCI
; args:   none
; result: none
; SSTACK: 11 bytes
;         X, Y and D are preserved
#macro	PRINT_LINE_BREAK, 0
	SSTACK_JOBSR	PRINT_LINE_BREAK
#emac	

;#Send a beep to the SCI
; args:   none
; result: none
; SSTACK: 11 bytes
;         X, Y and D are preserved
#macro	PRINT_BEEP, 0
	SSTACK_JOBSR	PRINT_BEEP
#emac	

;#Print an 8-bit value to the SCI
; args:   B: 8-bit value
; result: none
; SSTACK: 14 bytes
;         X, Y and D are preserved
#macro	PRINT_BYTE, 0
	SSTACK_JOBSR	PRINT_BYTE
#emac	

;#Print a 16-bit value to the SCI
; args:   D: 16-bit value
; SSTACK: 16 bytes
;         X, Y and D are preserved
#macro	PRINT_WORD, 0
	SSTACK_JOBSR	PRINT_WORD
#emac	

;#Print a unsigned integer value to the SCI
; args:   B: bit field
; result: none
; SSTACK: 14 bytes
;         X, Y and D are preserved
#macro	PRINT_BITS, 0
	SSTACK_JOBSR	PRINT_BITS
#emac	

;#Transmit one byte (convinience macro to call the SCI_TX subroutine)
; args:   B: data to be send
; result: none
; SSTACK: 8 bytes
;         X, Y, and D are preserved 
#macro	PRINT_CHAR, 0
		SCI_TX
#emac

;#Convert a lower case character to upper case
; args:   B: ASCII character (w/ or w/out termination)
; result: none
; SSTACK: 8 bytes
;         X, Y, and D are preserved 
#macro	PRINT_UPPER_B, 0
	CMPB	#$61		;"a"
	BLO	DONE
	CMPB	#$7A		;"z"
	BLS	ADJUST
	CMPB	#$EA		;"a"+$80
	BLO	DONE
	CMPB	#$FA		;"z"+$80
	BHI	DONE
ADJUST	SUBB	#$20		;"a"-"A"	
DONE	EQU	*
#emac

;#Convert an upper case character to lower case
; args:   B: ASCII character (w/ or w/out termination)
; result: none
; SSTACK: 8 bytes
;         X, Y, and D are preserved 
#macro	PRINT_LOWER_B, 0
	CMPB	#$41		;"A"
	BLO	DONE
	CMPB	#$5A		;"Z"
	BLS	ADJUST
	CMPB	#$C1		;"A"+$80
	BLO	DONE
	CMPB	#$DA		;"Z"+$80
	BHI	DONE
ADJUST	ADDB	#$20		;"a"-"A"	
DONE	EQU	*
#emac
	
;#Wait until all output has been printed
; args:   none
; result: none
; SSTACK: 4 bytes
;         X, Y, and D are preserved 
#macro	PRINT_WAIT, 0
	SCI_TX_WAIT
#emac
	
;###############################################################################
;# Code                                                                        #
;###############################################################################
			ORG	PRINT_CODE_START

;#Print a signed integer value
; args:   X: signed integer value
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
PRINT_SINT		EQU	*
			;Save registers (value in X, min. length in A, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Print left aligned unsigned double value (value in X, min. length in A, base in B)
PRINT_SINT_1		CLRA
			JOB	PRINT_SINT_2
PRINT_SINT_2		EQU	PRINT_LSINT_1

;#Print a left aligned signed integer value
; args:   X: signed integer value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
PRINT_LSINT		EQU	*
			;Save registers (value in X, min. length in A, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Check if number is negative (value in X, min. length in A, base in B)
PRINT_LSINT_1		LDY	#$0000
			CPX	#$0000
			BPL	PRINT_LSINT_2 		;number is positive
			LEAY	-1,Y
			;Print double signed value (value in Y:X, min. length in A, base in B)
			JOB	PRINT_LSINT_2	
PRINT_LSINT_2		EQU	PRINT_LSDBL_1

;#Print an unsigned integer value
; args:   X: unsigned integer value
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
PRINT_UINT		EQU	*
			;Save registers (value in X, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Print left aligned value (value in X, base in B)
PRINT_UINT_1		CLRA
			JOB	PRINT_UINT_2	
PRINT_UINT_2		EQU	PRINT_LUINT_1
	
;#Print a left aligned unsigned integer value
; args:   X: unsigned integer value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
PRINT_LUINT		EQU	*
			;Save registers (value in X, min. length in A, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Print double value (value in X, min. length in A, base in B)
PRINT_LUINT_1		LDY	#$0000	
			JOB	PRINT_LUINT_2 		;jump to division loop	
PRINT_LUINT_2		EQU	PRINT_LUDBL_1
	
;#Print a signed double value
; args: Y:X: signed double value
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
PRINT_SDBL		EQU	*
			;Save registers
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Print left aligned signed double value
PRINT_SDBL_1		CLRA
			JOB	PRINT_SDBL_2
PRINT_SDBL_2		EQU	PRINT_LSDBL_1
	
;#Print a left aligned signed double value
; args: Y:X: signed double value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
PRINT_LSDBL		EQU	*	
			;Save registers (value in Y:X, min. length in A, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D	
			;Check if number is negative (value in Y:X, min. length in A, base in B)
PRINT_LSDBL_1		CPY	#$0000
			BPL	PRINT_LSDBL_3 		;number is positive
			;Number is negative (value in Y:X, min. length in A, base in B)
			;Print minus (value in Y:X, min. length in A, base in B)
			LDAB	#"-"
			SCI_TX				;print character (SSTACK: 8 bytes)
			LDAB	1,SP
			;Decrement min length and saturate at zero (value in Y:X, min. length in A, base in B) 
			SUBA	#1
			ADCA	#0	
			;Calculate 2's complement (value in Y:X, min. length in A, base in B)
			EXG	D, Y
			COMA
			COMB
			EXG	D, X
			COMA
			COMB
			ADDD	#1
			EXG	D, X
			ADCB	#0
			ADCA	#0
			EXG	D, Y
			JOB	PRINT_LSDBL_3 
			;Print unsigned double value
PRINT_LSDBL_3		EQU	PRINT_LUDBL_1
	
;#Print an unsigned double value
; args: Y:X: unsigned double value
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
PRINT_UDBL		EQU	*
			;Save registers (value in Y:X, min. length in A, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Print left aligned unsigned double value (value in Y:X, min. length in A, base in B)
PRINT_UDBL_1		CLRA
			JOB	PRINT_UDBL_2
PRINT_UDBL_2		EQU	PRINT_LUDBL_1

;#Fix base value
; args:   B: base
; result: B: fixed base (2<=base<=16)
; SSTACK: 2 bytes
;         X, Y and A are preserved
PRINT_FIX_BASE		EQU	*
			CMPB	#PRINT_BASE_MIN		;base must be at least 2 (binary)
			BHS	PRINT_FIX_BASE_1	;base is at least 2 (binary)
			LDAB	#PRINT_BASE_DEF		;set default base
PRINT_FIX_BASE_1	CMPB	#PRINT_BASE_MAX		;required set of symbols must not exceed the alphabet
			BLS	PRINT_FIX_BASE_2	;base is within valid range
			LDAB	#PRINT_BASE_DEF		;set default base
PRINT_FIX_BASE_2	SSTACK_RTS
	
;#Print a left aligned unsigned double value
; args: Y:X: unsigned double value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
PRINT_LUDBL		EQU	*
PRINT_LUDBL1_FTMP3	EQU	$0
PRINT_LUDBL1_FTMP2	EQU	$1
PRINT_LUDBL1_FTMP1	EQU	$2
PRINT_LUDBL1_FTMP0	EQU	$3
PRINT_LUDBL1_RTMP5	EQU	$4
PRINT_LUDBL1_RTMP4	EQU	$5
PRINT_LUDBL1_RTMP3	EQU	$6
PRINT_LUDBL1_RTMP2	EQU	$7
PRINT_LUDBL1_RTMP1	EQU	$8
PRINT_LUDBL1_RTMP0	EQU	$9
PRINT_LUDBL1_CNT	EQU	$A
PRINT_LUDBL1_BASE	EQU	$B
PRINT_LUDBL1_A		EQU	$C
PRINT_LUDBL1_B		EQU	$D
PRINT_LUDBL1_X		EQU	$E
PRINT_LUDBL1_Y		EQU	$10
			;Save registers (value in Y:X, min. length in A, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Fix base (value in Y:X, min. length in A, base in B)
PRINT_LUDBL_1		SSTACK_JOBSR	PRINT_FIX_BASE	;adjust base value (SSTACK: 2 bytes)
			;Allocate and initialize local variables (value in Y:X, min. length in A, base in B)
			SSTACK_ALLOC,12			;allocate local variables
			STD	PRINT_LUDBL1_CNT,SP
			STX	PRINT_LUDBL1_FTMP1,SP
			STY	PRINT_LUDBL1_FTMP3,SP
			MOVW	#$0000, PRINT_LUDBL1_RTMP5,SP
			MOVW	#$0000, PRINT_LUDBL1_RTMP3,SP
			CLR	PRINT_LUDBL1_RTMP1,SP
			STAB	PRINT_LUDBL1_RTMP0,SP
			;Division loop 			
PRINT_LUDBL_2		LDAA	PRINT_LUDBL1_CNT,SP 	;decrement the counter
			SUBA	#1			;and keep counter positive
			ADCA	#0
			STAA	PRINT_LUDBL1_CNT,SP 
			;Byte 3/Byte 2
			LDX	PRINT_LUDBL1_FTMP3,SP	;tmp3:tmp2 => X
			BEQ	PRINT_LUDBL_3		;division step can be skipped
			CLRA				;base => D
			LDAB	PRINT_LUDBL1_BASE,SP
			EXG	X, D
			IDIV				;D / X => X,  D % X => D 
			STX	PRINT_LUDBL1_FTMP3,SP	;result => tmp3:tmp2
			;Byte 1/Byte 0 (prev, remainder in D)
			TFR	D, X			;remainder => X
PRINT_LUDBL_3		CLRA				;base => D
			LDAB	PRINT_LUDBL1_BASE,SP
			LDY	PRINT_LUDBL1_FTMP1,SP	;tmp1:tmp0 => Y
			EXG	X, Y
			EXG	X, D
			EDIV				;Y:D / X => Y,  Y:D % X => D 
			STY	PRINT_LUDBL1_FTMP1,SP	;result => tmp1:tmp0
			;Add remainder to the reverse value
			;Byte 1/Byte 0
			ADDD	PRINT_LUDBL1_RTMP1,SP
			STD	PRINT_LUDBL1_RTMP1,SP
			;Byte 3/Byte 2
			LDD	PRINT_LUDBL1_RTMP3,SP
			ADCB	#$00	
			ADCA	#$00
			STD	PRINT_LUDBL1_RTMP3,SP
			;Byte 5/Byte 4
			LDD	PRINT_LUDBL1_RTMP5,SP
			ADCB	#$00	
			ADCA	#$00
			STD	PRINT_LUDBL1_RTMP5,SP
			;check if the reverse value needs to be shifted
			LDD	PRINT_LUDBL1_FTMP1,SP
			BNE	PRINT_LUDBL_4 		;reverse value has been generated
			LDD	PRINT_LUDBL1_FTMP3,SP
			BEQ	PRINT_LUDBL_5		;reverse value has been generated
			;Multiply the reverse value by the base
			;Byte 1/Byte 0
PRINT_LUDBL_4		LDY	PRINT_LUDBL1_RTMP1,SP
			CLRA
			LDAB	PRINT_LUDBL1_BASE,SP
			EMUL				;Y * D => Y:D
			STD	PRINT_LUDBL1_RTMP1,SP
			;Byte 3/Byte 2
			LDD	PRINT_LUDBL1_RTMP3,SP
			EXG	D, Y
			STD	PRINT_LUDBL1_RTMP3,SP
			CLRA
			LDAB	PRINT_LUDBL1_BASE,SP
			EMUL				;Y * D => Y:D
			ADDD	PRINT_LUDBL1_RTMP3,SP
			STD	PRINT_LUDBL1_RTMP3,SP
			;Byte 5/Byte 4
			LDD	PRINT_LUDBL1_RTMP5,SP
			EXG	D, Y
			STD	PRINT_LUDBL1_RTMP5,SP
			CLRA
			LDAB	PRINT_LUDBL1_BASE,SP
			EMUL				;Y * D => Y:D
			ADDD	PRINT_LUDBL1_RTMP5,SP
			STD	PRINT_LUDBL1_RTMP5,SP
			;Start new iteration
			JOB	PRINT_LUDBL_2
			;Deallocate forward variable
PRINT_LUDBL_5		SSTACK_DEALLOC,4
PRINT_LUDBL2_RTMP5	EQU	$0
PRINT_LUDBL2_RTMP4	EQU	$1
PRINT_LUDBL2_RTMP3	EQU	$2
PRINT_LUDBL2_RTMP2	EQU	$3
PRINT_LUDBL2_RTMP1	EQU	$4
PRINT_LUDBL2_RTMP0	EQU	$5
PRINT_LUDBL2_CNT	EQU	$6
PRINT_LUDBL2_BASE	EQU	$7
			;Print reverse variable
			;Byte 5/Byte 4
PRINT_LUDBL_6		LDY	PRINT_LUDBL2_RTMP5,SP	;tmp5:tmp4 => Y
			BEQ	PRINT_LUDBL_7		;division step can be skipped
			TFR	Y, X
			CLRA				;base => D
			LDAB	PRINT_LUDBL2_BASE,SP
			EXG	X, D
			IDIV				;D / X => X,  D % X => D 
			STX	PRINT_LUDBL2_RTMP5,SP	;result => tmp3:tmp2
			;Byte 3/Byte 2 (prev remainder in D)
			TFR	D, Y			;remainder => Y
PRINT_LUDBL_7		CLRA				;base => D
			LDAB	PRINT_LUDBL2_BASE,SP
			LDX	PRINT_LUDBL2_RTMP3,SP	;tmp3:tmp2 => Y
			EXG	D, X
			EDIV				;Y:D / X => Y,  Y:D % X => D 
			STY	PRINT_LUDBL2_RTMP3,SP	;result => tmp3:tmp2
			;Byte 1/Byte 0 ( prev remainder in D, base in X)
			TFR	D, Y 			;remainder => Y
			LDD	PRINT_LUDBL2_RTMP1,SP 	;tmp1:tmp0 => D
			EDIV				;Y:D / X => Y,  Y:D % X => D 
			STY	PRINT_LUDBL2_RTMP1,SP	;result => tmp1:tmp0
			;Print remainder (prev, remainder in D)
			LDY	#PRINT_SYMTAB
			LDAB	B,Y
			SCI_TX				;print character (SSTACK: 8 bytes)
			;Repeat until the reverse value is $1
			LDD	PRINT_LUDBL2_RTMP5,SP
			BNE	PRINT_LUDBL_6
			LDD	PRINT_LUDBL2_RTMP3,SP
			BNE	PRINT_LUDBL_6
			LDD	PRINT_LUDBL2_RTMP1,SP
			CPD	#$0001
			BNE	PRINT_LUDBL_6
			;Deallocate reverse variable
			SSTACK_DEALLOC,6
PRINT_LUDBL3_CNT	EQU	$0
PRINT_LUDBL3_BASE	EQU	$1
			;Print padding
			LDAA	PRINT_LUDBL3_CNT,SP
			SSTACK_JOBSR	PRINT_SPCS
			;Deallocate local memory and restore registers
			SSTACK_DEALLOC,2		;deallocate local variables
			SSTACK_PULDXY			;RESTORE index X, index Y, and accu D
			SSTACK_RTS

;#Print a right aligned unsigned double value
; args: Y:X: unsigned double value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
PRINT_RUDBL		EQU	*
PRINT_RUDBL_A		EQU	$0
PRINT_RUDBL_B		EQU	$1
PRINT_RUDBL_X		EQU	$2
PRINT_RUDBL_Y		EQU	$3
			;Save registers (value in Y:X, min. length in A, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Print padding (value in Y:X, min. length in A, base in B)
PRINT_RUDBL_1		SSTACK_JOBSR	PRINT_UDBLCNT 	;determine the number of digits (SSTACK: 13 bytes)
			NEGA
			ADDA	PRINT_RUDBL_A,SP	;calculate the size of the padding
			BCC	PRINT_RUDBL_2	
			SSTACK_JOBSR	PRINT_SPCS
			;Print left aligned unsigned double value (value in Y:X, base in B)
PRINT_RUDBL_2		CLRA				;set output width to zero
			;LDY	PRINT_RUDBL_Y,SP	;restore Y
			JOB	PRINT_RUDBL_3
PRINT_RUDBL_3		EQU	PRINT_LUDBL_1

;#Print a right aligned signed double value
; args: Y:X: signed double value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
PRINT_RSDBL		EQU	*
PRINT_RSDBL_A		EQU	$0
PRINT_RSDBL_B		EQU	$1
PRINT_RSDBL_X		EQU	$2
PRINT_RSDBL_Y		EQU	$3
			;Save registers (value in Y:X, min. length in A, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Print padding (value in Y:X, min. length in A, base in B)
PRINT_RSDBL_1		SSTACK_JOBSR	PRINT_SDBLCNT 	;determine the number of digits
			NEGA
			ADDA	PRINT_RSDBL_A,SP	;calculate the size of the padding
			BCC	PRINT_RSDBL_2	
			SSTACK_JOBSR	PRINT_SPCS
			;Print left aligned unsigned double value (value in Y:X, base in B)
PRINT_RSDBL_2		CLRA				;set output width to zero
			JOB	PRINT_RSDBL_3
PRINT_RSDBL_3		EQU	PRINT_LSDBL_1

;#Print a right aligned unsigned integer value
; args:   X: unsigned integer value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
PRINT_RUINT		EQU	*
PRINT_RUINT_A		EQU	$0
PRINT_RUINT_B		EQU	$1
PRINT_RUINT_X		EQU	$2
PRINT_RUINT_Y		EQU	$3
			;Save registers (value in Y:X, min. length in A, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Print padding (value in Y:X, min. length in A, base in B)
PRINT_RUINT_1		SSTACK_JOBSR	PRINT_UINTCNT 	;determine the number of digits (SSTACK: 13 bytes)
			NEGA
			ADDA	PRINT_RUINT_A,SP	;calculate the size of the padding
			BCC	PRINT_RUINT_2	
			SSTACK_JOBSR	PRINT_SPCS
			;Print left aligned unsigned double value (value in Y:X, base in B)
PRINT_RUINT_2		CLRA				;set output width to zero
			JOB	PRINT_RUINT_3
PRINT_RUINT_3		EQU	PRINT_LUINT_1

;#Print a right aligned signed integer value
; args:   X: signed integer value
;         A: minimum lenght of the output
; 	  B: base   (2<=base<=16)
; result: none
; SSTACK: 24 bytes
;         X, Y and D are preserved
PRINT_RSINT		EQU	*
PRINT_RSINT_A		EQU	$0
PRINT_RSINT_B		EQU	$1
PRINT_RSINT_X		EQU	$2
PRINT_RSINT_Y		EQU	$3
			;Save registers (value in Y:X, min. length in A, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Print padding (value in Y:X, min. length in A, base in B)
PRINT_RSINT_1		SSTACK_JOBSR	PRINT_SINTCNT 	;determine the number of digits (SSTACK: 13 bytes)
			NEGA
			ADDA	PRINT_RSINT_A,SP	;calculate the size of the padding
			BCC	PRINT_RSINT_2	
			SSTACK_JOBSR	PRINT_SPCS
			;Print left aligned signed double value (value in Y:X, base in B)
PRINT_RSINT_2		CLRA				;set output width to zero
			JOB	PRINT_RSINT_3
PRINT_RSINT_3		EQU	PRINT_LSINT_1

;#Count digits of an unsigned double value
; args:   Y:X: unsigned double value
; 	  B: base   (2<=base<=16)
; result: A: number of digits
; SSTACK: 13 bytes
;         X, Y and B are preserved
PRINT_UDBLCNT		EQU	*
PRINT_UDBLCNT_TMP3	EQU	$0
PRINT_UDBLCNT_TMP2	EQU	$1
PRINT_UDBLCNT_TMP1	EQU	$2
PRINT_UDBLCNT_TMP0	EQU	$3
PRINT_UDBLCNT_BASE	EQU	$4
PRINT_UDBLCNT_CNT	EQU	$5
PRINT_UDBLCNT_B		EQU	$6
PRINT_UDBLCNT_X		EQU	$7
PRINT_UDBLCNT_Y		EQU	$9	
			;Save registers (value in Y:X, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Set count offset to zero (value in Y:X, base in B) 
PRINT_UDBLCNT_1		CLRA
			;Fix base (value in Y:X, base in B, count offset in A)
PRINT_UDBLCNT_2		SSTACK_JOBSR	PRINT_FIX_BASE	;adjust base value (SSTACK: 2 bytes)
			;Allocate and initialize local variables (value in Y:X, base in B, count offset in A)
			SSTACK_ALLOC,5			;allocate local variables
			STAA	PRINT_UDBLCNT_CNT,SP
			STAB	PRINT_UDBLCNT_BASE,SP
			STY	PRINT_UDBLCNT_TMP3,SP
			STX	PRINT_UDBLCNT_TMP1,SP
			;Division loop (value in Y:X, base in B)		
PRINT_UDBLCNT_3		LDAA	PRINT_UDBLCNT_CNT,SP 	;increment and saturate the counter
			ADDA	#$01
			SBCA	#$00
			STAA	PRINT_UDBLCNT_CNT,SP
			;Byte 3/Byte 2
			LDX	PRINT_UDBLCNT_TMP3,SP	;tmp3:tmp2 => X
			BEQ	PRINT_UDBLCNT_4		;division step can be skipped
			CLRA				;base => D
			LDAB	PRINT_UDBLCNT_BASE,SP
			EXG	X, D
			IDIV				;D / X => X,  D % X => D 
			STX	PRINT_UDBLCNT_TMP3,SP	;result => tmp3:tmp2
			;Byte 1/Byte 0 (prev remainder in D)
			TFR	D, X			;remainder => X
PRINT_UDBLCNT_4		CLRA				;base => D
			LDAB	PRINT_UDBLCNT_BASE,SP
			LDY	PRINT_UDBLCNT_TMP1,SP	;tmp1:tmp0 => Y
			EXG	X, Y
			EXG	X, D
			EDIV				;Y:D / X => Y,  Y:D % X => D
			STY	PRINT_UDBLCNT_TMP1,SP	;result => tmp1:tmp0
			BNE	PRINT_UDBLCNT_3		;result is not zero, yet
			LDX	PRINT_UDBLCNT_TMP3,SP	;tmp3:tmp2 => X
			BNE	PRINT_UDBLCNT_3		;result is not zero, yet
			;Deallocate local memory and restore registers
			SSTACK_DEALLOC,5		;deallocate local variables
			SSTACK_PULDXY			;RESTORE index X, index Y, and accu D
			SSTACK_RTS

;#Count digits of a signed double value
; args:   Y:X: signed double value
; 	  B: base   (2<=base<=16)
; result: A: number of digits
; SSTACK: 13 bytes
;         X, Y and B are preserved
PRINT_SDBLCNT		EQU	*
			;Save registers (value in Y:X, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D			
			;Check if number is negative (value in Y:X, base in B)
PRINT_SDBLCNT_1		CPY	#$0000
			BPL	PRINT_SDBLCNT_2		;number is positive
			;Set char count to 1 (value in Y:X, base in B)
			LDAA	#$01
			;Calculate 2's complement (value in Y:X, char count in A, base in B)
			EXG	D, Y
			COMA
			COMB
			EXG	D, X
			COMA
			COMB
			ADDD	#1
			EXG	D, X
			ADCB	#0
			ADCA	#0
			EXG	D, Y
			JOB	PRINT_SDBLCNT_3	;jump to UDBLCNT division loop
PRINT_SDBLCNT_2		EQU	PRINT_UDBLCNT_1
PRINT_SDBLCNT_3		EQU	PRINT_UDBLCNT_2
	
;#Count digits of an unsigned integer value
; args:   X: unsigned integer value
; 	  B: base   (2<=base<=16)
; result: A: number of digits
; SSTACK: 13 bytes
;         X, Y and B are preserved
PRINT_UINTCNT		EQU	*
			;Save registers (value in X, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Count digits of double value (value in X, base in B)
PRINT_UINTCNT_1		LDY	#$0000
			JOB	PRINT_UINTCNT_2
PRINT_UINTCNT_2		EQU	PRINT_UDBLCNT_1

;#Count digits of a signed double value
; args:   X: signed double value
; 	  B: base   (2<=base<=16)
; result: A: number of digits
; SSTACK: 13 bytes
;         X, Y and B are preserved
PRINT_SINTCNT		EQU	*
			;Save registers (value in X, base in B)
			SSTACK_PSHYXD			;save index X, index Y, and accu D
			;Check if value is plsitive (value in X, base in B)
PRINT_SINTCNT_1		CPX	#$0000
			BPL	PRINT_SINTCNT_3
			;Value is negative (value in X, base in B)
			LDY	#$FFFF 			;sign extend value
			JOB	PRINT_SINTCNT_2
PRINT_SINTCNT_2		EQU	PRINT_SDBLCNT_1
PRINT_SINTCNT_3		EQU	PRINT_UINTCNT_1
	
;#Print spaces
; args:   A: character count
; result: none
; SSTACK: 12 bytes
;         X, Y and D are preserved
PRINT_SPCS		EQU	*
			;Save registers (char count in A)
			SSTACK_PSHD 			;save  accu D
			;Print loop (char count in A)
			TBEQ	A, PRINT_SPCS_2 	;don't print anything if A=0 ;'
			LDAB	#PRINT_SYM_SPACE
PRINT_SPCS_1		SCI_TX				;print character (SSTACK: 8 bytes)
			DBNE	A, PRINT_SPCS_1
			;Restore registers
PRINT_SPCS_2		SSTACK_PULD 			;restore accu D
			SSTACK_RTS

;#Count characters of a string
; args:   X: start of the string
; result: A: character count (saturated at 255)
; SSTACK: 2 bytes
;         X, Y and B are preserved
PRINT_STRCNT		EQU	*
			;Count loop (string pointer in X)
			CLRA				;clear counter
PRINT_STRCNT_1		TST	A,X			;check for string termination
			BMI	PRINT_STRCNT_3		;last char
			INCA				;increment count
			BNE	PRINT_STRCNT_1		;no overflow 
PRINT_STRCNT_2		COMA				;overflow -> keep value at maximum
			SSTACK_RTS
PRINT_STRCNT_3		INCA				;count last char
			BEQ	PRINT_STRCNT_2		;overflow
			SSTACK_RTS

;#Print a right aligned string to the SCI
; args:   X: start of the string
;         A: minimum lenght of the output
; result: none
; SSTACK: 18 bytes
;         X, Y and D are preserved
PRINT_RSTR		EQU	*
			;Save registers (string pointer in X, min. width in A)
			SSTACK_PSHXD 			;save index Y and accu D
			;Count characters (string pointer in X, min. width in A)
PRINT_RSTR_1		TAB
			SSTACK_JOBSR	PRINT_STRCNT 	;char count => A  (SSTACK: 2 bytes)
			EXG	A, B
			SBA				;output length - chars => A
			BCS	PRINT_RSTR_2
			SSTACK_JOBSR	PRINT_SPCS 	;print padding (SSTACK: 12 bytes)
			;Print left aligned string (string pointer in X)	
PRINT_RSTR_2		CLRA						
			JOB	PRINT_RSTR_3
PRINT_RSTR_3		EQU	PRINT_LSTR_1
		
;#Print a left aligned string to the SCI
; args:   X: start of the string
;         A: minimum lenght of the output
; result: none
; SSTACK: 14 bytes
;         X, Y and D are preserved
PRINT_LSTR		EQU	*
			;Save registers (string pointer in X, min. width in A)
			SSTACK_PSHXD 			;save index Y and accu D	
			;Print and count characters (string pointer in X, min. width in A)
PRINT_LSTR_1		LDAB	1,X+ 			;get next ASCII character
			BMI	PRINT_LSTR_2		;last character
			SCI_TX				;print character (SSTACK: 8 bytes)
			SUBA	#$01			;decrement length counter
			ADCA	#$00
			JOB	PRINT_LSTR_1	
			;Print last character (last char in B, pad witdth in A)
PRINT_LSTR_2		ANDB	#$7F 			;remove termination bit
			SCI_TX				;print character (SSTACK: 8 bytes)
			SUBA	#$01			;decrement length counter
			BLS	PRINT_LSTR_4		;length counter is zero or negative						
			;Print padding (pad witdth in A)
			LDAB	#PRINT_SYM_SPACE
PRINT_LSTR_3		SCI_TX				;print character (SSTACK: 8 bytes)
			DBNE	A, PRINT_LSTR_3			
			;Restore registers
PRINT_LSTR_4		SSTACK_PULDX 			;restore index Y and accu D
			SSTACK_RTS

;#Print a string to the SCI (without alignment)
; args:   X: start of the string
; result: none
; SSTACK: 14 bytes
;         X, Y and D are preserved
PRINT_STR		EQU	*
			;Save registers (string pointer in X)
			SSTACK_PSHXD 			;save index Y and accu D
			;print left alignend string without padding (string pointer in X)
PRINT_STR_1		CLRA				;no min. string length
			JOB	PRINT_STR_2		
PRINT_STR_2		EQU	PRINT_LSTR_1
	
;#Print a line break to the SCI
; args:   none
; result: none
; SSTACK: 11 bytes
;         X, Y and D are preserved
PRINT_LINE_BREAK	EQU	*
			;Save registers
			SSTACK_PSHB 			;save accu B	
			;Print CR symbol
			LDAB	#PRINT_SYM_CR
			SCI_TX				;print character (SSTACK: 8 bytes)
			;Print LF symbol
			LDAB	#PRINT_SYM_LF
			SCI_TX				;print character (SSTACK: 8 bytes)
			;Save registers
			SSTACK_PULB 			;restore accu B
			SSTACK_RTS

;#Print a space character to the SCI
; args:   none
; result: none
; SSTACK: 11 bytes
;         X, Y and D are preserved
PRINT_SPC		EQU	*
			;Save registers
			SSTACK_PSHB 			;save accu B	
			;Print space character
			LDAB	#" "
			SCI_TX				;print character (SSTACK: 8 bytes)
			;Save registers
			SSTACK_PULB 			;restore accu B
			SSTACK_RTS

;#Send a beep to the SCI
; args:   none
; result: none
; SSTACK: 11 bytes
;         X, Y and D are preserved
PRINT_BEEP		EQU	*
			;Save registers
			SSTACK_PSHB 			;save accu B	
			;Print beep symbol
			LDAB	#PRINT_SYM_BEEP
			SCI_TX				;print character (SSTACK: 8 bytes)
			;Save registers
			SSTACK_PULB 			;restore accu B
			SSTACK_RTS

;#Print an 8-bit value to the SCI
; args:   B: 8-bit value
; result: none
; SSTACK: 14 bytes
;         X, Y and D are preserved
PRINT_BYTE		EQU	*
			;Save registers (value in B)
			SSTACK_PSHYD			;save Y and D (SSTACK: 4 bytes)
			;Print most significant digit (value in B)
			LDY	#PRINT_SYMTAB		
			TBA				;save number in A
			LSRB				;shift upper nibble to the right
			LSRB	
			LSRB					
			LSRB	
			LDAB	B,Y 			;look up ASCII value
			SCI_TX				;print character (SSTACK: 8 bytes)
			;Print least significant digit (value in A)
			ANDA	#$0F
			LDAB	A,Y 			;look up ASCII value
			SCI_TX				;print character (SSTACK: 8 bytes)
			;Restore registers
			SSTACK_PULDY			;restore Y and D
			SSTACK_RTS

;#Print a 16-bit value to the SCI
; args:   D: 16-bit value
; result: none
; SSTACK: 16 bytes
;         X, Y and D are preserved
PRINT_WORD		EQU	*
			;Print most significant digit (value in D)
			EXG	A, B
			SSTACK_JOBSR	PRINT_BYTE
			;Print least significant digit (swapped value in D)
			EXG	A, B
			SSTACK_JOBSR	PRINT_BYTE
			;Return
			SSTACK_RTS

;#Print a unsigned integer value to the SCI
; args:   B: bit field
; result: none
; SSTACK: 14 bytes
;         X, Y and D are preserved
;PRINT_BITS		EQU	*
;			;Save registers (value in B)
;			SSTACK_PSHYD			;save Y and D (SSTACK: 4 bytes)
;			;Bit loop (value in B)
;			LDY	#8	     		;loop counter
;			TBA				;byte -> A
;PRINT_BITS_1		LDAB	#"X"			;"TRUE" symbol
;			LSLA				;check MSB
;			BCS	PRINT_BITS_2		;MSB is set
;			LDAB	#"."			;"FALSE" symbol
;PRINT_BITS_2		SCI_TX				;print character (SSTACK: 8 bytes)
;			DBNE	Y, PRINT_BITS_1
;			;Restore registers
;			SSTACK_PULDY			;restore Y and D
;			SSTACK_RTS
	
PRINT_CODE_END		EQU	*

;###############################################################################
;# Tables                                                                      #
;###############################################################################
			ORG	PRINT_TABS_START
PRINT_SYMTAB		DB	"0"
			DB	"1"
			DB	"2"
			DB	"3"
			DB	"4"
			DB	"5"
			DB	"6"
			DB	"7"
			DB	"8"
			DB	"9"
			DB	"A"
			DB	"B"
			DB	"C"
			DB	"D"
			DB	"E"
			DB	"F"
			DB	"G"
			DB	"H"
			DB	"I"
			DB	"J"
			DB	"K"
			DB	"L"
			DB	"M"
			DB	"N"
			DB	"O"
			DB	"P"
			DB	"Q"
			DB	"R"
			DB	"S"
			DB	"T"
			DB	"U"
			DB	"V"
			DB	"W"
			DB	"X"
			DB	"Y"
			DB	"Z"
PRINT_SYMTAB_END	DB	*

PRINT_TABS_END		EQU	*