self := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

masm_path   := P:/lib/masm32
irvine_path := P:/lib/irvine

export PATH    := $(masm_path)/bin;$(PATH)
export INCLUDE := $(masm_path)/include;$(irvine_path)

run: hello_standalone.exe
	$<

# stupid masm argument placement
%.obj: %.asm
	ml /Zd /coff /c /Fo $@ $<

%.exe: %.obj
	link $< /entry:main /subsystem:console /libpath:$(masm_path)/lib /libpath:$(irvine_path) /out:$@

.SECONDARY:
