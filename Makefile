
ndr_sch_files = \
	ndr-rules-conformance-target-ext.sch \
	ndr-rules-conformance-target-ins.sch \
	ndr-rules-conformance-target-ref.sch \
	ndr-rules-conformance-target-set.sch \

ndr_sch_files_for_contesa = ${ndr_sch_files:ndr-rules-%=ndr-rules-for-contesa-%}
to_contesa_xsl_file = add-contesa-info.xsl

ndr_sch_files_for_contesa_valid_sch_tokens = ${ndr_sch_files_for_contesa:%=tmp/tokens/is-valid-sch/%}


.PHONY: default
default: all

.PHONY: all # Build everything
all: ${ndr_sch_files_for_contesa}

ndr-rules-for-contesa-%: ndr-rules-% ${to_contesa_xsl_file}
	saxon --in=$< --out=$@ --xsl=${to_contesa_xsl_file}

.PHONY: help # Print this help
help:
    @ echo Available targets:
    @ sed -e 's/^.PHONY: *\([^ #]*\) *\# *\(.*\)$$/  \1: \2/p;d' Makefile

.PHONY: clean # Clean up generated stuff
clean:
	${RM} ${ndr_sch_files_for_contesa}
	${RM} -r tmp


.PHONY: valid # Validate output files
valid: ${ndr_sch_files_for_contesa_valid_sch_tokens}

tmp/tokens/is-valid-sch/%: %
	check-schematron $<
	mkdir -p $@
	touch $@




