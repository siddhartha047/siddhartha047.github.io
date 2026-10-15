---
title: About
eyebrow: About me
lead: Graph algorithms, scalable learning, and AI systems for scientific and applied domains.
description: About Siddhartha Shankar Das and his research program.
---
{% assign local_cv = site.static_files | where: "path", site.data.profile.cv_local | first %}
{% if local_cv %}
  {% assign cv_href = site.data.profile.cv_local | relative_url %}
{% else %}
  {% assign cv_href = site.data.profile.cv_external %}
{% endif %}

<section class="prose-block">
  {% for paragraph in site.data.profile.bio %}
  <p>{{ paragraph }}</p>
  {% endfor %}
</section>

<section class="home-section">
  <div class="section-heading"><h2>Research interests</h2></div>
  <ul class="tag-list tag-list-wide">
    {% for topic in site.data.profile.research_focus %}
    <li>{{ topic }}</li>
    {% endfor %}
  </ul>
</section>

<section class="home-section">
  <div class="section-heading"><h2>Research experience</h2></div>
  <div class="stack-list">
    {% for job in site.data.experience.items %}
    <article class="info-card">
      <h3>{{ job.title }}</h3>
      <p class="card-subtitle">{{ job.org }} &middot; {{ job.period }}</p>
      <p>{{ job.summary }}</p>
    </article>
    {% endfor %}
  </div>
</section>

<section class="home-section">
  <div class="section-heading"><h2>Education</h2></div>
  <div class="stack-list">
    {% for item in site.data.education.items %}
    <article class="info-card">
      <h3>{{ item.degree }}</h3>
      <p class="card-subtitle">{{ item.institution }} &middot; {{ item.period }}</p>
      <p>{{ item.detail }}</p>
    </article>
    {% endfor %}
  </div>
</section>

<section class="home-section">
  <div class="section-heading"><h2>Teaching experience</h2></div>
  <div class="stack-list">
    {% for item in site.data.service.teaching %}
    <article class="info-card">
      <h3>{{ item.role }}</h3>
      <p class="card-subtitle">{{ item.institution }} &middot; {{ item.period }}</p>
      <p>Courses: {{ item.courses }}.</p>
    </article>
    {% endfor %}
  </div>
</section>

<section class="home-section">
  <div class="section-heading"><h2>Honors and awards</h2></div>
  <div class="stack-list">
    {% for award in site.data.awards.items %}
    <article class="info-card">
      <h3>{{ award.title }}</h3>
      <p class="card-subtitle">{{ award.venue }}</p>
      {% if award.detail and award.detail != "" %}<p>{{ award.detail }}</p>{% endif %}
    </article>
    {% endfor %}
  </div>
</section>

<section class="prose-block">
  <div class="section-heading"><h2>Academic service</h2></div>
  <p><strong>Reviewer:</strong> {{ site.data.service.reviewer | join: ", " }}, and others.</p>
  <p><strong>Organizing member:</strong> {% for org in site.data.service.organizing %}{{ org.name }} {{ org.years | join: ", " }}{% unless forloop.last %}; {% endunless %}{% endfor %}.</p>
</section>

<section class="home-section">
  <div class="section-heading"><h2>Profiles</h2></div>
  <div class="link-list">
    {% if site.data.profile.email %}
    <a href="mailto:{{ site.data.profile.email }}">{{ site.data.profile.email }}</a>
    {% endif %}
    {% for link in site.data.profile.links %}
    <a href="{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>
    {% endfor %}
    <a href="{{ cv_href }}" target="_blank" rel="noopener">CV</a>
  </div>
</section>
