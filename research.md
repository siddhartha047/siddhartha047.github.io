---
title: Research
eyebrow: Algorithms with a path to impact
lead: I study graph learning, AI systems, and optimization methods that balance competing objectives in scientific and engineering applications.
description: Research directions of Siddhartha Shankar Das in scalable graph learning, AI for system design, cybersecurity, multimodal AI, and multi-objective and many-objective evolutionary optimization.
---
{% for area in site.data.research.areas %}
<section class="research-detail section-block" id="{{ area.id }}">
  <div class="research-detail-heading">
    <span class="card-number">{{ area.number }}</span>
    <h2>{{ area.title }}</h2>
    <ul class="tag-list">{% for keyword in area.keywords %}<li>{{ keyword }}</li>{% endfor %}</ul>
  </div>
  <div class="research-detail-body">
    <p class="research-lead">{{ area.description }}</p>
    <p>{{ area.detail }}</p>
    <div class="related-papers">
      <span>Explore the work</span>
      {% for id in area.publications %}
      {% assign pub = site.data.publications.items | where: 'id', id | first %}
      <a href="{{ '/publications/#' | append: id | relative_url }}">{{ pub.title }} ↗</a>
      {% endfor %}
    </div>
    {% if area.resources %}
    <div class="related-papers">
      <span>Code & thesis resources</span>
      {% for resource in area.resources %}<a href="{{ resource.url }}" target="_blank" rel="noopener">{{ resource.label }} ↗</a>{% endfor %}
    </div>
    {% endif %}
  </div>
</section>
{% endfor %}
<section class="contact-band"><div><p class="eyebrow">Research in practice</p><h2>Explore the projects.</h2><p>Current work, public code, and interdisciplinary applications.</p></div><a class="button button-light" href="{{ '/projects/' | relative_url }}">View projects ↗</a></section>
