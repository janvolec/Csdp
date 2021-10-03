#
# This Makefile can be used to automatically build the entire package.  
#
# If you make changes in the Makefile or code under any subdirectory, you can
# rebuild the system with "make clean" followed by "make all".
#
#
# You can change the C compiler by setting CC=...
#
# CC=gcc
#
# CFLAGS settings for 64 bit Linux/unix systems.
#
export CFLAGS=-m64 -march=native -mtune=native -Ofast -fopenmp -ansi -Wall -DBIT64 -DUSEOPENMP -DSETNUMTHREADS -DUSESIGTERM -DUSEGETTIME -I../include
#
# LIBS settings for 64 bit Linux/unix systems.
#
export LIBS=-static -L../lib -lsdp -L/usr/local/lib/ -lopenblas -lm
#
#
# On most systems, this should handle everything.
#
all:
	cd lib; $(MAKE) libsdp.a
	cd solver; $(MAKE) csdp
	cd theta; $(MAKE) all
	cd example; $(MAKE) all

#
# Perform a unitTest
#

unitTest:
	cd test; $(MAKE) all

#
# Install the executables in /usr/local/bin.
#

install:
	cp -f solver/csdp /usr/local/bin
	cp -f theta/theta /usr/local/bin
	cp -f theta/graphtoprob /usr/local/bin
	cp -f theta/complement /usr/local/bin
	cp -f theta/rand_graph /usr/local/bin

#
# Clean out all of the directories.
# 

clean:
	cd lib; $(MAKE) clean
	cd solver; $(MAKE) clean
	cd theta; $(MAKE) clean
	cd test; $(MAKE) clean
	cd example; $(MAKE) clean








