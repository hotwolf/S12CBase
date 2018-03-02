#ifndef NVM_COMPILED
#define	NVM_COMPILED	
;###############################################################################
;# AriCalculator - MassErase - NVM Driver                                      #
;###############################################################################
;#    Copyright 2010-2018 Dirk Heisswolf                                       #
;#    This file is part of the S12CBase framework for NXP's S12C MCU family.   #
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
;#    This code sequence is to be executed from RAM to erase the.              #
;#    AriCalculator's flash memory.                                            #
;#                                                                             #
;###############################################################################
;# Version History:                                                            #
;#    February 29, 2018                                                        #
;#      - Initial release                                                      #
;###############################################################################

;###############################################################################
;# Configuration                                                               #
;###############################################################################
;Prescaler value
;--------------- 
#ifndef NVM_FDIV_VAL
NVM_FDIV_VAL		EQU	(CLOCK_BUS_FREQ/1000000)-1 ;FTMRG clock divider
#endif
	
;###############################################################################
;# Constants                                                                   #
;###############################################################################
;#Sector size
NVM_SECTOR_SIZE		EQU	512			;sector size  [bytes]
NVM_PHRASE_SIZE		EQU	8			;phrase size  [bytes]
NVM_ADDR_SIZE		EQU	4			;address size [bytes]

;#NVM commands 
NVM_CMD_PROG		EQU	$06			;program P-flash command
NVM_CMD_MASSERASE	EQU	$08			;erase all flash blocks
NVM_CMD_ERASE		EQU	$0A			;erase P-flash sector command
NVM_CMD_VERIFY		EQU	$03			;erase verify P-flash section command
	
;###############################################################################
;# Variables                                                                   #
;###############################################################################
#ifdef NVM_VARS_START_LIN
			ORG 	NVM_VARS_START, NVM_VARS_START_LIN
#else
			ORG 	NVM_VARS_START
NVM_VARS_START_LIN	EQU	@			
#endif	
	
NVM_VARS_END		EQU	*
NVM_VARS_END_LIN	EQU	@
		
;###############################################################################
;# Macros                                                                      #
;###############################################################################
;#Initialization
#macro	NVM_INIT, 0
			;Initialize the NVM wrapper
			MOVB	#(FDIVLCK|NVM_FDIV_VAL), FCLKDIV;set clock divider
			MOVB	#DFDIE,FERCNFG			;detect ECC double faults
#emac

;#Run a "Erase All Blocks" command
; args:   none
; result: none
; SSTACK: none
;         All registers are preserved
#macro	NVM_DO_MASSERASE, 0
			CLR	FCCOBIX				;0 -> FCCOBIX
			MOVB	#NVM_CMD_MASSERASE, FCCOBHI	;set masse erase command
			MOVB	#CCIF, FSTAT			;launch command
			BRCLR	FSTAT,#CCIF,*			;wait for command to complete	
#emac
	
;###############################################################################
;# Code                                                                        #
;###############################################################################
#ifdef NVM_CODE_START_LIN
			ORG 	NVM_CODE_START, NVM_CODE_START_LIN
#else
			ORG 	NVM_CODE_START
NVM_CODE_START_LIN	EQU	@	
#endif
	
NVM_CODE_END		EQU	*	
NVM_CODE_END_LIN	EQU	@	
	
;###############################################################################
;# Tables                                                                      #
;###############################################################################
#ifdef NVM_TABS_START_LIN
			ORG 	NVM_TABS_START, NVM_TABS_START_LIN
#else
			ORG 	NVM_TABS_START
NVM_TABS_START_LIN	EQU	@	
#endif

NVM_TABS_END		EQU	*
NVM_TABS_END_LIN	EQU	@
#endif
