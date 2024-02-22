---
layout: post
title: Clonezilla, Still Simple... Still Great
tags:
- tools
- tech
- short
- backups
date: 2024-02-22 19:22 +0000
---
The first tenet of the [Unix Philosophy](https://en.wikipedia.org/wiki/Unix_philosophy) largely boils down to **do one thing, do it well**.
Over time, I've often found the tools I always come back to are largely the ones that adhere in some fashion to this principle. [Clonezilla Live](https://clonezilla.org/) is a great example of this for me. It does disk imaging, cleanly, simply and then gets out of the way.

Full disk image backup/restore isn't something I need particularly *often*, but it will reliably come up every now and then (normally when attempting some more ambitious tinkering at OS level).
It can be quite a daunting process unassisted, with plenty of pitfalls, and potentially dire data-loss consequences if mistakes are made.

Clonezilla is great because it just takes the stress out of taking backups/images:
- Can be flashed to a USB to boot as a live disk
- Supports image <-> device, image -> image and device -> device
- Supports local devices, and a variety of easy network solutions (ssh, nfs)

While puritans may argue it actually does **many** things, to me it really simplifies the process enough that a little knowledge goes a very long way.
With Clonezilla, I can comfortably chop and change disk images around without fear of forgetting a step or doing something wrong along the way that completely borks the backup.
It's all open source too, meaning I'm not being pushed to upgrade to Clonezilla++, or really locked into any vendor (with enough knowledge/work, anything that Clonezilla does can be replicated with standard UNIX tools).

Sometimes it's just nice to use a tool that does exactly what it's advertised to do, reliably, and has done so throughout the years.
Which is something of a bleak view of the state of software in this day and age...