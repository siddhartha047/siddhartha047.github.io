---
title: Teaching & mentoring
eyebrow: Growing through collaboration
lead: Supporting researchers and students working on graph learning, circuit representations, and cybersecurity.
description: Teaching and research mentoring by Siddhartha Shankar Das at PNNL, Purdue University, and BUET.
---
<section class="prose-block"><h2>Research mentoring at PNNL</h2><p class="research-lead">{{ site.data.mentoring.summary }}</p></section><section class="section-block"><div class="section-heading"><h2>Students & collaborators</h2></div><div class="card-grid">{% for mentee in site.data.mentoring.items %}<article class="info-card"><h3>{{ mentee.name }}</h3><p class="card-subtitle">{{ mentee.affiliation }} · {{ mentee.period }}</p><p>{{ mentee.summary }}</p></article>{% endfor %}</div></section><section class="section-block"><div class="section-heading"><h2>Teaching experience</h2></div><div class="stack-list">{% for item in site.data.service.teaching %}<article class="timeline-item"><p class="timeline-period">{{ item.period }}</p><div><h3>{{ item.institution }}</h3><p class="card-subtitle">{{ item.role }}</p><p>Courses: {{ item.courses }}.</p></div></article>{% endfor %}</div></section>
