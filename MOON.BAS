DECLARE SUB upkey ()
DECLARE SUB downkey ()
DECLARE SUB drawhud ()
DECLARE SUB spacekey ()
DECLARE SUB loadignignokt ()
DECLARE SUB animateiglfired (num AS INTEGER)
DECLARE SUB removebullet (num AS INTEGER)
DECLARE SUB loadenemy ()
DECLARE SUB drawenemy ()
DECLARE SUB eraseenemy ()
DECLARE SUB collisiondetection (num AS INTEGER)
DECLARE SUB initnewlevel ()
DECLARE SUB gameover ()
DECLARE SUB animatequadlaser ()
DECLARE SUB loaderr ()
DECLARE SUB loadigerr ()
DECLARE SUB waitsome (a AS INTEGER, b AS INTEGER)
DECLARE SUB splash ()

CALL splash

SCREEN 7

DIM ind AS INTEGER
DIM index AS INTEGER

DIM SHARED igpic1(262) AS INTEGER
DIM SHARED igpic2(212) AS INTEGER
DIM SHARED igpic3(212) AS INTEGER
DIM SHARED igx AS INTEGER
DIM SHARED igy AS INTEGER
igx = 5
igy = 100

DIM SHARED errpic1(57) AS INTEGER
DIM SHARED errpic2(57) AS INTEGER
DIM SHARED igerrpic1(275) AS INTEGER
DIM SHARED igerrpic2(275) AS INTEGER
DIM SHARED igerrpic3(353) AS INTEGER

DIM SHARED change AS INTEGER
DIM SHARED level AS INTEGER
DIM SHARED lives AS INTEGER
DIM SHARED quadlasers AS INTEGER
DIM SHARED score AS LONG
change = 1
level = 0
lives = 5
quadlasers = 3
score = 0

DIM SHARED epic1(82) AS INTEGER
DIM SHARED ex(1 TO 2, 1 TO 5) AS INTEGER
DIM SHARED ey(1 TO 2, 1 TO 5) AS INTEGER
DIM SHARED edead(1 TO 2, 1 TO 5) AS INTEGER
DIM SHARED enum AS INTEGER
DIM SHARED espeed AS INTEGER
DIM SHARED emax AS INTEGER

DIM SHARED iglfired(1 TO 5) AS INTEGER
DIM SHARED iglx(1 TO 5) AS INTEGER
DIM SHARED igly(1 TO 5) AS INTEGER
DIM SHARED iglshots AS INTEGER
DIM SHARED igldelay AS INTEGER

DIM SHARED keypress AS STRING

CALL loadignignokt
CALL loaderr
CALL loadigerr
CALL loadenemy

CLS
LOCATE 11, 17
PRINT "Oh shit!"
LOCATE 12, 2
PRINT "The pigs found the mooninite's stash!"
LOCATE 13, 2
PRINT "Help Ignignokt and Err kill the mofos!"
CALL waitsome(1000, 1000)
WHILE (INKEY$ = "")
WEND
CLS

CALL drawhud
PUT (igx, igy), igpic1, PSET

DO
  IF (enum = 0) THEN
    CALL initnewlevel
    CALL drawhud
    CALL drawenemy
    PUT (igx, igy), igpic1, PSET
  END IF
  igldelay = igldelay + 1
  espeed = espeed + 1

  keypress = INKEY$

  CALL drawhud
  IF keypress = CHR$(0) + CHR$(72) THEN
   CALL upkey

  ELSEIF keypress = CHR$(0) + CHR$(80) THEN
   CALL downkey

  ELSEIF keypress = CHR$(0) + CHR$(75) THEN
    REM CALL leftkey

  ELSEIF keypress = CHR$(0) + CHR$(77) THEN
    REM CALL rightkey

  ELSEIF keypress = " " THEN
    CALL spacekey

  ELSEIF UCASE$(keypress) = "B" THEN
    CALL animatequadlaser
  END IF

  IF (igldelay > 5) THEN
    igldelay = 0
    FOR ind = 1 TO 5
      IF (iglfired(ind) = 1) THEN
        CALL animateiglfired(ind)
      END IF
    NEXT
  END IF
  
  IF (espeed > emax) THEN
    espeed = 0
    CALL eraseenemy
    FOR ind = 1 TO 2
      FOR index = 1 TO 5
        ex(ind, index) = ex(ind, index) - level
        IF ey(ind, index) MOD 2 = 1 THEN
          ey(ind, index) = ey(ind, index) + change
        ELSE
          ey(ind, index) = ey(ind, index) - change
        END IF
      NEXT
    NEXT

    CALL drawenemy
    CALL gameover
  END IF
