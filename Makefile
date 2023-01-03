MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables

YMD = $(shell date +%Y-%m-%d)
LOGNAME = $(shell logname || echo "$$LOGNAME" || echo "$$USER")
DATA_DIR = Data
DATA_FILE = $(DATA_DIR)/$(LOGNAME).$(YMD).tsv
CHART_FILE = $(DATA_DIR)/$(LOGNAME).$(YMD).png

all:: prereqs data chart

#
# The only suffixes we care about
#
.SUFFIXES:
.SUFFIXES: .tsv .png

prereqs:
	./check-prereqs

data: $(DATA_FILE)

$(DATA_FILE): my-speedtest.many
	#
	# Collect internet speed data into $(DATA_FILE)
	#
	mkdir -p $(DATA_DIR)
	./my-speedtest.many > $(DATA_FILE).tmp && \
		mv $(DATA_FILE).tmp $(DATA_FILE)

chart: speedtests.R $(DATA_FILE)
	#
	# Generate upload+download speed scatter-plot from $(DATA_FILE)
	#
	./speedtests.R $(DATA_FILE)

distchart dc: distance-vs-speed.R $(DATA_FILE)
	#
	# Generate distance-vs-download speed scatter-plot from $(DATA_FILE)
	#
	./distance-vs-speed.R $(DATA_FILE)

