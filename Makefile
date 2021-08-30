LD = gcc
CC = gcc

BLUE=\033[0;34m
GREEN=\033[;32m
YELLOW=\033[;33m
NC=\033[0m

CFLAGS := \
	-Isrc/include \
	-Wall \
	-Wextra \
	-Wno-unused-value\
	-Wno-unused-parameter\
	-Wno-return-type\
	-std=gnu99 \

CFILES := $(shell find src/ -name '*.c')
OFILES := $(CFILES:.c=.o)

TARGET = cheese

all: welcome clean compile

welcome:
	@ echo "   .::."
	@ echo "   _::_"
	@ echo " _/____\_"
	@ echo " \      /"
	@ echo "  \____/"
	@ echo "  (____)"
	@ echo "   |  |  C H E E S E"
	@ echo "   |__|  C H E S S"
	@ echo "  /    \\"
	@ echo " (______)"
	@ echo "(________)"
	@ echo "/________\\"
	@ echo ""

compile: ld
	@ echo "Done!"
	
ld: $(OFILES)
	@ echo -e "${GREEN}[ LD ]${NC} $^"
	@ $(LD) $^ -o $(TARGET)

%.o: %.c
	@ echo -e "${BLUE}[ CC ]${NC} $<"
	@ $(CC) $(CFLAGS) -c $< -o $@

clean:
	@ echo -e "${YELLOW}[ CLEAN ]${NC}"
	@ rm -rf $(OFILES) $(TARGET)

run:
	@ ./cheese

install:
	@ echo "Installing..."
	@ cp ./cheese /usr/bin
	@ echo "Done!"