LOOP UNTIL (UCASE$(keypress) = "Q")

'***IGNIGNOKT STANDING***  25x19
DATA 00, 00, 00, 00, 00, 00, 10, 10, 00, 00, 00, 00, 10, 10, 10, 10, 00, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 10, 10, 00, 00, 00, 00, 10, 10, 10, 10, 00, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 10, 10, 00, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 10, 10, 10, 10, 10, 01, 10, 10, 01, 10, 10, 10, 10, 00, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 10, 10, 10, 10, 01, 10, 10, 10, 10, 01, 10, 10, 10, 00, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 10, 10, 01, 10, 10, 10, 10, 10, 10, 01, 10, 10, 00, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 10, 01, 10, 01, 01, 10, 10, 01, 01, 10, 01, 10, 00, 00, 00, 00, 00, 00, 13, 13, 00
DATA 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00, 10, 10, 10, 13, 06
DATA 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00, 10, 14, 14, 13, 00
DATA 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 01, 00, 00, 10, 00, 00, 00, 00
DATA 00, 00, 01, 10, 10, 10, 10, 01, 01, 01, 01, 01, 01, 10, 10, 10, 10, 00, 01, 00, 01, 00, 00, 00, 00
DATA 00, 01, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 01, 00, 00, 00, 00, 00
DATA 01, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00, 00, 00, 00, 00
DATA 01, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 01, 01, 01, 01, 00, 00, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00

'***IGNIGNOKT NO GUN***  20x19
DATA 00, 00, 00, 00, 00, 00, 10, 10, 00, 00, 00, 00, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 10, 10, 00, 00, 00, 00, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 10, 10, 00, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 10, 10, 10, 10, 10, 01, 10, 10, 01, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 10, 10, 10, 10, 01, 10, 10, 10, 10, 01, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 10, 10, 01, 10, 10, 10, 10, 10, 10, 01, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 10, 01, 10, 01, 01, 10, 10, 01, 01, 10, 01, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 01, 00, 00
DATA 00, 00, 01, 10, 10, 10, 10, 01, 01, 01, 01, 01, 01, 10, 10, 10, 10, 00, 01, 00
DATA 00, 01, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 01
DATA 01, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 01
DATA 01, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00
DATA 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 01, 01, 01, 01, 00, 00, 01, 01, 01, 01, 00, 00, 00, 00, 00


'***ERR STANDING***   10x9
DATA 00, 00, 00, 00, 00, 00, 13, 00, 00, 00
DATA 00, 00, 01, 13, 13, 13, 01, 00, 00, 00
DATA 00, 00, 13, 01, 13, 01, 13, 13, 00, 00
DATA 00, 00, 01, 13, 13, 13, 01, 13, 00, 00
DATA 00, 01, 13, 13, 13, 13, 13, 13, 01, 00
DATA 01, 00, 13, 01, 01, 01, 13, 13, 00, 01
DATA 00, 00, 13, 13, 13, 13, 13, 13, 00, 00
DATA 00, 00, 00, 01, 00, 00, 01, 00, 00, 00
DATA 00, 00, 01, 01, 00, 00, 01, 01, 00, 00

'***IGNIGNOKT & ERR QUADLASER NO GUN***  20x25
DATA 00, 00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 13, 13, 13, 13, 13, 13, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 01, 00, 13, 13, 01, 01, 01, 13, 00, 01, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 01, 13, 13, 13, 13, 13, 13, 01, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 13, 01, 13, 13, 13, 01, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 10, 13, 13, 01, 13, 01, 13, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 10, 10, 01, 13, 13, 13, 01, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 10, 10, 10, 10, 10, 01, 10, 10, 01, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 10, 10, 10, 10, 01, 10, 10, 10, 10, 01, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 10, 10, 01, 10, 10, 10, 10, 10, 10, 01, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 10, 01, 10, 01, 01, 10, 10, 01, 01, 10, 01, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 01, 00, 00
DATA 00, 00, 01, 10, 10, 10, 10, 01, 01, 01, 01, 01, 01, 10, 10, 10, 10, 00, 01, 00
DATA 00, 01, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 01
DATA 01, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 01
DATA 01, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00
DATA 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 01, 01, 01, 01, 00, 00, 01, 01, 01, 01, 00, 00, 00, 00, 00


