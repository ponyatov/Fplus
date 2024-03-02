# var
MODULE  = $(notdir $(CURDIR))

# dir
CWD  = $(CURDIR)
BIN  = $(CWD)/bin
INC  = $(CWD)/inc
SRC  = $(CWD)/src
TMP  = $(CWD)/tmp
REF  = $(CWD)/ref
GZ   = $(HOME)/gz

# tool
CURL = curl -L -o

# doc
.PHONY: doc
doc: \
	doc/R280.pdf

doc/R280.pdf:
	$(CURL) $@ https://fplusmobile.ru/upload/iblock/09a/09ab34e1123b0332298077d5dfcf03f7.PDF
