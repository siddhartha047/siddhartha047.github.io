---
title: Research
lead: Core themes across graph learning, cybersecurity, and scientific AI.
description: Research themes for Siddhartha Shankar Das.
---
<section class="section-block">
  <div class="card-grid">
    {% for area in site.data.research.areas %}
    <article class="info-card">
      <h2>{{ area.title }}</h2>
      <p>{{ area.description }}</p>
    </article>
    {% endfor %}
  </div>
</section>
