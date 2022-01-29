# sysstat - X keyboard helper
# See LICENSE file for copyright and license details.

# sysstat version
VERSION = 1.0

# Programm name
NAME = wxkbd

# Includes and libs
LIBS = xcb xcb-xinput xcb-xkb
INCS = `pkg-config --cflags --libs ${LIBS}`

# Flags
CPPFLAGS = -DVERSION=\"${VERSION}\" -DNAME=\"${NAME}\" -D_POSIX_C_SOURCE=200809L
CFLAGS = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}

# Enable debugging symbols
ifdef DEBUG
	CFLAGS += -g
endif

# Compiler and linker
CC ?= cc

# Source files
SRC = wxkbd.c

all: options ${NAME}

options:
	@echo ${NAME} build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "CC       = ${CC}"

$(NAME): ${SRC}
	@${CC} -o ${NAME} ${SRC} ${CFLAGS}

install: all
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f ${NAME} ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/${NAME}

clean:
	@echo Cleaning
	@rm -f ${NAME}

.PHONY: all options install clean
