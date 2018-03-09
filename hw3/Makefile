.SUFFIXES: .erl .beam

.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS = bs01 bs02 bs03 hw3_test

all: compile

compile: ${MODS:%=%.beam}

clean:
	rm -r *.beam *.dump
