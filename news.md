---
title: News / Updates
lead: Short milestones and current activity.
description: Recent updates for Siddhartha Shankar Das.
---
<section class="home-section">
  <div class="news-list">
    {% for item in site.data.news.items %}
    <div class="news-item">
      <span class="news-date">{{ item.date }}</span>
      <span class="news-text">{{ item.text }}</span>
    </div>
    {% endfor %}
  </div>
</section>
