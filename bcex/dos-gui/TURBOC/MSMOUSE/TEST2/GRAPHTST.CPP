#include <stdlib.h>
#include <conio.h>
#include <graphics.h>
#include <msmouse.h>

int Err;
int Mx;
int My;
int Gd;
int Gm;
int Quad;
int OldQuad;
unsigned E;

void main(void)
{
	Gd = DETECT;
	initgraph(&Gd, &Gm, "BGI");
	if (graphresult() != grOk) {
		cprintf(" necess rio um adaptador gr fico para este programa.\n");
		exit(-1);
	}

	moveto(getmaxx() / 2, 0);
	lineto(getmaxx() / 2, getmaxx());
	moveto(0, getmaxy() / 2);
	lineto(getmaxx(), getmaxy() / 2);
	outtextxy(1, 1, "ArrowCursor");
	outtextxy((getmaxx() / 2) + 4, 1, "HandCursor");
	outtextxy(1, (getmaxy() / 2) + 4, "LeftRightCursor");
	outtextxy((getmaxx() / 2) + 4, (getmaxy() / 2) + 4, "UpDownCursor");
	Mouse.Setup(Graphics);

	if (!Mouse.Operating()) {
		closegraph();
		cprintf("Mouse nÆo detectado.\n");
		exit(-1);
	}

	Mouse.SetGCursor(ArrowCursor);
	OldQuad = 1;
	Quad = 1;

	do {
		E = Mouse.Event(Mx, My);
		if (Mx > getmaxx() / 2) {
			if (My > getmaxy() / 2) {
				Quad = 4;
			} else {
				Quad = 2;
			}
		} else {
			if (My > getmaxy() / 2) {
				Quad = 3;
			} else {
				Quad = 1;
			}
		}

		if (Quad != OldQuad) {
			switch(Quad) {
				case 1:
					Mouse.SetGCursor(ArrowCursor);
					break;
				case 2:
					Mouse.SetGCursor(HandCursor);
					break;
				case 3:
					Mouse.SetGCursor(LeftRightCursor);
					break;
				case 4:
					Mouse.SetGCursor(UpDownCursor);
					break;
			};
		}

		OldQuad = Quad;
	} while(E != MouseDown);

	Mouse.TurnOff();
	closegraph();
}
