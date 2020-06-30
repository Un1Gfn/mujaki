.PHONY: clean

clean:
	@rm -fv out_*.md lf_*.txt
	@rm -fv reverse.pdf obverse.pdf
	@rm -rfv test4/

test4/:test4.rar
test4:test4.rar
test4 test4/:
	unrar x $<

obverse.pdf:test4/
	img2pdf $</*.jpg -o $@

reverse.pdf:test4/
	img2pdf $$(ls -1r $</*.jpg | xargs) -o $@

out_test4.md:test4.md
	@cp -fv $< $@
	for i in {1..20}; do \
	  S="$$(printf "s|# %02d|# test4/%03d.jpg|g" "$$i" $$((i+3)))"; \
	  sed -e "$$S" -i $@; \
	done
	@echo
	@echo "gfm $$(realpath $@)"
	@echo

text_$(shell git rev-parse --short HEAD).pdf:
	@/bin/true
	