'***IGNIGNOKT & ERR QUADLASER WITH GUNS***  26x25
DATA 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 13, 13, 13, 13, 13, 13, 00, 00, 01, 01, 01, 01, 01, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 00, 10, 01, 00, 13, 13, 01, 01, 01, 13, 00, 01, 00, 00, 00, 00, 00, 01
DATA 00, 00, 00, 00, 00, 00, 13, 14, 14, 10, 00, 01, 13, 13, 13, 13, 13, 13, 01, 00, 00, 00, 00, 00, 00, 01
DATA 00, 00, 00, 00, 00, 06, 13, 10, 10, 10, 00, 00, 13, 01, 13, 13, 13, 01, 00, 00, 00, 00, 00, 00, 00, 10
DATA 00, 00, 00, 00, 00, 00, 13, 13, 00, 00, 00, 10, 13, 13, 01, 13, 01, 13, 10, 10, 10, 00, 13, 14, 14, 10
DATA 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 10, 10, 01, 13, 13, 13, 01, 10, 10, 10, 06, 13, 10, 10, 10
DATA 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 00, 13, 13, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 10, 10, 10, 10, 10, 01, 10, 10, 01, 10, 10, 10, 10, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 10, 10, 10, 10, 01, 10, 10, 10, 10, 01, 10, 10, 10, 00, 13, 13, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 00, 10, 10, 01, 10, 10, 10, 10, 10, 10, 01, 10, 10, 06, 13, 10, 10, 10
DATA 00, 00, 00, 00, 00, 00, 00, 00, 00, 10, 01, 10, 01, 01, 10, 10, 01, 01, 10, 01, 10, 00, 13, 14, 14, 10
DATA 00, 00, 00, 00, 00, 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00, 10
DATA 00, 00, 00, 00, 00, 01, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00, 01
DATA 00, 00, 00, 00, 01, 00, 01, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 01, 00, 01, 00
DATA 00, 00, 00, 00, 10, 00, 00, 01, 10, 10, 10, 10, 01, 01, 01, 01, 01, 01, 10, 10, 10, 10, 00, 01, 00, 00
DATA 00, 13, 14, 14, 10, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00
DATA 06, 13, 10, 10, 10, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 13, 13, 00, 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00, 00
DATA 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 01, 01, 01, 00, 00, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00


'***ENEMY ONE***   9x15
DATA 00, 00, 00, 00, 00, 00, 09, 09, 00
DATA 00, 00, 00, 00, 00, 09, 09, 09, 09
DATA 00, 00, 00, 00, 00, 00, 04, 14, 00
DATA 00, 00, 00, 00, 00, 00, 14, 14, 00
DATA 00, 00, 00, 00, 00, 00, 09, 09, 00
DATA 07, 07, 00, 00, 00, 09, 09, 09, 09
DATA 00, 07, 09, 09, 09, 09, 09, 09, 09
DATA 00, 00, 00, 00, 00, 09, 09, 09, 09
DATA 00, 00, 00, 00, 00, 09, 09, 09, 09
DATA 00, 00, 00, 00, 00, 09, 09, 09, 09
DATA 00, 00, 00, 00, 00, 00, 09, 09, 00
DATA 00, 00, 00, 00, 00, 00, 09, 09, 00
DATA 00, 00, 00, 00, 00, 00, 09, 09, 00
DATA 00, 00, 00, 00, 00, 00, 06, 06, 00
DATA 00, 00, 00, 00, 06, 06, 06, 06, 00

SUB animateiglfired (num AS INTEGER)
  LINE (iglx(num), igly(num))-(iglx(num) + 2, igly(num) + 2), 0, BF

  iglx(num) = iglx(num) + 1
  IF iglx(num) > 315 THEN
    CALL removebullet(num)
  ELSE
    LINE (iglx(num), igly(num))-(iglx(num) + 2, igly(num) + 2), 6, BF
    CALL collisiondetection(num)
  END IF

END SUB

