---
title: Projects
lead: Ongoing and past projects aligned with the research agenda.
description: Projects for Siddhartha Shankar Das.
---
{% assign groups = site.data.projects.items | map: "group" | uniq %}
{% for group in groups %}
{% assign group_items = site.data.projects.items | where: "group", group %}
<section class="section-block">
  <div class="section-heading"><h2>{{ group }}</h2></div>
  <div class="card-grid">
    {% for project in group_items %}
    <article class="info-card">
      <h3>{{ project.title }}</h3>
      <p class="card-subtitle">{{ project.subtitle }}</p>
      <p>{{ project.summary }}</p>
    </article>
    {% endfor %}
  </div>
</section>
{% endfor %}
