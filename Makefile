BUILD_DIR := build
SRC_DIR := src
SRC_RU := $(SRC_DIR)/ezamriy.ru.adoc
BASE_NAME_RU := $(basename $(notdir $(SRC_RU)))
PDF_OUT_RU := $(BUILD_DIR)/$(BASE_NAME_RU).pdf
HTML_OUT_RU := $(BUILD_DIR)/$(BASE_NAME_RU).html
PDF_THEME := theme/ezamriy-cv.yml
HTML_THEME := theme/ezamriy-cv.css

.PHONY: all pdf html clean

all: pdf html

pdf: $(PDF_OUT_RU)
html: $(HTML_OUT_RU)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(PDF_OUT_RU): $(SRC_RU) $(PDF_THEME) | $(BUILD_DIR)
	bundle exec asciidoctor-pdf -a pdf-theme=$(PDF_THEME) -o $@ $<

$(HTML_OUT_RU): $(SRC_RU) $(HTML_THEME) | $(BUILD_DIR)
	bundle exec asciidoctor -b html5 -o $@ $<

clean:
	rm -rf $(BUILD_DIR)
