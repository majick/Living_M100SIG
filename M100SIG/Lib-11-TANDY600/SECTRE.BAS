�      :��       SECTREAD Version 1.0
       '
       '       Tandy 600 Portable Computer
       '       disk sector reading program
       ' g      :��       Copyright (C) 1988 by
       '           Rick Richmond �      :��
       '       Permission is hereby granted to use and
       '           duplicate without restriction.
 	,   :��
       '       L I B R A R Y   F I L E S
       ' 4	6     �� "UTILTY.LIB" �	�   :��
       '       U S E R   D E F I N E D   F U N C T I O N S
       ' 
�   � �HX$(DUMMY0%,DUMMY1%)���("000"���(DUMMY0%),DUMMY1%)
                                       :�� return n-length HEX value D
�   :��
       '       D I M   S T A T E M E N T S
       ' ~
�   � A$(�)             :�� sector data buffer array �
�   � D$()               :�� sector data buffer field dummys �
�   � DPY$()            :�� display literals �  � � � 8J -�  PROG$�"SECTREAD"
:      VERS$�"V01.0" ^�  � �
:      �
:      � PROG$,VERS$
:      �   � I%� � 
:          DPY$(I%)�"    "
:          � I%
:      DPY$()� " ABS"
:      DPY$()� " SEC"
:      DPY$()� " TRK"
:      DPY$()�" REL"
:      DPY$()�" SEC" �  BYTE%�
:      LENGTH%�
:      OFFSET%�
:      SEGMENT%�                      :�� storage for UTILTY.LIB calls A  SREG$�""
:      RREG$�""
:      � I%� � 
:              SREG$�SREG$���()
:              RREG$�RREG$���()
:              � I%                 :�� 80C88 register storage strings {�  :��
       '       M A I N   P R O G R A M
       ' ��  � "Initializing (30 seconds) "; ��  � "sector.tmp" AS 1 ���   :�� buffer for sector data  �  �� ,  AS SECTSTART$        :�� pointer to start of buffer ��  � I%� � 
:          � J%� � 
:              �� , ��(I%)�� AS D$(), ��(I%�)�� AS D$(),
                        ��(I%�)�� AS D$(), J%� AS D$(),
                         AS A$((I%��)�J%) r�          � J%
:          � ".";
:          � I%
:      �
:      �                           :�� a$() points to sector buffer �4  :��
       '       G E T   S E C T O R   N U M B E R
       ' �>  � "Absolute Sector Number";SECTOR%  :�� get sector number �H  � SECTOR%� �
               � �
       :�    DPY$()�" "��HX$(SECTOR%,)
:              DPY$()�" "��HX$(��(SECTOR%�),)
:              DPY$()�" "��HX$(SECTOR% � ,) .R  � DSVARPTR(SECTSTART$,LENGTH%,SEGMENT%,OFFSET%)
                                       :�� get pointer to current buffer loc'n o\  ��(SREG$,,)���()���() :�� function code in AH register �f  � DBSYSINT(W ,SREG$,RREG$) :�� request disk interrupt ��  :��
       '       R E A D   S E C T O R
       ' &�  ��(SREG$,,)���()���() :�� function code & drive # in AX e�  ��(SREG$,,)���()���() :�� # of sectors to read in CX ��  ��(SREG$,,)���(SECTOR%)   :�� sector to read in DX ��  ��(SREG$,,)���(SEGMENT%) :�� buffer segment (from VARPTR) in DS 1�  ��(SREG$,,)���(OFFSET%)   :�� buffer offset (from VARPTR) in SI s�  ��(SREG$,,)���(� )���()      :�� media descriptor in BL ��  � DBSYSINT(W ,SREG$,RREG$) :�� read sector interrupt ��  :��
       '       D I S P L A Y   S E C T O R   D A T A
       ' G	  � I%� � 
:          �
:          � J%� � 
:              � DPY$(J%); $	          � � "  \ \  "; �HX$((I%� )�(J%�),);
:              � K%� � 
:                  � � "\\ "; �HX$(��(A$((I%� )�(J%�)�K%)),);
:                  � K%             :�� display HEX values, 16 per line �	          � "  ";
:              � K%� � 
:                  BYTE%���(A$((I%� )�(J%�)�K%))
                                       :�� get ASCII value of character d$	              � BYTE%� � BYTE%�� �
                       � ��(BYTE%);
                   :� � ".";     :�� display character, 16 per line �.	              � K%
:              � J%� �
                   �               :�� CRLF's until last line of display �8	          � J% WB	      A$��
:          � A$�"" �
               � B	               :�� pause after 16 line display cL	      � rV	      � I% �`	  � 4                       :�� end main loop �8J :��
       '       E R R O R   H A N D L I N G
       ' N �
:      � "Error";�;"at line";�;"in ";PROG$
:      � '� :�� .� � C� �� "sector.tmp" J� �                                                                 