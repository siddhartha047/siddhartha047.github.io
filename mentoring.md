---
title: Mentoring
lead: Student and intern mentoring across cybersecurity and graph learning projects.
description: Mentoring activities for Siddhartha Shankar Das.
---
<section class="home-section">
  <div class="stack-list">
    {% for mentee in site.data.mentoring.items %}
    <article class="info-card">
      <h3>{{ mentee.name }}</h3>
      <p class="card-subtitle">{{ mentee.affiliation }} &middot; {{ mentee.period }}</p>
      <p>{{ mentee.summary }}</p>
    </article>
    {% endfor %}
  </div>
</section>
