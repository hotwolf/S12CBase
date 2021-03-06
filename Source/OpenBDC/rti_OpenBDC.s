#ifndef	RTI_COMPILED
#define	RTI_COMPILED	
;###############################################################################
;# S12CBase - RTI - Real-Time Interrupt Handler (OpenBDC)                      #
;###############################################################################
;#    Copyright 2010-2012 Dirk Heisswolf                                       #
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
;#    The module handles the real-time interrupt.                              #
;###############################################################################
;# Version History:                                                            #
;#    April 4, 2010                                                            #
;#      - Initial release                                                      #
;#    July 9, 2012                                                             #
;#      - Added support for linear PC                                          #
;###############################################################################
;# Required Modules:                                                           #
;#    CLOCK  - Clock driver                                                    #
;#                                                                             #
;# Requirements to Software Using this Module:                                 #
;#    - none                                                                   #
;###############################################################################

;###############################################################################
;# Constants                                                                   #
;###############################################################################
RTI_CFG			EQU	$6F 	;RTI occurs every .512s

;###############################################################################
;# Variables                                                                   #
;###############################################################################
#ifdef RTI_VARS_START_LIN
			ORG 	RTI_VARS_START, RTI_VARS_START_LIN
#else
			ORG 	RTI_VARS_START
RTI_VARS_START_LIN	EQU	@			
#endif	

RTI_VARS_END		EQU	*
RTI_VARS_END_LIN	EQU	@

;###############################################################################
;# Macros                                                                      #
;###############################################################################
;#Initialization
#macro	RTI_INIT, 0
			;RTI_DISABLE
#emac

;#Enable RTI
#macro	RTI_ENABLE, 0
			BRSET	RTICTL, #RTI_CFG, LABEL
			MOVB	#RTI_CFG, RTICTL
			BSET	CRGINT, #RTIE
LABEL			EQU	*
#emac

;#Disable RTI
#macro	RTI_DISABLE, 0
			CLR	RTICTL
			BCLR	CRGINT, #RTIE
#emac

;#Clear interrupt flag
#macro	RTI_CLRIF, 0
			MOVB	#RTIF, CRGFLG
#emac
	
;###############################################################################
;# Code                                                                        #
;###############################################################################
#ifdef RTI_CODE_START_LIN
			ORG 	RTI_CODE_START, RTI_CODE_START_LIN
#else
			ORG 	RTI_CODE_START
RTI_CODE_START_LIN	EQU	@			
#endif	
	
RTI_CODE_END		EQU	*	
RTI_CODE_END_LIN	EQU	@	

;###############################################################################
;# Tables                                                                      #
;###############################################################################
#ifdef RTI_TABS_START_LIN
			ORG 	RTI_TABS_START, RTI_TABS_START_LIN
#else
			ORG 	RTI_TABS_START
RTI_VARS_START_LIN	EQU	@			
#endif	

RTI_TABS_END		EQU	*	
RTI_TABS_END_LIN	EQU	@	
#endif	
