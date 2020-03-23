YMD = $(shell date +%Y-%m-%d)
LOGNAME = $(shell logname)
DATA_DIR = ./Data
DATA_FILE = $(DATA_DIR)/$(LOGNAME).$(YMD).tsv
CHART_FILE = $(DATA_DIR)/$(LOGNAME).$(YMD).png

all:: data chart

data: $(DATA_FILE)

$(DATA_FILE): my-speedtest.many
	#
	# Collect internet speed data into $(DATA_FILE)
	#
	mkdir -p $(DATA_DIR)
	./my-speedtest.many > $(DATA_FILE)

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

