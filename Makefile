RM := rm -f

define run-diff
diff --width 140 --side-by-side --minimal $^ > $@ || :
endef

src := $(wildcard *.js)
diff := $(wildcard *.diff)
bytecode := $(wildcard *.bytecode)

.PHONY: all clean bytecode

all: code.diff bytecode.diff


# Cleanup

clean:
	$(RM) $(diff) $(bytecode)


# Compare code

code.diff: switch.js if.js
	$(run-diff)


# Generate bytecode

bytecode: $(src:.js=.bytecode)

%.bytecode: %.js
	node --print-bytecode --print-bytecode-filter=fn $< | tail -n +6 | head -n -2 | perl -p -e 's/^.*?@\s*\d+ : //' > $@

bytecode.diff: switch.bytecode if.bytecode
	$(run-diff)
