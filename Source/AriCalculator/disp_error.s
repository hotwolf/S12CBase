#ifndef	DISP_ERROR
#define	DISP_ERROR
;###############################################################################
;# AriCalculator - Image: Error.data (single frame)                            #
;###############################################################################
;#    Copyright 2012 - 2018 Dirk Heisswolf                                     #
;#    This file is part of the AriCalculator framework for NXP's S12(X) MCU    #
;#    families.                                                                #
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
;#    This file contains the two macros:                                       #
;#       DISP_SPLASH_TAB:                                                      #
;#           This macro allocates a table of raw image data.                   #
;#                                                                             #
;#       DISP_SPLASH_STREAM:                                                   #
;#           This macro allocates a compressed stream of image data and        #
;#           control commands, which can be directly driven to the display     #
;#           driver.                                                           #
;###############################################################################
;# Generated on Thu, Mar 01 2018                                               #
;###############################################################################

;+--------------------------------------------------------------------------------------------------------------------------------+
;|                                                                                                                                |
;|                                                                                                                                |
;|          ###                                                                                                                   |
;|        ######                                                                                                                  |
;|      ########                                                                                                                  |
;|    ##########          #########             ###              ###        #########                                             |
;|  ############          #########             ###              ###        #########                                             |
;| #############          #########            ####              ###        #########                                             |
;|  ###########           ###        #####   ########  #####     ###        ###      ### ## ### ##    ####    ### ##              |
;|  ###########          ###        ######## ######## ########  ###        ###       ###### ######  #######   ######              |
;|  ###########          ########  ###   ###   ###   ###   ###  ###        ########  ###### ######  ###  ###  ######              |
;|  ###########          ########        ###   ###         ###  ###        ########  ####   ####   ###   ###  ####                |
;|  ###########          ########    #######  ####     #######  ###        ########  ###    ###    ###   ###  ###                 |
;|  ###########          ###       #########  ###    #########  ###        ###       ###    ###    ###   ###  ###                 |
;|  ###########          ###      ####  ###   ###   ####  ###   ###        ###      ####   ####    ###   ### ####                 |
;|  ###########         ###       ###   ###   ###   ###   ###  ###        ######### ###    ###     ###  ###  ###                  |
;|  ###########         ###       #########   ##### #########  ###        ######### ###    ###      ######   ###                  |
;|  ###########         ###        #### ###    ####  #### ###  ###        ######### ###    ###       ####    ###                  |
;|  ###########                                                                                                                   |
;|   #########                                                                                                                    |
;|   #########                                                                                                                    |
;|   #########                                                                                                                    |
;|   #########                                                                                                                    |
;|   #########                                                                                                                    |
;|   #########                                                                                                                    |
;|   #########                                                                                                                    |
;|   #########                                                                                                                    |
;|   #########                                                                                                                    |
;|   #########                                                                                                                    |
;|   #########                                                                                                                    |
;|    ########                                                                                                                    |
;|    #######                                                                                                                     |
;|    #######                                                                                                                     |
;|    #######                                                                                                                     |
;|    #######                                                                                                                     |
;|    #######                                                                                                                     |
;|    #######                                                                                                                     |
;|    #######                                                                                                                     |
;|    #######                                                                                                                     |
;|    #######                                                                                                                     |
;|    #######                                                                                                                     |
;|     ######                                                                                                                     |
;|     #####                                                                                                                      |
;|     #####                                                                                                                      |
;|     ###                                                                                                                        |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|      #####                                                                                                                     |
;|    #########                                                                                                                   |
;|   ###########                                                                                                                  |
;|  #############                                                                                                                 |
;| ##############                                                                                                                 |
;| ##############                                                                                                                 |
;| ##############                                                                                                                 |
;| ##############                                                                                                                 |
;| #############                                                                                                                  |
;|  ############                                                                                                                  |
;|   #########                                                                                                                    |
;|    ######                                                                                                                      |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;+--------------------------------------------------------------------------------------------------------------------------------+

#macro DISP_ERROR_TAB, 0

