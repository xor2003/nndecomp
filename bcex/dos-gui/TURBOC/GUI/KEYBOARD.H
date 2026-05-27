#ifndef H_KEYBOARD
#define H_KEYBOARD

#include <bios.h>

// M scara de status de Shift.
const unsigned InsertOn = 0x80;
const unsigned CapsLkOn = 0x40;
const unsigned NumLkOn = 0x20;
const unsigned ScrollLkOn = 0x10;
const unsigned AltPressed = 0x08;
const unsigned CtrlPressed = 0x04;
const unsigned LShiftPressed = 0x02;
const unsigned RShiftPressed = 0x01;

// C¢digos comum de varredura ASCII.

const unsigned CtrlC = 0x2E03;
const unsigned CtrlH = 0x2308;
const unsigned CtrlI = 0x1709;
const unsigned CtrlL = 0x260C;
const unsigned CtrlK = 0x250B;
const unsigned CtrlJ = 0x240A;
const unsigned CtrlU = 0x1615;
const unsigned CtrlR = 0x1312;
const unsigned CrKey = 0x1C0D;
const unsigned CtrlCrKey = 0x1C0A;
const unsigned UpKey = 0x4800;
const unsigned DownKey = 0x5000;
const unsigned LeftKey = 0x4B00;
const unsigned RightKey = 0x4D00;
const unsigned ShiftLeft = 0x4B34;
const unsigned ShiftRight = 0x4D36;
const unsigned DelKey = 0x5300;
const unsigned InsKey = 0x5200;
const unsigned BsKey = 0x0E08;
const unsigned SpaceBar = 0x3920;
const unsigned PgUpKey = 0x4900;
const unsigned PgDnKey = 0x5100;
const unsigned CtrlPgUp = 0x8400;
const unsigned CtrlPgDn = 0x7600;
const unsigned ShiftUpKey = 0x4838;
const unsigned ShiftDnKey = 0x5032;
const unsigned ShiftPgUpKey = 0x4939;
const unsigned ShiftPgDnKey = 0x5133;
const unsigned HomeKey = 0x4700;
const unsigned EndKey = 0x4F00;
const unsigned EscKey = 0x011B;
const unsigned TabKey = 0x0F09;
const unsigned ShiftTabKey = 0x0F00;
const unsigned AltD = 0x2000;
const unsigned AltE = 0x1200;
const unsigned AltI = 0x1700;
const unsigned AltN = 0x3100;
const unsigned AltR = 0x1300;
const unsigned AltS = 0x1F00;
const unsigned AltT = 0x1400;
const unsigned AltX = 0x2D00;
const unsigned F6Key = 0x4000;
const unsigned F8Key = 0x4200;
const unsigned F10Key = 0x4400;

extern unsigned KeyEvent(void);
extern int IsShiftArrow(unsigned K);

#endif
