# textmail - mail filter to replace MS Word/HTML attachments with plain text
#
# Copyright (C) 2003-2007, 2011, 2020-2023 raf <raf@raf.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, see <https://www.gnu.org/licenses/>.
#
# 20230313 raf <raf@raf.org>

NAME := textmail
VERSION := 1.1
DIST := $(NAME)-$(VERSION)
DISTDIR := ../$(DIST)
DISTFILE := ../$(DIST).tar.gz

# PREFIX := $(DESTDIR)/usr
PREFIX := $(DESTDIR)/usr/local
BINDIR := $(PREFIX)/bin
BINFILES := $(NAME)
MANDIR := $(shell [ -d $(PREFIX)/share/man ] && echo $(PREFIX)/share/man/man1 || echo $(PREFIX)/man/man1)
MANFILES := $(NAME).1.gz
HTMLFILES := $(NAME).1.html
DISTFILES := README.md CHANGELOG COPYING INSTALL LICENSE Makefile $(BINFILES) $(MANFILES) $(HTMLFILES)

INSTFILES := \
	$(patsubst %, $(BINDIR)/%, $(BINFILES)) \
	$(patsubst %, $(MANDIR)/%, $(MANFILES))

help:
	@echo "This Makefile supports the following targets:"; \
	echo; \
	echo "  help       - Print this message (default)"; \
	echo "  install    - Install $(NAME) and its manpage"; \
	echo "  uninstall  - Uninstall $(NAME) and its manpage"; \
	echo "  man        - Create the nroff manpage"; \
	echo "  clean-man  - Delete the nroff manpage"; \
	echo "  html       - Create the html manpage"; \
	echo "  clean-html - Delete the html manpage"; \
	echo "  test       - Run all tests"; \
	echo "  check      - Same as test"; \
	echo "  clean-test - Delete test output"; \
	echo "  clean      - Delete the nroff/html manpages and test output"; \
	echo "  clobber    - Same as clean"; \
	echo "  distclean  - Same as clean"; \
	echo "  dist       - Create the distribution tarball $(DISTFILE)"; \
	echo

install: $(INSTFILES)

uninstall:
	rm -f $(INSTFILES)

$(BINDIR)/%: %
	[ -d $(BINDIR) ] || mkdir -m 755 -p $(BINDIR)
	install -m 755 $< $@

$(MANDIR)/%: %
	[ -d $(MANDIR) ] || mkdir -m 755 -p $(MANDIR)
	install -m 644 $< $@

man: $(MANFILES)

%.1.gz: %
	./$< -r | gzip > $@

clean-man:
	rm -f $(MANFILES)

html: $(HTMLFILES)

%.1.html: %
	./$< -w > $@

clean-html:
	rm -f $(HTMLFILES)

test:
	./run-tests

check: test

clean-test:
	rm -rf test-out/out.* test-in-all test-out-all test-out-good-all test-out-all.diff test-out-saved

clean: clean-man clean-html clean-test

clobber: clean

distclean: clean

dist: man html
	mkdir $(DISTDIR)
	cp -p $(DISTFILES) $(DISTDIR)
	tar czf $(DISTFILE) $(DISTDIR)
	rm -rf $(DISTDIR)
	tar tzvf $(DISTFILE)

# vi:set ts=4 sw=4:
