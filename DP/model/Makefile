# =============================================================================
#  Golden model DP - překlad testů, nástrojů a generování konstant (PC / Ababel)
#  make test     - unit testy lib_imgproc (bez OpenCV)
#  make verify   - porovnání s OpenCV (python3 + opencv-python + numpy)
#  make gen      - vygeneruje generated/imgproc_coeffs.h a generated/imgproc_coeffs_pkg.vhd
#  make cli      - nástroj imgproc_cli pro testovací data (PPM/PGM -> HEX)
#  make all      - vše výše kromě verify
# =============================================================================

CC      ?= gcc
CFLAGS  := -std=c11 -O2 -Wall -Wextra -Wpedantic -Wconversion -Wsign-conversion -Wshadow -Werror
LIB     := lib_imgproc
INC     := -I$(LIB) -I$(LIB)/template -Itools
SRC     := $(wildcard $(LIB)/imgproc/*.c)
BUILD   := build
GEN     := generated

.PHONY: all test verify gen cli clean

all: test gen cli

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/test_imgproc: $(SRC) $(LIB)/test/test_imgproc.c | $(BUILD)
	$(CC) $(CFLAGS) $(INC) $^ -lm -o $@

$(BUILD)/libimgproc.so: $(SRC) | $(BUILD)
	$(CC) $(CFLAGS) -shared -fPIC $(INC) $^ -lm -o $@

$(BUILD)/gen_coeffs: $(SRC) tools/gen_coeffs.c tools/pc_file.c | $(BUILD)
	$(CC) $(CFLAGS) $(INC) $^ -lm -o $@

$(BUILD)/imgproc_cli: $(SRC) tools/imgproc_cli.c tools/pc_file.c | $(BUILD)
	$(CC) $(CFLAGS) $(INC) $^ -lm -o $@

test: $(BUILD)/test_imgproc
	./$(BUILD)/test_imgproc

verify: $(BUILD)/libimgproc.so
	python3 $(LIB)/test/verify_opencv.py $(BUILD)/libimgproc.so

gen: $(BUILD)/gen_coeffs
	mkdir -p $(GEN)
	./$(BUILD)/gen_coeffs $(GEN)

cli: $(BUILD)/imgproc_cli

clean:
	rm -rf $(BUILD)
