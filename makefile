.EXPORT_ALL_VARIABLES:
P=binIO
PD=debug
S=assembly
T=test
EXT_SOURCES= binIO.cpp
EXT_OBJECTS= binIO.o
EXT_ASSEMBL=
SOURCES= $(EXT_SOURCES)
OBJECTS= $(EXT_OBJECTS)
ASSEMBL= $(EXT_ASSEMBL)
T_SOURCES=tests.cpp $(EXT_SOURCES)
T_OBJECTS=tests.o $(EXT_OBJECTS)
DFLAGS= -Wall -ggdb -O0 -std=c++17 -D_GLIBCXX_DEBUG
CFLAGS= -Wall       -Os -std=c++17
LDLIBS= -L$(ORIGIN) -lbinIO -lssl -lcrypto
CC=g++
AR=ar

$(P): $(P).o
	$(AR) rcs $(P).lib $(OBJECTS)

$(P).o: $(SOURCES)
	$(CC) $(CFLAGS) -c -o $(OBJECTS) $(SOURCES)

$(PD): $(PD).o
	$(CC) -o $(PD) $(OBJECTS) $(LDLIBS)

$(PD).o: $(SOURCES)
	$(CC) $(DFLAGS) -c $(SOURCES)

$(T): $(T).o $(P)
	$(CC) -o $(T) $(T_OBJECTS) $(LDLIBS)

$(T).o: $(T_SOURCES)
	$(CC) $(DFLAGS) -c $(T_SOURCES)

$(S): $(OBJECTS)
	$(CC) $(CFLAGS) $(LDLIBS) -fverbose-asm -S $(SOURCES)

clean:
	rm *.o *.exe *.lib $(OBJECTS) $(P) $(PD) $(T) $(ASSEMBL)