SUB animatequadlaser
  DIM a AS INTEGER
  DIM b AS INTEGER
  DIM x AS INTEGER
  a = 5000
  b = 5000
  x = igx + 30

  IF (quadlasers > 0) THEN
    quadlasers = quadlasers - 1
    LINE (igx, igy)-(igx + 35, igy + 19), 0, BF

    PUT (igx, igy), igpic2, PSET
    PUT (igx + 25, igy + 10), errpic1, PSET
    CALL waitsome(a, b)
    LINE (igx, igy)-(igx + 35, igy + 19), 0, BF

    PUT (igx, igy), igpic3, PSET
    PUT (igx + 25, igy + 6), errpic2, PSET
    CALL waitsome(a, b)
    LINE (igx, igy)-(igx + 35, igy + 19), 0, BF

    PUT (igx, igy), igerrpic1, PSET
    CALL waitsome(a, b)
    LINE (igx, igy)-(igx + 35, igy + 25), 0, BF

    PUT (igx, igy), igerrpic2, PSET
    CALL waitsome(a, b)
    LINE (igx, igy)-(igx + 35, igy + 25), 0, BF

    PUT (igx, igy), igerrpic3, PSET
    CALL waitsome(a, b)

    WHILE (x + 9 <= ex(1, 1))
      LINE (x, igy + 2)-(x + 18, igy + 20), 6, BF
      CALL waitsome(1000, 1000)
      LINE (x, igy + 2)-(x + 18, igy + 20), 0, BF
      x = x + 1
    WEND

    CLS
    FOR index = 0 TO 180
      PAINT (1, 1), index MOD 15
      PAINT (1, 1), index MOD 15
    NEXT index
    CLS

    FOR ind = 1 TO 2
      FOR index = 1 TO 5
        edead(ind, index) = 0
      NEXT index
    NEXT ind

    enum = 0
    score = score - ex(1, 1) / 10

    FOR index = 1 TO 5
      removebullet (index)
    NEXT index

    LINE (igx, igy)-(igx + 35, igy + 25), 0, BF
    PUT (igx, igy), igpic1, PSET
  END IF
END SUB

SUB collisiondetection (num AS INTEGER)
  DIM i AS INTEGER
  DIM ind AS INTEGER
  DIM index AS INTEGER
  DIM x AS INTEGER
  DIM y AS INTEGER

  FOR x = 1 TO 2
    IF (iglx(num) + 1 >= ex(x, 1) AND iglx(num) + 1 <= ex(x, 1) + 9) THEN
      FOR y = 1 TO 5
        IF (igly(num) >= ey(x, y) AND igly(num) <= ey(x, y) + 15) AND edead(x, y) = 0 THEN
          score = score + level / 10
          edead(x, y) = 1
          enum = enum - 1
          CALL removebullet(num)
          FOR ind = 1 TO 8
            CALL waitsome(800, 800)
            CIRCLE (ex(x, y) + 5, ey(x, y) + 8), ind, ind
          NEXT ind
          FOR ind = 8 TO 1 STEP -1
            CALL waitsome(800, 800)
            CIRCLE (ex(x, y) + 5, ey(x, y) + 8), ind, 0
          NEXT ind
          y = 6
          x = 3
        END IF
      NEXT y
    END IF
  NEXT x
 
END SUB

SUB downkey
  LINE (igx, igy)-(igx + 25, igy + 19), 0, BF
  
  igy = igy + 5
  IF (igy > 175) THEN
    igy = igy - 5
  END IF
  
  PUT (igx, igy), igpic1, PSET

END SUB

SUB drawenemy
  DIM x AS INTEGER
  DIM y AS INTEGER

  FOR x = 1 TO 2
    FOR y = 1 TO 5
      IF (edead(x, y) <> 1) THEN
        PUT (ex(x, y), ey(x, y)), epic1
      END IF
    NEXT
  NEXT
END SUB

SUB drawhud

LOCATE 1, 1
COLOR 15
PRINT "Dime Bags:"
COLOR 11
LOCATE 1, 11
PRINT score

COLOR 15
LOCATE 1, 28
PRINT "Joints:"
COLOR 11
LOCATE 1, 35
PRINT lives

COLOR 15
LOCATE 2, 1
PRINT "Quad Lasers:"
COLOR 11
LOCATE 2, 13
PRINT quadlasers

COLOR 15
LOCATE 2, 28
PRINT "Raid:"
LOCATE 2, 33
COLOR 11
PRINT level
COLOR 15

LINE (0, 20)-(319, 199), 15, B
LINE (40, 20)-(40, 199), 14, , 10

END SUB

SUB eraseenemy
  DIM x AS INTEGER
  DIM y AS INTEGER

  FOR x = 1 TO 2
    FOR y = 1 TO 5
      LINE (ex(x, y), ey(x, y))-(ex(x, y) + 9, ey(x, y) + 15), 0, BF
    NEXT
  NEXT

END SUB

SUB gameover
  DIM x AS INTEGER
  DIM y AS INTEGER

  FOR x = 1 TO 2
    FOR y = 1 TO 5
      IF (edead(x, y) = 0 AND ex(x, y) < 35) THEN
        lives = lives - 1
        IF (level MOD 5 = 0) THEN
          lives = lives - 2
        ELSE
          level = level - 1
        END IF
        IF lives >= 0 THEN
          LOCATE 11, 18
          PRINT "FUCK!"
          LOCATE 12, 5
          PRINT "The pigs confiscated a joint!"
          CALL waitsome(7000, 7000)
          WHILE (INKEY$ = "")
          WEND
          CLS
          enum = 0
          x = 3
          y = 6
        ELSE
          CLS
          FOR index = 0 TO 100
            PAINT (1, 1), 15
            PAINT (1, 1), 7
            LOCATE 11, 17
            PRINT "GAME OVER"
          NEXT index
          CLS
          PRINT "Dime Bags Gathered:"; score
          PRINT "Raids Survived:"; level - 1
          PRINT "Quad Lasers Remaining:"; quadlasers
          PRINT
          PRINT "Total Score:"; score + level - 1 + quadlasers * 10
          CALL waitsome(10000, 10000)
          WHILE UCASE$(INKEY$) <> "Q"
          WEND
          END
        END IF
      END IF
    NEXT y
  NEXT x
END SUB

SUB initnewlevel
  DIM ind AS INTEGER
  DIM index AS INTEGER
    level = level + 1
    IF level MOD 10 = 0 THEN quadlasers = quadlasers + 1
    IF level MOD 5 = 0 THEN lives = lives + 1
    score = score + ex(1, 1) / 10
    IF (level MOD 2 = 1) THEN
      change = change + 2
    END IF
    
    IF (change > 19) THEN
      change = 19
    END IF
    enum = 10
    emax = 800 - (level * 20)
    IF (emax < 0) THEN emax = 0
    FOR ind = 1 TO 2
      FOR index = 1 TO 5
        ex(ind, index) = 280 + (ind * 15)
        ey(ind, index) = 50 + (index * 20)
        edead(ind, index) = 0
      NEXT
    NEXT
    FOR index = 1 TO 5
      iglfired(index) = 0
    NEXT index
    iglshots = 0
    CLS
    LOCATE 12, 16
    PRINT "RAID "; level
    CALL waitsome(1000, 1000)
    WHILE (INKEY$ = "")
    WEND
    CLS

END SUB

SUB leftkey
  igx = igx - 5
  IF (igx < 5) THEN
    igx = igx + 5
  END IF

  CLS
  PUT (igx, igy), igpic1

END SUB

SUB loadenemy

DIM picture(1 TO 9, 1 TO 15)  AS INTEGER
DIM x AS INTEGER
DIM y AS INTEGER
DIM z AS INTEGER

FOR y = 1 TO 15
  FOR x = 1 TO 9
    READ z
    picture(x, y) = z
    PSET (x, y), picture(x, y)
  NEXT x
NEXT y
GET (1, 1)-(9, 15), epic1

END SUB

SUB loaderr

DIM picture(1 TO 10, 1 TO 9)  AS INTEGER
DIM x AS INTEGER
DIM y AS INTEGER
DIM z AS INTEGER

FOR y = 1 TO 9
  FOR x = 1 TO 10
    READ z
    picture(x, y) = z
    PSET (x, y), picture(x, y)
  NEXT x
NEXT y
GET (1, 1)-(10, 9), errpic1
CLS

FOR y = 1 TO 9
  FOR x = 1 TO 10
    PSET (y, 10 - x), picture(x, y)
  NEXT x
NEXT y
GET (1, 1)-(9, 10), errpic2
CLS

END SUB

SUB loadigerr

DIM picture(1 TO 20, 1 TO 25)  AS INTEGER
DIM x AS INTEGER
DIM y AS INTEGER
DIM z AS INTEGER

FOR y = 1 TO 25
  FOR x = 1 TO 20
    READ z
    picture(x, y) = z
    PSET (26 - y, x), picture(x, y)
  NEXT x
NEXT y
GET (1, 1)-(25, 20), igerrpic1
CLS

FOR y = 1 TO 25
  FOR x = 1 TO 20
    PSET (21 - x, 26 - y), picture(x, y)
  NEXT x
NEXT y
GET (1, 1)-(20, 25), igerrpic2
CLS

REDIM picture(26, 25)  AS INTEGER

FOR y = 1 TO 25
  FOR x = 1 TO 26
    READ z
    picture(x, y) = z
    PSET (27 - x, 26 - y), picture(x, y)
  NEXT x
NEXT y
GET (1, 1)-(26, 25), igerrpic3
CLS

END SUB

SUB loadignignokt

DIM picture(1 TO 25, 1 TO 19)  AS INTEGER
DIM x AS INTEGER
DIM y AS INTEGER
DIM z AS INTEGER

FOR y = 1 TO 19
  FOR x = 1 TO 25
    READ z
    picture(x, y) = z
    PSET (x, y), picture(x, y)
  NEXT x
NEXT y
GET (1, 1)-(25, 19), igpic1
CLS

FOR y = 1 TO 19
  FOR x = 1 TO 20
    READ z
    picture(x, y) = z
    PSET (x, y), picture(x, y)
  NEXT x
NEXT y
GET (1, 1)-(20, 19), igpic2
CLS

FOR y = 1 TO 19
  FOR x = 1 TO 20
    PSET (20 - y, x), picture(x, y)
  NEXT x
NEXT y
GET (1, 1)-(19, 20), igpic3
CLS

END SUB

SUB removebullet (num AS INTEGER)
  DIM ind AS INTEGER

  FOR ind = num TO 4
    iglfired(ind) = iglfired(ind + 1)
    iglx(ind) = iglx(ind + 1)
    igly(ind) = igly(ind + 1)
  NEXT
  iglfired(5) = 0
  iglshots = iglshots - 1

END SUB

SUB rightkey
  igx = igx + 5
  IF (igx > 290) THEN
    igx = igx - 5
  END IF

  CLS
  PUT (igx, igy), igpic1

END SUB

SUB spacekey
  IF (iglshots < 5) THEN
    iglshots = iglshots + 1
    iglfired(iglshots) = 1
    iglx(iglshots) = igx + 26
    igly(iglshots) = igy + 8
    
    LINE (iglx(iglshots), igly(iglshots))-(iglx(iglshots) + 2, igly(iglshots) + 2), 6, BF
  END IF
END SUB

SUB splash
  SCREEN 12

  PRINT "Welcome to the game of mooninites. This is like a space invader game."
  PRINT "Very simple, kill the oncoming cops, and earn points for a high "
  PRINT "score. Each raid gets progressively harder, until level 40.  Good "
  PRINT "luck in getting there. If you fail to shoot all the cops, then "
  PRINT "you'll lose a joint."
  PRINT "INPUT"
  PRINT "    Move - arrow keys"
  PRINT "    Fire - space bar"
  PRINT "    Quad Laser - b"
  PRINT "    Quit - q"
  PRINT "SCORING"
  PRINT "    Points are awarded on kills, unused quad lasers, how quickly "
  PRINT "    you get through a raid, and the highest level attained. No "
  PRINT "    points are given using a quad laser."
  PRINT "QUAD LASER"
  PRINT "    The ultimate laser weapon. Only use this when in a pinch. It "
  PRINT "    will destroy all cops on the playing."
  PRINT "BONUSES"
  PRINT "    Every 5 levels you'll recieve an extra joint. Every 10 levels "
  PRINT "    you'll recieve an extra quad laser."
  PRINT
  PRINT "CREDITS"
  PRINT "    Programmer/Graphix - Sour Swinger"
  PRINT "    Street Smarts - Clapton"
  PRINT "    Mooninite Idea - Adam Hobaugh"
  PRINT "    Space Invader Idea - Brian Madden"
  PRINT
  PRINT "SPECIAL THANKX TO PITT GEEKS & AQUA TEEN HUNGER FORCE"
  WHILE (INKEY$ = "")
  WEND
  CALL waitsome(1000, 1000)
END SUB

SUB upkey
  LINE (igx, igy)-(igx + 25, igy + 19), 0, BF

  igy = igy - 5
  IF (igy < 25) THEN
    igy = igy + 5
  END IF

  PUT (igx, igy), igpic1, PSET
END SUB

SUB waitsome (a AS INTEGER, b AS INTEGER)
  DIM ind AS INTEGER
  DIM index AS INTEGER

  FOR ind = 1 TO a
    FOR index = 1 TO b
    NEXT index
  NEXT ind
END SUB

