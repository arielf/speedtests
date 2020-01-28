# Internet speed data

This repository [arielf/speedtests](git://github.com/arielf/speedtests) contains data about internet speeds.


## Summary

Comcast claims my plan should give me dowload bandwitdh of 75 Mbps (Mega-bits per second).

They don't say anything about upload-speeds or ping round-trip latencies, which is a shame.

When testing my speed using Comcast own speed-test service, the results say I'm getting the promised speed and then some.

Here's an example of a screenshot from a test by Ookla (aka speedtest.net, owned by Comcast) where all numbers look good and as I expect them:

![Ookla speed test 2020-01-26](Ookla-2020-01-26.png) 

However whenever I test my speeds against multiple & independent speed-test providers, my results are significantly and consistently worse.

How much worse?

- Average download speeds are roughly 2x worse
- Average upload speeds are roughly 2x worse
- Average ping round-trips are roughly 3x to 6x times worse

The data below, collected over different times, using various services, speaks for itself. The explanation is left for the reader.

[Raw speed-test data (TSV format)](speedtests.tsv)

![Chart of speed-tests](speedtests.png)

## Notes:

- The darker blue points at the top-right quarter of the chart are Comcast data-points. The very top ones correspond to _speedtest.xfinity.com_, the slightly lower ones, correspond to _speedtest.net_ (Ookla, owned by Comcast).
- All independent internet speed-test providers, except one (Converse in Code) fall to the left of the center (<5.0 Mbps upload speeds) and none come close to the _speedtest.xfinity.com_ result in either speeds or latencies.
- Interestingly, there is one additional Comcast data center (52 km away) which is not my default speedtest target, which seems to be throttled-down like the other independent providers. Is it too complex for Comcast engineers to deny "net neutrality" once a routing boundary not in their control is crossed?
- Seems like Comcast is selective about which peering points or sources it is throttling-down. The default speed-test I get in the browser is not throttled-down and makes Comcast apppear as if it is the fastest of all providers.
- In the past, I used to see consistent speeds between Comcast speedtest sites and other independent speedtest site in the Bay Area. I was seeing ~90Mbps down and 5.5MBps up pretty consistently, regardless of which speed-test service I used.
- In Oct 2018, Comcast raised my bill from $64.95/month, to $81.95/month (a 26% hike). When I objected to the price hike, their rep told me I'm on a 'extreme' plan, giving me "up to 150Mbs" down. Since I've never seen this speed from Comcast, not even vs their own speed-test, I objected to the price hike saying all I ask of them is to leave the price and service as-is ($64.95/month for ~90Mbps down). Once I complained, they cancelled the price hike. Service remained good for a while.
- In Sep 2019, I got an email from Comcast saying (quote): ***"The download speed included with your current Xfinity Internet plan has been increased from 150/5 Mbps to 175/5 Mbps. We know how important your network is to you, and we want to thank you for choosing us to be your trusted Internet provider."***
- In reality, nothing changed...  I was still seeing the usual ~90Mbps down, so I was happy.
- A few weeks later, I noticed a significant service degradation. When I checked the Comcast site, I saw that something changed in the Comcast system. My plan became "Up to 75Mbps". Rather than staying at ~90 Mbps as it has been for years, The speeds I get went sharply down, and are now much less than the claimed "75Mbps".

## Bottom line

_In reality, the speed claimed by Comcast is *not representative of real average speeds* I experience._

_The service levels are *significantly worse* when accessing most or even all parts of the internet (except Comcast dedicated and misleading speedtest sites)_

## References:

- [A similar experience by another Comcast subscriber on xfinity forums](https://forums.xfinity.com/t5/Your-Home-Network/Proof-Comcast-Throttling-Internet-Speeds/td-p/3056103)


