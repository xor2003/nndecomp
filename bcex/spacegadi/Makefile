CFLAGS = -lgraph
default: build
build: main
run: main-linux.o
	gcc main-linux.c -lgraph -o main-linux
	./main-linux
windows: main-windows.o
	gcc main-windows.c -lgraph -lm -o main-windows
	./main-windows