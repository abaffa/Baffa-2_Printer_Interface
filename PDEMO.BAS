1 REM ******************************
2 REM * Baffa-2 PIO - PRINTER DEMO *
3 REM *       Z80 PIO MODULE       *
4 REM *      by Augusto Baffa      *
5 REM *   Compatible with SC103    *
6 REM ******************************
7 REM https://hackaday.io/project/184897-baffa-2-printer-interface
8 REM https://hackaday.io/project/183266-baffa-2-homebrew-microcomputer

9 REM SET PIO AND RESET PRINTER AN
10 OUT &H68,0
20 OUT &H69,0
30 OUT &H6A, &HCF
40 OUT &H6A, &H5B
50 OUT &H6B, &HF
60 OUT &H68, &H24
70 GOSUB 1000

99 REM GENERATE ASCII LIST
100 FOR B = 32 TO 127
110 PRINT CHR$(B);
120 GOSUB 2000
130 NEXT B
140 GOTO 100
150 END

999 REM FORCE A PAUSE
1000 FOR I = 1 TO 5
1010 NEXT I
1020 RETURN

1999 REM SEND DATA TO PRINTER
2000 OUT &H69, B
2010 OUT &H68, &HA0
2020 GOSUB 1000
2030 OUT &H68, &HA4
2040 IF (INP(&H68) AND 3) = 3 THEN GOTO 2050
2050 RETURN
