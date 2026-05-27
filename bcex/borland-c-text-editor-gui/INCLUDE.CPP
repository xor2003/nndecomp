//standard library files
#include <iostream.h>
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <fstream.h>

//global define directives
#define ACTIVE 1
#define INACTIVE 0

//menu activation
int mainM = INACTIVE;
int fileM = INACTIVE;
int editM = INACTIVE;
int searchM = INACTIVE;
int runM = INACTIVE;
int compileM = INACTIVE;
int helpM = INACTIVE;

//window activation
int newW = INACTIVE;
int openW = INACTIVE;

//include files
#include "GRAPHIC.CPP"
#include "MENU.CPP"
#include "WINDOW.CPP"
