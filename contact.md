---
title: Contact
lead: Professional profiles and affiliation details.
description: Contact information for Siddhartha Shankar Das.
---
{% assign local_cv = site.static_files | where: "path", site.data.profile.cv_local | first %}
{% if local_cv %}
  {% assign cv_href = site.data.profile.cv_local | relative_url %}
{% else %}
  {% assign cv_href = site.data.profile.cv_external %}
{% endif %}

<section class="prose-block">
  <h2>Affiliation</h2>
  <p>{{ site.data.profile.role }}, {{ site.data.profile.affiliation }}</p>
  <p>{{ site.data.profile.contact_note }}</p>
</section>

<section class="home-section">
  <div class="section-heading"><h2>Professional links</h2></div>
  <div class="link-list">
    {% for link in site.data.profile.links %}
    <a href="{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>
    {% endfor %}
    <a href="{{ cv_href }}" target="_blank" rel="noopener">CV</a>
  </div>
</section>