;#Frame 0:
;#----------------------------------------------------------------------
;#Page 0:
		DB  $00  $80  $C0  $C0  $E0  $E0  $F0  $F0
		DB  $F8  $F8  $FC  $FC  $FC  $F8  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $E0  $E0  $E0  $E0  $E0  $E0  $E0  $E0
		DB  $E0  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $80  $E0  $E0
		DB  $E0  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $E0
		DB  $E0  $E0  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $E0  $E0  $E0  $E0  $E0  $E0
		DB  $E0  $E0  $E0  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
;#Page 1:
		DB  $00  $00  $FF  $FF  $FF  $FF  $FF  $FF
		DB  $FF  $FF  $FF  $FF  $FF  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $80  $FE
		DB  $FF  $7F  $1D  $1C  $1C  $1C  $1C  $00
		DB  $C0  $E4  $E6  $77  $33  $33  $F3  $FF
		DB  $FE  $3E  $00  $03  $F3  $FF  $FF  $1F
		DB  $03  $03  $C3  $E4  $E6  $77  $33  $33
		DB  $F3  $FF  $FE  $3E  $00  $80  $FE  $FF
		DB  $7F  $01  $00  $00  $00  $00  $00  $00
		DB  $80  $FE  $FF  $FF  $9D  $9C  $9C  $9C
		DB  $9C  $00  $C0  $FF  $FF  $7F  $0E  $07
		DB  $07  $C0  $FF  $FF  $7F  $0E  $07  $07
		DB  $00  $F8  $FE  $FE  $07  $03  $83  $FF
		DB  $FE  $7C  $00  $C0  $FF  $FF  $7F  $0E
		DB  $07  $07  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
;#Page 2:
		DB  $00  $00  $07  $FF  $FF  $FF  $FF  $FF
		DB  $FF  $FF  $FF  $FF  $07  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $03  $03
		DB  $03  $00  $00  $00  $00  $00  $00  $00
		DB  $01  $03  $03  $03  $03  $01  $03  $03
		DB  $03  $00  $00  $00  $01  $03  $03  $03
		DB  $03  $00  $01  $03  $03  $03  $03  $01
		DB  $03  $03  $03  $00  $00  $03  $03  $03
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $03  $03  $03  $03  $03  $03  $03  $03
		DB  $03  $00  $03  $03  $03  $00  $00  $00
		DB  $00  $03  $03  $03  $00  $00  $00  $00
		DB  $00  $00  $01  $03  $03  $03  $03  $01
		DB  $00  $00  $00  $03  $03  $03  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
;#Page 3:
		DB  $00  $00  $00  $3F  $FF  $FF  $FF  $FF
		DB  $FF  $FF  $FF  $7F  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
;#Page 4:
		DB  $00  $00  $00  $00  $FF  $FF  $FF  $FF
		DB  $FF  $FF  $FF  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
;#Page 5:
		DB  $00  $00  $00  $00  $01  $1F  $1F  $1F
		DB  $0F  $0F  $03  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
;#Page 6:
		DB  $00  $E0  $F0  $F8  $FC  $FC  $FE  $FE
		DB  $FE  $FE  $FE  $FC  $FC  $F8  $F0  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
;#Page 7:
		DB  $00  $03  $07  $0F  $1F  $1F  $1F  $1F
		DB  $1F  $1F  $0F  $0F  $07  $07  $01  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00

#emac
;Size = 1024 bytes

#macro DISP_ERROR_STREAM, 0

