#ifndef	DISP_WELCOME
#define	DISP_WELCOME
;###############################################################################
;# AriCalculator - Image: Nina.data (single frame)                             #
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
;#       DISP_WELCOME_TAB:                                                     #
;#           This macro allocates a table of raw image data.                   #
;#                                                                             #
;#       DISP_WELCOME_STREAM:                                                  #
;#           This macro allocates a compressed stream of image data and        #
;#           control commands, which can be directly driven to the display     #
;#           driver.                                                           #
;###############################################################################
;# Generated on Thu, Mar 01 2018                                               #
;###############################################################################

;+--------------------------------------------------------------------------------------------------------------------------------+
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                    #                                                                                           |
;|  #       #   #                     #                                                                                           |
;|  ##      #   #                     #                                                                                           |
;|  # #     #                                                                                                                     |
;|  # #     #   #   # ###     #####        #####                                                                                  |
;|  #  #    #   #   ##   #   ##    #      ##    #                                                                                 |
;|  #   #   #   #   #    #   #     #      #                                                                                       |
;|  #   #   #   #   #    #         #      ##                                                                                      |
;|  #    #  #   #   #    #     #####        ###                                                                                   |
;|  #     # #   #   #    #    #    #            #                                                                                 |
;|  #     # #   #   #    #   #     #            #                                                                                 |
;|  #      ##   #   #    #   #    ##      #    ##                                                                                 |
;|  #       #   #   #    #    #### #       #####                                                                                  |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;| ##########                            #                                                  #                                     |
;|     #                                 #                                                  #                                     |
;|     #                                 #                                                  #                                     |
;|     #       #####    #####     ####   # ###      ###    # ###    # ###   ###      ####   # ###    # ###      ###    # ###      |
;|     #      ##    #  ##    #   #    #  ##   #    #   #   ##   #   ##     #   #    #    #  ##   #   ##   #    #   #   ##         |
;|     #      #     #  #        #        #    #   #     #  #    #   #     #     #  #        #    #   #    #   #     #  #          |
;|     #            #  ##       #        #    #   #     #  #    #   #     #     #  #        #    #   #    #   #     #  #          |
;|     #        #####    ###    #        #    #   #######  #    #   #     #######  #        #    #   #    #   #######  #          |
;|     #       #    #        #  #        #    #   #        #    #   #     #        #        #    #   #    #   #        #          |
;|     #      #     #        #  #        #    #   #        #    #   #     #        #        #    #   #    #   #        #          |
;|     #      #    ##  #    ##   #    #  #    #    #    #  #    #   #      #    #   #    #  #    #   #    #    #    #  #          |
;|     #       #### #   #####     ####   #    #     ####   #    #   #       ####     ####   #    #   #    #     ####   #          |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;|                                                                                                                                |
;+--------------------------------------------------------------------------------------------------------------------------------+

#macro DISP_WELCOME_TAB, 0

