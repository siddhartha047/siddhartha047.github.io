---
title: About
lead: Background, research agenda, and current areas of work.
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
  <div class="section-heading"><h2>Profiles</h2></div>
  <div class="link-list">
    {% for link in site.data.profile.links %}
    <a href="{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>
    {% endfor %}
    <a href="{{ cv_href }}" target="_blank" rel="noopener">CV</a>
  </div>
</section>
