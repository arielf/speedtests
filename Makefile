YMD = $(shell date +%Y-%m-%d)
LOGNAME = $(shell logname)
DATA_FILE = $(LOGNAME).$(YMD).tsv
CHART_FILE = $(LOGNAME).$(YMD).png

all:: data chart

data: my-speedtest.many
	#
	# Collect internet speed data into $(DATA_FILE)
	#
	./my-speedtest.many > $(DATA_FILE)


chart: speedtests.R $(DATA_FILE)
	#
	# Generate scatter-plot from $(DATA_FILE)
	#
	speedtests.R $(DATA_FILE)