;#Frame 0:
;#----------------------------------------------------------------------
;#Page 0:
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
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
;#Page 1:
		DB  $00  $00  $FC  $08  $30  $40  $80  $00
		DB  $00  $00  $FC  $00  $00  $00  $EC  $00
		DB  $00  $00  $E0  $40  $20  $20  $20  $C0
		DB  $00  $00  $00  $C0  $60  $20  $20  $20
		DB  $20  $C0  $00  $00  $0E  $00  $00  $00
		DB  $C0  $60  $20  $20  $20  $20  $40  $00
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
;#Page 2:
		DB  $00  $00  $3F  $00  $00  $00  $01  $02
		DB  $0C  $10  $3F  $00  $00  $00  $3F  $00
		DB  $00  $00  $3F  $00  $00  $00  $00  $3F
		DB  $00  $00  $00  $18  $24  $22  $22  $22
		DB  $12  $3F  $00  $00  $00  $00  $00  $00
		DB  $11  $21  $22  $22  $22  $30  $1C  $00
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
;#Page 3:
		DB  $00  $08  $08  $08  $08  $F8  $08  $08
		DB  $08  $08  $08  $00  $80  $C0  $40  $40
		DB  $40  $40  $80  $00  $00  $80  $C0  $40
		DB  $40  $40  $40  $80  $00  $00  $00  $80
		DB  $40  $40  $40  $40  $80  $00  $00  $F8
		DB  $80  $40  $40  $40  $80  $00  $00  $00
		DB  $00  $80  $40  $40  $40  $80  $00  $00
		DB  $00  $C0  $80  $40  $40  $40  $80  $00
		DB  $00  $00  $C0  $80  $40  $40  $40  $00
		DB  $00  $80  $40  $40  $40  $80  $00  $00
		DB  $00  $00  $80  $40  $40  $40  $40  $80
		DB  $00  $00  $F8  $80  $40  $40  $40  $80
		DB  $00  $00  $00  $C0  $80  $40  $40  $40
		DB  $80  $00  $00  $00  $00  $80  $40  $40
		DB  $40  $80  $00  $00  $00  $C0  $80  $40
		DB  $40  $40  $00  $00  $00  $00  $00  $00
;#Page 4:
		DB  $00  $00  $00  $00  $00  $7F  $00  $00
		DB  $00  $00  $00  $00  $31  $48  $44  $44
		DB  $44  $24  $7F  $00  $00  $23  $42  $44
		DB  $44  $44  $60  $38  $00  $00  $1F  $20
		DB  $40  $40  $40  $40  $20  $00  $00  $7F
		DB  $00  $00  $00  $00  $7F  $00  $00  $00
		DB  $1F  $24  $44  $44  $44  $44  $27  $00
		DB  $00  $7F  $00  $00  $00  $00  $7F  $00
		DB  $00  $00  $7F  $00  $00  $00  $00  $00
		DB  $1F  $24  $44  $44  $44  $44  $27  $00
		DB  $00  $1F  $20  $40  $40  $40  $40  $20
		DB  $00  $00  $7F  $00  $00  $00  $00  $7F
		DB  $00  $00  $00  $7F  $00  $00  $00  $00
		DB  $7F  $00  $00  $00  $1F  $24  $44  $44
		DB  $44  $44  $27  $00  $00  $7F  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
;#Page 5:
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
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
;#Page 6:
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
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00
;#Page 7:
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
		DB  $00  $00  $00  $00  $00  $00  $00  $00
		DB  $00  $00  $00  $00  $00  $00  $00  $00

#emac
;Size = 1024 bytes

#macro DISP_WELCOME_STREAM, 0

