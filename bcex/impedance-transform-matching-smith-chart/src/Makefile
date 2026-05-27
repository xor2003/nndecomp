# Makefile for test IMPEDANCE TRANSFORM AND MATCHING BY SMITH CHART	program
PROGRAM = impedance-transform
SOURCES = main.cpp menu.cpp stuble.cpp

# C compiler: gcc
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra -Wno-write-strings -std=c++98 -Wpedantic -O2

# Libraries to link
LIBS = ../third_party/sdl-bgi/SDL_bgi.o -lSDL2 -lm

all: $(PROGRAM)

$(PROGRAM): $(SOURCES) SDL_bgi.o
	$(CC) $(CFLAGS) $(SOURCES) -o $(PROGRAM) $(LIBS)

SDL_bgi.o:
	make -C ../third_party/sdl-bgi $@

clean:
	make -C ../third_party/sdl-bgi clean
	rm -f ${PROGRAM} *.o
