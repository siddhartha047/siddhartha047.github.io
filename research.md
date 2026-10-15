---
title: Research
eyebrow: Algorithms with a path to impact
lead: I study how structure can make machine learning more efficient, expressive, and useful in real systems.
description: Research directions of Siddhartha Shankar Das in scalable graph learning, support-graph sparsification, AI for system design, cybersecurity, and multimodal and agentic AI.
---
{% for area in site.data.research.areas %}<section class="research-detail section-block" id="{{ area.id }}"><div class="research-detail-heading"><span class="card-number">{{ area.number }}</span><h2>{{ area.title }}</h2><ul class="tag-list">{% for keyword in area.keywords %}<li>{{ keyword }}</li>{% endfor %}</ul></div><div class="research-detail-body"><p class="research-lead">{{ area.description }}</p><p>{{ area.detail }}</p><div class="related-papers"><span>Explore the work</span>{% for id in area.publications %}{% assign pub = site.data.publications.items | where: 'id', id | first %}<a href="{{ '/publications/#' | append: id | relative_url }}">{{ pub.title }} ↗</a>{% endfor %}</div></div></section>{% endfor %}
<section class="contact-band"><div><p class="eyebrow">Research in practice</p><h2>Explore the projects.</h2><p>Current work, public code, and interdisciplinary applications.</p></div><a class="button button-light" href="{{ '/projects/' | relative_url }}">View projects ↗</a></section>
