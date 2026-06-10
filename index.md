---
layout: home
title: Home
description: Academic homepage for Siddhartha Shankar Das, Postdoctoral Researcher at Pacific Northwest National Laboratory.
---
{% assign local_cv = site.static_files | where: "path", site.data.profile.cv_local | first %}
{% if local_cv %}
  {% assign cv_href = site.data.profile.cv_local | relative_url %}
{% else %}
  {% assign cv_href = site.data.profile.cv_external %}
{% endif %}

<section class="profile">
  <img class="profile-photo" src="{{ site.data.profile.image | relative_url }}" alt="{{ site.data.profile.name }}" onerror="this.style.display='none'">
  <h1 class="profile-name">{{ site.data.profile.name }}</h1>
  <p class="profile-role">{{ site.data.profile.role }}</p>
  <p class="profile-affiliation">{{ site.data.profile.affiliation }}</p>
  <div class="social-links">
    {% for link in site.data.profile.links %}
    <a href="{{ link.url }}" target="_blank" rel="noopener" aria-label="{{ link.label }}" title="{{ link.label }}"><i class="{{ link.icon }}"></i></a>
    {% endfor %}
    <a href="{{ cv_href }}" target="_blank" rel="noopener" aria-label="CV" title="CV"><i class="fa-solid fa-file-lines"></i></a>
  </div>
</section>

<section class="lead-block">
  {% for paragraph in site.data.profile.bio %}
  <p>{{ paragraph }}</p>
  {% endfor %}
  <ul class="tag-list">
    {% for topic in site.data.profile.research_focus %}
    <li>{{ topic }}</li>
    {% endfor %}
  </ul>
</section>

<section class="home-section">
  <div class="section-heading">
    <h2>News</h2>
    <a class="text-link" href="{{ '/news/' | relative_url }}">All updates</a>
  </div>
  <div class="news-list">
    {% for item in site.data.news.items limit: 4 %}
    <div class="news-item">
      <span class="news-date">{{ item.date }}</span>
      <span class="news-text">{{ item.text }}</span>
    </div>
    {% endfor %}
  </div>
</section>

<section class="home-section">
  <div class="section-heading">
    <h2>Selected Publications</h2>
    <a class="text-link" href="{{ '/publications/' | relative_url }}">All publications</a>
  </div>
  <div class="pub-list">
    {% for publication in site.data.publications.items %}
      {% if publication.selected %}
      {% include pub.html pub=publication %}
      {% endif %}
    {% endfor %}
  </div>
</section>

<section class="home-section">
  <div class="section-heading">
    <h2>Research</h2>
    <a class="text-link" href="{{ '/research/' | relative_url }}">Research themes</a>
  </div>
  <div class="card-grid">
    {% for area in site.data.research.areas limit: 4 %}
    <article class="info-card">
      <h3>{{ area.title }}</h3>
      <p>{{ area.description }}</p>
    </article>
    {% endfor %}
  </div>
</section>
