# MotifSim
An OSF/Motif look-alike library for Microsoft Quick C programs

Copyright (c) 2022, Michael Robinson

## Synopsis

This is the source code for a GUI frontend for DOS programs written in Microsoft QuickC.  I was very taken with the aesthetic of OSF/Motif, which explains the name `MotifSim`.  The library is inspired by the design presented in the OSF/Motif Style Guide version 1.2:

[https://www.amazon.com/Osf-Motif-Style-Guide-Revision/dp/0136431232]

The API my library presents is rather different than what is presented by the actual standard, since I wrote it according to my own needs.

This library is most of historical interest because the libraries are heavily dependent on the Microsoft QuickC `<graph.h>` and `<conio.h>` libraries.  The executables "might" work on an emulator, but I haven't succeeded at getting them to show anything in DOSBox.  I have also not succeeded at getting them to build on a modern compiler.

## Libraries

There are two related library C files:

* `motfsm.c` : This is the basic library providing GUI and windowing capability
* `motfad.c` : This is an add-on library for providing standardized dialog boxes of various sorts

## Example programs

Several example programs are included to show how the library was intended to be used.

* `mottest.c` : Program to verify if MotifSim will work on a given system
* `dlb.c` : A demonstration of the `FileSelectionDialog`
* `mots1.c` : Various basic drawing tests
* `motsho.c` : General silliness
* `tgui1.c` : More silliness, showing conversational dialogs
* `tgui2.c` : A very basic test
* `tgui3.c` : Another very basic test

Makefiles with extension `.mak` are included.  Where I found DOS `.exe` files on my old development computer, they are included as well.