;#Frame 0:
;#----------------------------------------------------------------------
;#Page 0:
		DB  $B0 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  $00 $80 $C0 $C0 $E0 $E0 $F0 $F0
		DB  $F8 $F8 $FC $FC $FC $F8
		DB  DISP_ESC_START $09 $00          ;repeat 10 times
		DB  DISP_ESC_START $08 $E0          ;repeat 9 times
		DB  DISP_ESC_START $0B $00          ;repeat 12 times
		DB  $80 $E0 $E0 $E0
		DB  DISP_ESC_START $0D $00          ;repeat 14 times
		DB  $E0 $E0 $E0
		DB  DISP_ESC_START $07 $00          ;repeat 8 times
		DB  DISP_ESC_START $08 $E0          ;repeat 9 times
		DB  DISP_ESC_START $2C $00          ;repeat 45 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 1:
		DB  $B1 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  $00 $00
		DB  DISP_ESC_START $0A $FF          ;repeat 11 times
		DB  DISP_ESC_START $08 $00          ;repeat 9 times
		DB  $80 $FE $FF $7F $1D
		DB  DISP_ESC_START $03 $1C          ;repeat 4 times
		DB  $00 $C0 $E4 $E6 $77 $33 $33 $F3
		DB  $FF $FE $3E $00 $03 $F3 $FF $FF
		DB  $1F $03 $03 $C3 $E4 $E6 $77 $33
		DB  $33 $F3 $FF $FE $3E $00 $80 $FE
		DB  $FF $7F $01
		DB  DISP_ESC_START $05 $00          ;repeat 6 times
		DB  $80 $FE $FF $FF $9D
		DB  DISP_ESC_START $03 $9C          ;repeat 4 times
		DB  $00 $C0 $FF $FF $7F $0E $07 $07
		DB  $C0 $FF $FF $7F $0E $07 $07 $00
		DB  $F8 $FE $FE $07 $03 $83 $FF $FE
		DB  $7C $00 $C0 $FF $FF $7F $0E $07
		DB  $07
		DB  DISP_ESC_START $0D $00          ;repeat 14 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 2:
		DB  $B2 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  $00 $00 $07
		DB  DISP_ESC_START $08 $FF          ;repeat 9 times
		DB  $07
		DB  DISP_ESC_START $08 $00          ;repeat 9 times
		DB  $03 $03 $03
		DB  DISP_ESC_START $06 $00          ;repeat 7 times
		DB  $01
		DB  DISP_ESC_START $03 $03          ;repeat 4 times
		DB  $01 $03 $03 $03 $00 $00 $00 $01
		DB  DISP_ESC_START $03 $03          ;repeat 4 times
		DB  $00 $01
		DB  DISP_ESC_START $03 $03          ;repeat 4 times
		DB  $01 $03 $03 $03 $00 $00 $03 $03
		DB  $03
		DB  DISP_ESC_START $07 $00          ;repeat 8 times
		DB  DISP_ESC_START $08 $03          ;repeat 9 times
		DB  $00 $03 $03 $03
		DB  DISP_ESC_START $03 $00          ;repeat 4 times
		DB  $03 $03 $03
		DB  DISP_ESC_START $05 $00          ;repeat 6 times
		DB  $01
		DB  DISP_ESC_START $03 $03          ;repeat 4 times
		DB  $01 $00 $00 $00 $03 $03 $03
		DB  DISP_ESC_START $11 $00          ;repeat 18 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 3:
		DB  $B3 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  $00 $00 $00 $3F
		DB  DISP_ESC_START $06 $FF          ;repeat 7 times
		DB  $7F
		DB  DISP_ESC_START $73 $00          ;repeat 116 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 4:
		DB  $B4 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  DISP_ESC_START $03 $00          ;repeat 4 times
		DB  DISP_ESC_START $06 $FF          ;repeat 7 times
		DB  DISP_ESC_START $74 $00          ;repeat 117 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 5:
		DB  $B5 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  DISP_ESC_START $03 $00          ;repeat 4 times
		DB  $01 $1F $1F $1F $0F $0F $03
		DB  DISP_ESC_START $74 $00          ;repeat 117 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 6:
		DB  $B6 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  $00 $E0 $F0 $F8 $FC $FC
		DB  DISP_ESC_START $04 $FE          ;repeat 5 times
		DB  $FC $FC $F8 $F0
		DB  DISP_ESC_START $70 $00          ;repeat 113 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 7:
		DB  $B7 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  $00 $03 $07 $0F
		DB  DISP_ESC_START $05 $1F          ;repeat 6 times
		DB  $0F $0F $07 $07 $01
		DB  DISP_ESC_START $70 $00          ;repeat 113 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
#emac
;Size = 346 bytes
#endif
