export cxx_flags := $(shell res/space_cat.exe compile_flags.txt)

.PHONY: usage
usage:
	@echo usage:
	@echo    make mn
	@echo    where mn is one of m0...m9
	@echo
	@echo    df

m*:
	@make -C $@

df:
	archive-canvas-discussion-forum --stylesheet:df/style.css --dir:df "--exclude:Cole Gannon"

.PHONY: m* df
.SILENT: m*
