#ifndef H_MSMOUSE
#define H_MSMOUSE

// Define estilos de cursor de mouse gr†fico.

struct HotSpotStruct {
	int X;
	int Y;
};

struct MouseCursor {
	HotSpotStruct HotSpot;
	unsigned ScreenMask[16];
	unsigned CursorMask[16];
};

extern const MouseCursor ArrowCursor;
extern const MouseCursor HandCursor;
extern const MouseCursor LeftRightCursor;
extern const MouseCursor UpDownCursor;

// C¢digos de eventos de mouse.

const unsigned Idle = 0x0000;
const unsigned MouseDown = 0xFF01;
const unsigned LMouseDown = 0xFF01;
const unsigned RMouseDown = 0xFF02;
const unsigned MouseStillDown = 0xFF04;

const unsigned LMouseStillDown = 0xFF04;
const unsigned RMouseStillDown = 0xFF08;
const unsigned MouseUp = 0xFF10;
const unsigned LMouseUp = 0xFF10;
const unsigned RMouseUp = 0xFF20;
const unsigned MouseEnter = 0xFF40;
const unsigned MouseLeave = 0xFF80;
const unsigned MouseWithin = 0xFFC0;

// M†scaras de bot∆o de mouse.

const unsigned LeftButton = 0x0001;
const unsigned RightButton = 0x0002;

// Os modos de v°deo sob os quais o mouse est† rodando.

enum VideoModeType {
	TextScreen,
	LowResGr,
	HerculesGr,
	Graphics
};

// A classe do mouse
class MouseObject {
protected:
	int OldX;
	int OldY;
	char Ok;
	char MouseOff;
	char LowRes;
	char TextMode;

public:
	int X;
	int Y;
	int Dx;
	int Dy;

	MouseObject(void);
	void Setup(VideoModeType VideoMode);
	int DriverExists(void);
	int SetupOk(void);
	void Hide(void);
	void Show(void);
	unsigned Status(int &Mx, int &My);
	unsigned ButtonStatus(void);
	int PressCnt(unsigned ButtonMask);
	int ReleaseCnt(unsigned ButtonMask);
	unsigned Event(int &Mx, int &My);
	unsigned WaitForAnyEvent(int &Mx, int &My);
	void WaitForEvent(unsigned E, int &Mx, int &My);
	int Moved(void);
	void Move(int Mx, int My);
	void TurnOn(void);
	void TurnOff(void);
	int Operating(void);
	void SetGCursor(const MouseCursor &NewCursor);
};

extern MouseObject Mouse;

#endif
