# Comcast speed data

This repository [arielf/comcast-speedtests](git://github.com/arielf/comcast-speedtests) contains data about internet speeds.


## Summary

Comcast claims my plan should give me dowload bandwitdh of 75 Mbps (Mega-bits per second).

They don't say anything about upload-speeds or ping round-trip latencies, which is a shame.

When testing my speed using Comcast own speed-test service, the results say I'm getting the promised speed and then some.

Here's an example of a screenshot from a test by Ookla (aka speedtest.net, owned by Comcast) where all numbers look good and as I expect them:

![Ookla speed test 2020-01-26](Ookla-2020-01-26.png) 

However whenever I test my speeds against multiple & independent speed-test providers, my results are significantly and consistently worse.

How much lower?

- Download speeds are roughly 40-60% lower
- Upload speeds are roughly 2x worse
- ping round-trips are roughly 3x to 6x times worse

The data below, collected over different times, using various services, speaks for itself. The explanation is left for the reader.

[Raw speed-test data (TSV format)](speedtests.tsv)

![Chart of speed-tests](speedtests.png)

Notes:

- All the blue points at the right half of the chart are Comcast data-points. The very top (blue) ones correspond to speedtest.xfinity.com, the slightly lower ones, correspond to a further Comcast data-center (in San Francisco).
- All independent internet providers fall to the left of the center (<5.0 Mbps upload speeds). Also note that all the non-Comcast ping round-trip times (packet latency) are higher than the Comcast ones.

## References:

- [A similar experience by another Comcast subscriber on xfinity forums](https://forums.xfinity.com/t5/Your-Home-Network/Proof-Comcast-Throttling-Internet-Speeds/td-p/3056103)


