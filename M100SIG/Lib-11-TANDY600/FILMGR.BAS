��
 :�� THIS PROGRAM WILL ALLOW RENAMING AND DELETING OF � :�� FILES WITHIN THE TANDY 600. � :�� ( :�� STEVE NYE [70366,1316] 2 :�� -d � � : � � � ' ]i � T �  � O : BLANK$ � BLANK$ � ��( ) : � oj � : �� DRIVE$ zn � , �x � "1-Delete 2-Rename 3-Default dir 4-EXIT"; �� � , : � BLANK$ �� � , : � "Command ";DRIVE$; 	� COMMAND$ � � : � COMMAND$ � "" � �  "	� � , : � BLANK$; H	� � �� (COMMAND$) � �,�,�,� R	� � j  g	�� RESET AND EXIT u	�� � �    {	�� �	� �	�� DELETE A FILE �	�� , : � BLANK$; : � , : � � "Filename to delete <d:filename> ";SOURCE$ �	�� , : � BLANK$; 
�� SOURCE$ � "" � � #
��� SOURCE$ -
� � A
�� RENAME A FILE �
�� , : � BLANK$; : � , : � � "Present filename <d:filename> ";SOURCE$ �
�� , : � BLANK$; : � SOURCE$ � "" � � �
�� , : � � "Rename to <d:filename> ";DEST$ �� , : � BLANK$; : � DEST$ � "" � � /��� SOURCE$ AS DEST$ 9�� � T�� CHANGE DEFAULT DRIVE ��� , : � BLANK$; : � , : � � "New default drive < A B or RETURN> ";DRIVE$ ��� ��(DRIVE$,) � "A" � DRIVE$ � "a" � DRIVE$ � "A:" : � � '�� ��(DRIVE$,) � "B" � DRIVE$ � "b" � DRIVE$ � "B:" : � � 7�DRIVE$ � "" R�� , : � BLANK$; : � v'� : � , : � BLANK$; : � , �'� "** ERROR ** number ";�;" in line ";� �$'� n                                                                                                