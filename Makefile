export cxx_flags := $(shell res/space_cat.exe compile_flags.txt)

.PHONY: usage
usage:
	@echo usage:
	@echo    make mn
	@echo    where mn is one of m0...m9

.PHONY: m*
.SILENT: m*
m*:
	@make -C $@
