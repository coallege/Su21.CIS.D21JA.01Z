masm_path   := P:/lib/masm32
irvine_path := P:/lib/irvine

export PATH    := $(masm_path)/bin;$(PATH)
export INCLUDE := $(masm_path)/include;$(irvine_path)

run~%: %.exe
	$*.exe

# stupid masm argument placement
%.obj: %.asm
	ml /Zd /coff /c /Fo $@ $<

# link $< /entry:main /subsystem:console /libpath:$(masm_path)/lib /libpath:$(irvine_path) /out:$@
%.exe: %.obj
	link $< /subsystem:console /libpath:$(irvine_path) /out:$@

.SECONDARY:
