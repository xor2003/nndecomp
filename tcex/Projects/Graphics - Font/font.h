#ifndef FONT_H_
#define FONT_H_

void f0(int x1, int y1, int l1 = 10)
{
	circle(x1, y1, l1 / 2);
}

void f1(int x1, int y1, int l1 = 10)
{
	line(x1, y1 - l1 / 2, x1, y1 + l1 / 2);
	line(x1 - l1 / 2 + l1 / 5, y1 + l1 / 2, x1 + l1 / 2 - l1 / 5, y1 + l1 / 2);
	line(x1, y1 - l1 / 2, x1 - l1 / 4, y1 - l1 / 4);
}
void f2(int x1, int y1, int l1 = 10)
{
}
void f3(int x1, int y1, int l1 = 10)
{
}
void f4(int x1, int y1, int l1 = 10)
{
}
void f5(int x1, int y1, int l1 = 10)
{
}
void f6(int x1, int y1, int l1 = 10)
{
}
void f7(int x1, int y1, int l1 = 10)
{
}
void f8(int x1, int y1, int l1 = 10)
{
	circle(x1, y1 - l1 / 3 + l1 / 10, l1 / 4);
	circle(x1, y1 + l1 / 3 - l1 / 10, l1 / 4);
}
void f9(int x1, int y1, int l1 = 10)
{
	circle(x1, y1 - l1 / 3 + l1 / 10, l1 / 3);
	line(x1 - l1 / 3, y1 + l1 / 2, x1 + l1 / 3 - l1 / 10, y1 + l1 / 2);
	line(x1 + l1 / 3, y1 - l1 / 4, x1 + l1 / 3 - l1 / 10, y1 + l1 / 2);
}

void fa(int x1, int y1, int l1 = 10)
{
	line(x1 - l1 / 2 + l1 / 10, y1 - l1 / 2, x1 + l1 / 2 - l1 / 10,
		 y1 - l1 / 2);
	line(x1 - l1 / 2, y1 - l1 / 2 + l1 / 10, x1 - l1 / 2,
		 y1 + l1 / 2 - l1 / 10);
	line(x1 + l1 / 2, y1 - l1 / 2 + l1 / 10, x1 + l1 / 2,
		 y1 + l1 / 2 - l1 / 10);
	line(x1 - l1 / 2 + l1 / 10, y1, x1 + l1 / 2 - l1 / 10, y1);
}

void fb(int x1, int y1, int l1 = 10)
{
	line(x1 - l1 / 2 - l1 / 10, y1 - l1 / 2, x1 + l1 / 2, y1 - l1 / 2);
	line(x1 - l1 / 2 - l1 / 10, y1 + l1 / 2, x1 + l1 / 2, y1 + l1 / 2);

	line(x1 - l1 / 2, y1 - l1 / 2 + l1 / 10, x1 - l1 / 2,
		 y1 + l1 / 2 - l1 / 10);
	line(x1 + l1 / 2, y1 - l1 / 2, x1 + l1 / 2, y1 + l1 / 2);

	line(x1 - l1 / 2 + l1 / 10, y1, x1 + l1 / 2, y1);
}

void fc(int x1, int y1, int l1 = 10)
{
	line(x1 - l1 / 2 + l1 / 10, y1 - l1 / 2, x1 + l1 / 2 - l1 / 10,
		 y1 - l1 / 2);
	line(x1 - l1 / 2 + l1 / 10, y1 + l1 / 2, x1 + l1 / 2 - l1 / 10,
		 y1 + l1 / 2);
	line(x1 - l1 / 2, y1 - l1 / 2 + l1 / 10, x1 - l1 / 2,
		 y1 + l1 / 2 - l1 / 10);
}

void fd(int x1, int y1, int l1 = 10)
{
	line(x1 - l1 / 2 - l1 / 10, y1 - l1 / 2, x1 + l1 / 2, y1 - l1 / 2);
	line(x1 - l1 / 2 - l1 / 10, y1 + l1 / 2, x1 + l1 / 2, y1 + l1 / 2);

	line(x1 - l1 / 2 + l1 / 10, y1 - l1 / 2 + l1 / 10, x1 - l1 / 2 + l1 / 10,
		 y1 + l1 / 2 - l1 / 10);
	line(x1 + l1 / 2, y1 - l1 / 2, x1 + l1 / 2, y1 + l1 / 2);
}

void fe(int x1, int y1, int l1 = 10)
{
	line(x1 - l1 / 2, y1 - l1 / 2, x1 - l1 / 2, y1 + l1 / 2);
	line(x1 - l1 / 2, y1 - l1 / 2, x1 + l1 / 2, y1 - l1 / 2);
	line(x1 - l1 / 2, y1, x1 + l1 / 2 - l1 / 10, y1);
	line(x1 - l1 / 2, y1 + l1 / 2, x1 + l1 / 2, y1 + l1 / 2);
}
void ff(int x1, int y1, int l1 = 10)
{
	line(x1 - l1 / 2, y1 - l1 / 2, x1 - l1 / 2, y1 + l1 / 2);
	line(x1 - l1 / 2, y1 - l1 / 2, x1 + l1 / 2, y1 - l1 / 2);
	line(x1 - l1 / 2, y1, x1 + l1 / 2 - l1 / 10, y1);
}
void fg(int x1, int y1, int l1 = 10)
{
	line(x1 - l1 / 2, y1 - l1 / 2, x1 - l1 / 2, y1 + l1 / 2);
	line(x1 - l1 / 2, y1 - l1 / 2, x1 + l1 / 2, y1 - l1 / 2);
	line(x1 - l1 / 2, y1 + l1 / 2, x1 + l1 / 2, y1 + l1 / 2);
	line(x1 + l1 / 2, y1, x1 + l1 / 2, y1 + l1 / 2);
	line(x1, y1, x1 + l1 / 2, y1);
}

void fh(int x1, int y1, int l1 = 10)
{
	line(x1 - l1 / 2, y1 - l1 / 2, x1 - l1 / 2, y1 + l1 / 2);
	line(x1 + l1 / 2, y1 - l1 / 2, x1 + l1 / 2, y1 + l1 / 2);
	line(x1 - l1 / 2, y1, x1 + l1 / 2, y1);
}
void fi(int x1, int y1, int l1 = 10)
{
	line(x1 - l1 / 2, y1 - l1 / 2, x1 + l1 / 2, y1 - l1 / 2);
	line(x1 - l1 / 2, y1 + l1 / 2, x1 + l1 / 2, y1 + l1 / 2);
	line(x1, y1 - l1 / 2, x1, y1 + l1 / 2);
}
void fj(int x1, int y1, int l1 = 10)
{
	line(x1 - l1 / 2, y1 - l1 / 2, x1 + l1 / 2, y1 - l1 / 2);
	line(x1, y1 - l1 / 2, x1, y1 + l1 / 2);
	line(x1, y1 + l1 / 2, x1 - l1 / 2, y1 + l1 / 2);
	line(x1 - l1 / 2, y1, x1 - l1 / 2, y1 + l1 / 2);
}

void f(int x1, int y1, int l1 = 10)
{
}

#endif
