NAMA ?= PangKernel

DATE := $(shell date "+%Y%m%d")

DEVICE := earth

ZIP := $(NAMA)-$(DEVICE)-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md* *.zip* 

normal: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."


clean:
	@rm -vf *.zip*
	@rm -vf zImage
	@rm -vf modules/vendor/lib/modules/*.ko
	@rm -vf modules/vendor/lib/modules/pronto/*.ko
	@echo "Done."
