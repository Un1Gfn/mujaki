.PHONY: clean

clean:
	@rm -fv out_*.md lf_*.txt

out_test4.md:test4.md
	cp -fv $< $@
	for i in {1..20}; do \
	  S="$$(printf "s|# %02d|# test4/%03d.jpg|g" "$$i" $$((i+3)))"; \
	  sed -e "$$S" -i $@; \
	done
	@echo
	@echo "  gfm $$(realpath $@)"
	@echo
