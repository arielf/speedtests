#!/usr/bin/Rscript
#
# Plot internet speed-test data vs various data-centers
#
library(ggplot2)
library(data.table)
library(ggthemes)
library(scales)         # for pretty_breaks()

eprintf <- function(...) cat(sprintf(...), sep='', file=stderr())
systemf <- function(...) system(sprintf(...))
abspath <- function(files) file.path(normalizePath(dirname(files)), files)
ymd     <- function() format(Sys.time(), "%Y-%m-%d")
mony    <- function() format(Sys.time(), "%b %Y")
Args    <- commandArgs(trailingOnly=F)
argv0   <- basename(
                gsub('(^--file=|\\.R$)', '',
                    grep('^--file=', Args, value=T)))

# Data-file (last *.tsv arg)
argvN   <- Args[length(Args)]
#--#
eprintf("argvN=%s\n", argvN)

# I use a certain utility to view on Linux, YMMV
Viewer = 'nomacs'

ChartFile = sprintf("%s.png", if (nchar(argvN)) argvN else argv0)

Title = 'Speed Test Data\n(circle-size: log(pingtime))'

Xlab = 'Upload speed (Mbit/sec)'
Ylab = 'Download speed (Mbit/sec)'

DPI = 192
Units = 'cm'
Width = 20 
Height = 16

MyColors = c(
    'red', 'green', 'pink', 'skyblue', 'grey70',
    'magenta', 'orangered2', 'violet', 'chartreuse', 'darkorange1',
    'mediumpurple1', 'orange', 'thistle1', 'dodgerblue1', 'dodgerblue3',
    'deeppink', 'forestgreen', 'gold', 'gold2', 'orchid1',
    'deeppink2'
)

theme_mine <- function() {
    theme(
      text              = element_text(size=8, family="Free Sans"),
      axis.ticks        = element_line(color='grey40'),
      axis.text         = element_text(color='grey40', face='bold'),

      plot.title        = element_text(color='#000000',
                                       face='bold.italic',
                                       hjust=0.5),      # Horiz-center title
      axis.title.x      = element_text(face='bold.italic', size=8),
      axis.title.y      = element_text(face='bold.italic', size=8, angle=90),

      legend.text       = element_text(face='bold.italic', size=6),

      # shrink the legend area around circle:
      legend.key.size   = unit(1.0, 'line')
    )
}

#
# Read the data into a data.table
#
column_names = c('DateTime', 'Ping', 'Up', 'Down', 'Provider')
data_cmd <- sprintf("grep '^[1-9]' %s", argvN)
d = fread(cmd=data_cmd, sep='\t', h=F)
setnames(d, column_names)

g <- ggplot(d, aes(x=Up, y=Down, label=Provider, fill=Provider)) +
    ggtitle(Title) +
    # theme(plot.title=element_text(hjust=0.5)) +
    xlab(Xlab) +
    ylab(Ylab) +
    geom_point(
        pch=21,
        size=2.0*log(d$Ping),
        stroke=0.2,
        alpha=0.7
    ) +
    scale_x_continuous( breaks=pretty_breaks(n=10) ) +
    scale_y_continuous( breaks=pretty_breaks(n=10) ) +
    theme_mine() +
    # scale_colour_manual(values=MyColors, aesthetics='colour') +
    scale_fill_manual(values=MyColors, aesthetics='fill') +
    guides(
        fill=guide_legend(ncol=1),
        # SE-tip doesn't seem to work (legend circles remain small)
        shape=guide_legend(override.aes=list(size=5))
    )

ggsave(
    file=ChartFile,
    plot=g,
    device='png',
    dpi=DPI,
    units=Units,
    width=Width,
    height=Height,
)
eprintf("Saved chart in %s\n", ChartFile)

systemf("%s %s 2>/dev/null &", Viewer, ChartFile)

