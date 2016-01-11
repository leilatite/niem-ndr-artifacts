
schematron_files := ${wildcard *.sch}
schematron_xslt_files := ${schematron_files:%=%.xsl}

all: ${schematron_xslt_files}

%.sch.xsl: %.sch
	schematron-compile --output-file=$@ $<

