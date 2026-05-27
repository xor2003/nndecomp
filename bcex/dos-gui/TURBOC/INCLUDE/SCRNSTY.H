#ifndef H_SCRNSTY
#define H_SCRNSTY

// Defini‡äes de estilo de tela.

inline unsigned char ForeGround(unsigned char attr)
{
	return attr & 0x0F;
}

inline unsigned char BackGround(unsigned char attr)
{
	return (attr >> 4) & 0x0F;
}

enum LineChar
{
	Ulc,
	Llc,
	Urc,
	Lrc,
	LTee,
	RTee,
	UpTee,
	DnTee,
	HzBar,
	VtBar
};

extern char LineChars[4][10];

enum ScrollDir
{
	UpScroll,
	DnScroll,
	LeftScroll,
	RightScroll
};

struct ColorPack
{
	unsigned char Bc;
	unsigned char Wc;
	unsigned char Tc;
	unsigned char Pc;
	unsigned char Fc;
};

// Estilos de margens.
const int NoBorder = 0x00; // Tanto para texto como para gr fico.
const int Single = 0x10; // Para modo texto.
const int Double = 0x20; // Para modo texto.
const int Dashed = 0x30; // Para modo texto.
const int Solid = 0x10; // Para modo gr fico.
const int Recessed = 0x20; // Para modo gr fico.
const int Relief = 0x30; // Para modo gr fico.

// Estilos de quadro.
const int Swappable = 0x01;
const int Closeable = 0x02;
const int SEShadow = 0x04;
const int NEShadow = 0x08;
const int NWShadow = 0x10;
const int SWShadow = 0x20;
const int OutlineMove = 0x40;
const int BorderPrompt = 0x80;
const int Stretchable = 0x100;

// M scara de bit de sombreado.

const int AnyShadow = SEShadow + NEShadow + NWShadow + SWShadow;

// Conjunto pr‚-definido de pacotes de cores e estilos.

extern ColorPack BlueColors;
extern ColorPack CyanColors;
extern ColorPack RedColors;
extern ColorPack InvColors;
extern ColorPack MonoColors;
extern ColorPack ErrColors;
extern ColorPack MsgColors;
extern ColorPack GrphColors;
extern ColorPack DefColors;

extern int WithShadow;
extern int WindowStyle;
extern int ButtonStyle;

#endif
