# Internet speed data

This repository [github.com://arielf/speedtests](https://github.com/arielf/speedtests) contains data about internet-speeds and code to allow anyone to reproduce the results. 

## HOWTO

    # Install prerequisites
    sudo apt-get install make perl speedtest-cli
    sudo apt-get install r-base r-cran-data.table r-cran-ggplot2 r-cran-scales

    # Clone this repository, and cd to it
    git clone https://github.com/arielf/speedtests
    cd speedtests

    # Generate a N-row data-set on the N-closest speedtest supporting data-centers
    ./my-speedtest.many > mydata.tsv
    
    # Generate a chart from the data-set
    ./speedtests.R mydata.tsv

    # Chart should now be in "mydata.tsv.png"

##### flow explanation:

-  The `speedtest` utility (`apt install speedtest-cli`) collects speed data from various data-centers
- `my-speedtest.many` is a perl-script wrapper around `speedtest`. It figures out the closest N data-centers & checks the speed to each of them.
- `speedtests.R` is an R script to generate a chart from the data-set
- `speedtests.R` depends on `R` + the `data.table` & `ggplot2` libraries
- `speedtests.R` tries to call `nomacs` to view the generated chart. YMMV. Change it to your favorite image viewer or ignore the error at the end.
- See `Makefile` for the full flow.
- TLDR: if you have all prereqs installed, just type `make`


## Summary

Comcast claims my plan should give me dowload bandwitdh of 75 Mbps (Mega-bits per second).

They don't say anything about upload-speeds or ping round-trip latencies, which is a shame.

When testing my speed using Comcast own speed-test service, the results say I'm getting the promised speed and then some.

Here's an example of a screenshot from a test by Ookla (aka speedtest.net, owned by Comcast) where all numbers look good and as I expect them:

![Ookla speed test 2020-01-26](Ookla-2020-01-26.png) 

However whenever I test my speeds using other independent speed-test providers, my results are significantly and consistently worse.

How much worse?

- Average download speeds are roughly 2x worse
- Average upload speeds are roughly 2x worse
- Average ping round-trips are roughly 3x to 6x times worse

The data below, collected over different times, using various services, speaks for itself.

[Raw speed-test data (TSV format)](speedtests.tsv)

![Chart of speed-tests](speedtests-annotated.png)

## Notes:

- The darker blue points at the top-right of the chart are Comcast data-points. The very top ones correspond to _speedtest.xfinity.com_, the slightly lower ones, correspond to _speedtest.net_ (Ookla, owned by Comcast).
- All independent internet speed-test providers, except one (Converse in Code) fall to the left of the center (<5.0 Mbps upload speeds) and none come close to the _speedtest.xfinity.com_ result in either speeds or latencies.
- Interestingly, there is an additional Comcast data-center (52 km away) which is not my default speedtest target. Even though this is a Comcast data-center it is throttled-down just like the other independent providers. Seems like Comcast is throttling my speed globally, _except_ when I directly use one of their own speedtest to check my speed.
- Seems like Comcast is being selective about which peering points or sources it is throttling-down. The default "speedtest" I get in the browser is not throttled-down, and makes Comcast apppear as if it is the fastest of all providers.
- In the past, I used to see consistent speeds between Comcast speedtest sites and other independent speedtest sites in the Bay Area. I was seeing ~90Mbps down and 5.5MBps up pretty consistently, regardless of which speed-test service I used. More details in [my Comcast experience](Comcast.md).

By far, the fastest of all "speedtest" services for me, is one that is embedded in Comcast web site (under "check your speed") and is pointing at _speedtest.xfinity.com_. This one is further distributed over a CDN (multiple data-centers close to the network-edge) to make it appear even faster and less representative of the network as a whole. Here's the DNS answer showing it:

    ;; ANSWER SECTION
    speedtest.xfinity.com.  162     IN      CNAME   cdn.speedtest-prod.xcr.comcast.net.
    cdn.speedtest-prod.xcr.comcast.net. 0 IN A      69.241.75.162
    cdn.speedtest-prod.xcr.comcast.net. 0 IN A      96.113.184.102
    cdn.speedtest-prod.xcr.comcast.net. 0 IN A      69.241.90.114
    cdn.speedtest-prod.xcr.comcast.net. 0 IN A      96.112.146.30
    cdn.speedtest-prod.xcr.comcast.net. 0 IN A      96.113.184.110


## Bottom line

_In reality, the speed claimed by Comcast is *not representative of real average speeds* I experience._

_The service levels are *significantly worse* than advertised, when accessing most or even all parts of the internet (other than Comcast dedicated & misleading speedtest sites)_

Using the code and instructions above on Ubuntu Linux or similar, anyone can repeat my experiment. I encourage readers to download and share their results so we have a larger sample. Please share what is the speed Comcast (or any other ISP) says you're getting, vs what you actually get in this experiment.


## References:

- [A similar experience by another Comcast subscriber on xfinity forums](https://forums.xfinity.com/t5/Your-Home-Network/Proof-Comcast-Throttling-Internet-Speeds/td-p/3056103)
- [My own recent experience dealing with Comcast](Comcast.md)

