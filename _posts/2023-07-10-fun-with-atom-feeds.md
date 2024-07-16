---
layout: post
title: 'Fun with atom feeds'
categories: [Tech, Coding]
tags: [short, tech, rss, atom, site]
---

One key criteria for me when choosing blogging platforms is having an easy to use [RSS/Atom feed](https://pete-hamlin.github.io/blog/feed.xml).
Jekyll usually supports this pretty well out of the box, and the theme I chose does a pretty good job.
That being said, I noticed that my feed (yes, I subscribe to my own RSS feed, I have no shame) was only providing a brief summary of the post:
 
> “I should start a blog” Great idea me! I’ve always had way to much too say about many things, and what better way to satisfy my inner blabbermouth than throwing those opinions out to the wider internet? It sure has to beat the current model of talking at my immediate social group until every pair of eyes eventually glazes over. So just need to find a platform that I like! It needs to be ligh...

This was unlike the behaviour of some of other blogs that I follow (such as [Matt Rickard's](https://matt-rickard.com/rss)) which includes the whole post with nice HTML formatting, allowing me to read the entire article without leaving my RSS app of choice.
I'd quite like this to be the default for my blog, so set out over the weekend trying to fix this.

## Initial Work

I found the offending line [quite quickly](https://github.com/Pete-Hamlin/blog/blob/0c4d4c2605fa121adabf8f99ea87ded415457c9e/assets/feed.xml#L53):

```
 content | strip_html | truncate: 400 
```

So removing the `truncate` dumps the whole piece into the summary as an unformatted plaintext blob. 

Not ideal.

Removing the `strip_html` line created a pretty HTML formatted xml whilst running the blog, however on trying to deploy it, the feed instead returns an ugly error:

![](/assets/img/2023-07-10-18-22-03.png)
_Sure as hell not going to try and work out what's at column 3243 from that..._

Also not ideal.

## Digging Deeper

Digging a little further into the [Atom specification](https://validator.w3.org/feed/docs/atom.html) I figured it may be that I was just misusing `<summary>`, and that `<content>` was likely a better fit for what I wanted.
Again, this change worked wonderfully locally, but once deployed... Same error.

I was getting a bit confused at this point, as there is nothing I can immediately see that would behave wildly differently in the local environment (where it works perfectly), and the deployed environment (where it has a weird `<li>` related syntax error).
As a last ditch effort I tried add `type=html` to my content tag, but to no avail.

## Conclusion?

At this point I gave up, as what was supposed to be a 2 min fix was turning into way more work than Saturday morning me was willing to tolerate.
While not the most thorough investigation, it is still somewhat baffling me as to what could be causing this.
I'm certainly no expert when it comes to feeds/formatting, but a static site is a static site!

So for now, my feed remains as a summary.
I hope to revisit this one when I have a little more time on my hands, and see if we can work out my mistake.
In the meantime, if anyone has had any similar experiences with Jekyll/Atom feeds, I'd love to hear from you (email link in the top left corner of the page).
