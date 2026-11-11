## Books need quarto >= 1.11 to render `llms.txt`, and quarto <= 1.8 rejects
## the option, so the `llms` profile (inst/_quarto-llms.yml) is only switched
## on when the installed quarto supports it. The version is tested in the
## recipe, in portable make syntax: R CMD check warns about GNU make
## extensions in vignettes/Makefile.
all: render

render: 
	if quarto --version | awk -F. '{ exit !(($$1 > 1) || ($$1 == 1 && $$2 >= 11)) }' ; then \
	    QUARTO_PROFILE=llms quarto render ../inst/ ; \
	else \
	    quarto render ../inst/ ; \
	fi
	mkdir -p ../inst/doc && mv ../inst/docs ../inst/doc/book
