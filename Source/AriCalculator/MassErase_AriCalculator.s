;###############################################################################
;# AriCalculator - MassErase Sequence                                          #
;###############################################################################
;#    Copyright 2010-2018 Dirk Heisswolf                                       #
;#    This file is part of the AriCalculator firmware.                         #
;#                                                                             #
;#    AriCalculator is free software: you can redistribute it and/or modify    #
;#    it under the terms of the GNU General Public License as published by     #
;#    the Free Software Foundation, either version 3 of the License, or        #
;#    (at your option) any later version.                                      #
;#                                                                             #
;#    AriCalculator is distributed in the hope that it will be useful,         #
;#    but WITHOUT ANY WARRANTY; without even the implied warranty of           #
;#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            #
;#    GNU General Public License for more details.                             #
;#                                                                             #
;#    You should have received a copy of the GNU General Public License        #
;#    along with AriCalculator.  If not, see <http://www.gnu.org/licenses/>.   #
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

;###############################################################################
;# Module configuration                                                        #
;###############################################################################
;#CLOCK
CLOCK_CPMU		EQU	1		;CPMU
CLOCK_IRC		EQU	1		;use IRC
CLOCK_OSC_FREQ		EQU	 1000000	; 1 MHz IRC frequency
CLOCK_BUS_FREQ		EQU	25000000	;25 MHz bus frequency
CLOCK_REF_FREQ		EQU	 1000000	; 1 MHz reference clock frequency
CLOCK_VCOFRQ		EQU	$1		;10 MHz VCO frequency
CLOCK_REFFRQ		EQU	$0		; 1 MHz reference clock frequency
		
;###############################################################################
;# Constants                                                                   #
;###############################################################################

;###############################################################################
;# Memory map                                                                  #
;###############################################################################
;	                       RAM_COMPILE:
;	                       ============
;	    MMAP_REG_START -> +----------+----------+ $0000
;	           ($0000)    |   Register Space    |
;	      MMAP_REG_END -> +----------+----------+ $0400
;	           ($0400)    :       unused        :
;	    MMAP_RAM_START,-> +----------+----------+ $4000
;	     START_OF_CODE    |                     |
;	                      |    Program Space    |
;	                      |                     |
;	                      +----------+----------+
 
			;Code
CODE_START		EQU	MMAP_RAM_START
CODE_START_LIN		EQU	MMAP_RAM_START_LIN

				;Variables 
			ORG	CODE_END, CODE_END_LIN
VARS_START		EQU	*
VARS_START_LIN		EQU	@

			;Tables
			ORG	VARS_END, VARS_END_LIN
TABS_START		EQU	*	
TABS_START_LIN		EQU	@
		
;###############################################################################
;# Initialization                                                              #
;###############################################################################
#macro	INIT, 0
			MMAP_INIT 			;configure memory map
			CLOCK_INIT			;configure clocks
			NVM_INIT			;configure NVM
			BRCLR	CPMUCLKS, #PLLSEL, * 	;wait for PLL
#emac
	
;###############################################################################
;# Global variable space                                                       #
;###############################################################################
			ORG	VARS_START, VARS_START_LIN

MMAP_VARS_START		EQU	*	 
MMAP_VARS_START_LIN	EQU	@
			ORG	MMAP_VARS_END, MMAP_VARS_END_LIN
			
CLOCK_VARS_START	EQU	*
CLOCK_VARS_START_LIN	EQU	@
			ORG	CLOCK_VARS_END, CLOCK_VARS_END_LIN

NVM_VARS_START		EQU	*
NVM_VARS_START_LIN	EQU	@
			ORG	NVM_VARS_END, NVM_VARS_END_LIN
			
VARS_END		EQU	*
VARS_END_LIN		EQU	@
	
;###############################################################################
;# Code space                                                                  #
;###############################################################################
			ORG	CODE_START, CODE_START_LIN

START_OF_CODE		EQU	*

			;Initialization
			INIT					;initialize bootloader
			;Perform mass erase
			NVM_DO_MASSERASE 			;do mass erase
			;Done 
			LDAA	FSTAT 				;FSTAT -> A
			BGND					;return to BDM active code
			JOB	*				;catch program execution

MMAP_CODE_START		EQU	*	 
MMAP_CODE_START_LIN	EQU	@
			ORG	MMAP_CODE_END, MMAP_CODE_END_LIN

CLOCK_CODE_START	EQU	*
CLOCK_CODE_START_LIN	EQU	@
			ORG	CLOCK_CODE_END, CLOCK_CODE_END_LIN
			
NVM_CODE_START		EQU	*
NVM_CODE_START_LIN	EQU	@
			ORG	NVM_CODE_END, NVM_CODE_END_LIN
	
CODE_END		EQU	*
CODE_END_LIN		EQU	@
	
;###############################################################################
;# Table space                                                                 #
;###############################################################################
			ORG	TABS_START, TABS_START_LIN
	
MMAP_TABS_START		EQU	*	 
MMAP_TABS_START_LIN	EQU	@
			ORG	MMAP_TABS_END, MMAP_TABS_END_LIN
			
CLOCK_TABS_START	EQU	*
CLOCK_TABS_START_LIN	EQU	@
			ORG	CLOCK_TABS_END, CLOCK_TABS_END_LIN
			
NVM_TABS_START		EQU	*
NVM_TABS_START_LIN	EQU	@
			ORG	NVM_TABS_END, NVM_TABS_END_LIN
						
TABS_END		EQU	*
TABS_END_LIN		EQU	@
	
;###############################################################################
;# Includes                                                                    #
;###############################################################################
;# S12CBase
#include ./regdef_AriCalculator.s	;Register definitions
#include ./mmap_AriCalculator.s		;Memory map
#include ../All/clock.s			;TIM driver
					
;# MassErase
#include ./nvm_MassErase.s		;NVM driver
