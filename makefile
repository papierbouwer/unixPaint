.PHONY : default run clean all

VALAC=valac
VALAFILES=main.vala ClosingFile.vala
VALAPKGS=--pkg gtk+-3.0 --pkg gmodule-2.0
VALAPTS=

EXEC=main

default:
	$(VALAC) $(VALAFILES) -o $(EXEC) $(VALAPKGS) $(VALAOPTS)

run:
	./$(EXEC)

clean:
	rm -rf ./$(EXEC)

all: default run

cc : 
	$(VALAC) -C $(VALAFILES) -o $(EXEC) $(VALAPKGS) $(VALAOPTS)

debug :
	$(VALAC) -g --save-temps $(VALAFILES) -o $(EXEC) $(VALAPKGS) $(VALAOPTS)
	gdb $(EXEC)

