.PHONY: all

all: switch.bytecode if.bytecode

%.bytecode: %.js
	node --print-bytecode --print-bytecode-filter=fn $< > $@
