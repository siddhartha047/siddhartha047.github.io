---
title: News & updates
eyebrow: Research milestones
lead: Recent publications, new preprints, public releases, and career updates.
description: Latest research news from Siddhartha Shankar Das, updated October 2026.
---
<div class="news-list news-archive">{% for item in site.data.news.items %}<article class="news-item"><time class="news-date">{{ item.date }}</time><p><a href="{{ item.url }}" target="_blank" rel="noopener">{{ item.text }} ↗</a></p></article>{% endfor %}</div>
