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

# install
.PHONY: install update gz ref
install: doc gz
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -yu `cat apt.txt`
gz:
ref:

# merge
MERGE += Makefile README.md apt.txt LICENSE
MERGE += .clang-format .editorconfig .doxygen .gitignore
MERGE += .vscode bin doc lib inc src tmp ref fw

.PHONY: dev
dev:
	git push -v
	git checkout $@
	git pull -v
	git checkout shadow -- $(MERGE)

.PHONY: shadow
shadow:
	git push -v
	git checkout $@
	git pull -v

.PHONY: release
release:
	git tag $(NOW)-$(REL)
	git push -v --tags
	$(MAKE) shadow

.PHONY: zip
zip:
	git archive \
		--format zip \
		--output $(TMP)/$(MODULE)_$(NOW)_$(REL).src.zip \
	HEAD
