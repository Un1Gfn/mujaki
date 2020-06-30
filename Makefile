.PHONY: clean

clean:
	@rm -fv out_*.md lf_*.txt
	@rm -fv rev.pdf obv.pdf
	@rm -rfv test4/

test4:test4.rar
	unrar x $<

obv.pdf:test4/
	img2pdf $</*.jpg -o $@

rev.pdf:test4/
	img2pdf $$(ls -1r $</*.jpg | xargs) -o $@

out_test4.md:test4.md
	@cp -fv $< $@
	for i in {1..20}; do \
	  S="$$(printf "s|# %02d|# test4/%03d.jpg|g" "$$i" $$((i+3)))"; \
	  sed -e "$$S" -i $@; \
	done
	@echo
	@echo "  gfm $$(realpath $@)"
	@echo

text_$(shell git rev-parse --short HEAD).pdf:
	@/bin/true
	