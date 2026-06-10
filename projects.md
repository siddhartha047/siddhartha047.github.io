---
title: Projects
lead: Ongoing and representative projects aligned with the research agenda.
description: Projects for Siddhartha Shankar Das.
---
<section class="section-block">
  <div class="card-grid">
    {% for project in site.data.projects.items %}
    <article class="info-card">
      <h2>{{ project.title }}</h2>
      <p class="card-subtitle">{{ project.subtitle }}</p>
      <p>{{ project.summary }}</p>
    </article>
    {% endfor %}
  </div>
</section>
