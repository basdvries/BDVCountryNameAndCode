CC = clang
GCC_OBJC_INCLUDE = $(shell ls -d /usr/lib/gcc/x86_64-linux-gnu/*/include 2>/dev/null | tail -1)
OBJC_FLAGS = $(shell gnustep-config --objc-flags) -I$(GCC_OBJC_INCLUDE)
OBJC_LIBS = $(shell gnustep-config --objc-libs) -lgnustep-base

SRC_DIR = .
TEST_BINARY = run_tests
PLIST = $(SRC_DIR)/BDVCountryNameAndCode.plist

SOURCES = $(SRC_DIR)/BDVCountryNameAndCode.m $(SRC_DIR)/BDVCountryNameAndCodeTests.m

.PHONY: test clean

test: $(TEST_BINARY)
	./$(TEST_BINARY) $(PLIST)

$(TEST_BINARY): $(SOURCES) $(SRC_DIR)/BDVCountryNameAndCode.h
	$(CC) $(OBJC_FLAGS) -o $@ $(SOURCES) $(OBJC_LIBS)

clean:
	rm -f $(TEST_BINARY)