;#Frame 0:
;#----------------------------------------------------------------------
;#Page 0:
		DB  $B0 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  DISP_ESC_START $7F $00          ;repeat 128 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 1:
		DB  $B1 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  $00 $00 $FC $08 $30 $40 $80 $00
		DB  $00 $00 $FC $00 $00 $00 $EC $00
		DB  $00 $00 $E0 $40 $20 $20 $20 $C0
		DB  $00 $00 $00 $C0 $60
		DB  DISP_ESC_START $03 $20          ;repeat 4 times
		DB  $C0 $00 $00 $0E $00 $00 $00 $C0
		DB  $60
		DB  DISP_ESC_START $03 $20          ;repeat 4 times
		DB  $40
		DB  DISP_ESC_START $50 $00          ;repeat 81 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 2:
		DB  $B2 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  $00 $00 $3F $00 $00 $00 $01 $02
		DB  $0C $10 $3F $00 $00 $00 $3F $00
		DB  $00 $00 $3F
		DB  DISP_ESC_START $03 $00          ;repeat 4 times
		DB  $3F $00 $00 $00 $18 $24 $22 $22
		DB  $22 $12 $3F
		DB  DISP_ESC_START $05 $00          ;repeat 6 times
		DB  $11 $21 $22 $22 $22 $30 $1C
		DB  DISP_ESC_START $50 $00          ;repeat 81 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 3:
		DB  $B3 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  $00
		DB  DISP_ESC_START $03 $08          ;repeat 4 times
		DB  $F8
		DB  DISP_ESC_START $04 $08          ;repeat 5 times
		DB  $00 $80 $C0
		DB  DISP_ESC_START $03 $40          ;repeat 4 times
		DB  $80 $00 $00 $80 $C0
		DB  DISP_ESC_START $03 $40          ;repeat 4 times
		DB  $80 $00 $00 $00 $80
		DB  DISP_ESC_START $03 $40          ;repeat 4 times
		DB  $80 $00 $00 $F8 $80 $40 $40 $40
		DB  $80
		DB  DISP_ESC_START $03 $00          ;repeat 4 times
		DB  $80 $40 $40 $40 $80 $00 $00 $00
		DB  $C0 $80 $40 $40 $40 $80 $00 $00
		DB  $00 $C0 $80 $40 $40 $40 $00 $00
		DB  $80 $40 $40 $40 $80
		DB  DISP_ESC_START $03 $00          ;repeat 4 times
		DB  $80
		DB  DISP_ESC_START $03 $40          ;repeat 4 times
		DB  $80 $00 $00 $F8 $80 $40 $40 $40
		DB  $80 $00 $00 $00 $C0 $80 $40 $40
		DB  $40 $80
		DB  DISP_ESC_START $03 $00          ;repeat 4 times
		DB  $80 $40 $40 $40 $80 $00 $00 $00
		DB  $C0 $80 $40 $40 $40
		DB  DISP_ESC_START $05 $00          ;repeat 6 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 4:
		DB  $B4 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  DISP_ESC_START $04 $00          ;repeat 5 times
		DB  $7F
		DB  DISP_ESC_START $05 $00          ;repeat 6 times
		DB  $31 $48 $44 $44 $44 $24 $7F $00
		DB  $00 $23 $42 $44 $44 $44 $60 $38
		DB  $00 $00 $1F $20
		DB  DISP_ESC_START $03 $40          ;repeat 4 times
		DB  $20 $00 $00 $7F
		DB  DISP_ESC_START $03 $00          ;repeat 4 times
		DB  $7F $00 $00 $00 $1F $24
		DB  DISP_ESC_START $03 $44          ;repeat 4 times
		DB  $27 $00 $00 $7F
		DB  DISP_ESC_START $03 $00          ;repeat 4 times
		DB  $7F $00 $00 $00 $7F
		DB  DISP_ESC_START $04 $00          ;repeat 5 times
		DB  $1F $24
		DB  DISP_ESC_START $03 $44          ;repeat 4 times
		DB  $27 $00 $00 $1F $20
		DB  DISP_ESC_START $03 $40          ;repeat 4 times
		DB  $20 $00 $00 $7F
		DB  DISP_ESC_START $03 $00          ;repeat 4 times
		DB  $7F $00 $00 $00 $7F
		DB  DISP_ESC_START $03 $00          ;repeat 4 times
		DB  $7F $00 $00 $00 $1F $24
		DB  DISP_ESC_START $03 $44          ;repeat 4 times
		DB  $27 $00 $00 $7F
		DB  DISP_ESC_START $09 $00          ;repeat 10 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 5:
		DB  $B5 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  DISP_ESC_START $7F $00          ;repeat 128 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 6:
		DB  $B6 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  DISP_ESC_START $7F $00          ;repeat 128 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
;#Page 7:
		DB  $B7 $10 $00                     ;set page and column address
		DB  DISP_ESC_START DISP_ESC_DATA    ;switch to data input
		DB  DISP_ESC_START $7F $00          ;repeat 128 times
		DB  DISP_ESC_START DISP_ESC_CMD     ;switch to command input
#emac
;Size = 390 bytes
#endif
