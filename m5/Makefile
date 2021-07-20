masm_path   := P:/lib/masm32
irvine_path := P:/lib/irvine

export PATH    := $(masm_path)/bin;$(PATH)
export INCLUDE := $(masm_path)/include;$(irvine_path)

%.obj: %.asm
	ml /Zd /coff /c /Fo $@ $<

%.exe: %.obj
	link $< /subsystem:console /libpath:$(irvine_path) /out:$@

run~%: %.exe
	$*.exe

.SECONDARY:
