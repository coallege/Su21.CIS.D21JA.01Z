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

PATH := $(PATH);node_modules/.bin

df:
	archive-canvas-discussion-forum --stylesheet:df/style.css --dir:df "--exclude:Cole Gannon"
	node df/genIndex

.PHONY: m* df
.SILENT: m*
