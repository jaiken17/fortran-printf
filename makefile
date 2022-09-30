CXX = gcc
CFLAGS = -c -o
FORT = gfortran
FFLAGS = -o

VPATH=c_source:interface

OBJS = printf_fort.obj printf.obj

main: main.f90 $(OBJS)
	$(FORT) $(FFLAGS) $@ $?

printf_fort.obj: printf_interf.f90 printf.obj
	$(FORT) $(CFLAGS) $@ $<

printf.obj: printf.c printf.h
	$(CXX) $(CFLAGS) $@ $<

clean:
	rm main $(OBJS)