.SUFFIXES: .erl .beam

.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS = p01 p02 p03 p04 p05 p06 p07 p08 \
	p09 p10 p11 p12 p13 p14 p15 hw2_tests

all: compile

compile: ${MODS:%=%.beam}

clean:
	rm -f *.beam *.dump
