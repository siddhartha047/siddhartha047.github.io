---
title: Publications
lead: A clean publication structure with editable placeholder entries.
description: Publications and selected papers for Siddhartha Shankar Das.
---
{% assign selected = site.data.publications.items | where_exp: "item", "item.selected" %}
{% assign conferences = site.data.publications.items | where: "category", "conference" %}
{% assign journals = site.data.publications.items | where: "category", "journal_workshop" %}
{% assign preprints = site.data.publications.items | where: "category", "preprint" %}

<p class="muted-copy">A full list is also available on <a href="https://scholar.google.com/citations?user=kTAFl2yYe6QC&hl=en" target="_blank" rel="noopener">Google Scholar</a>. Entries are maintained in <code>_data/publications.yml</code>.</p>

<section class="home-section">
  <div class="section-heading"><h2>Selected Publications</h2></div>
  <div class="pub-list">
    {% for publication in selected %}
    {% include pub.html pub=publication %}
    {% endfor %}
  </div>
</section>

<section class="home-section">
  <div class="section-heading"><h2>Conference Papers</h2></div>
  <div class="pub-list">
    {% for publication in conferences %}
    {% include pub.html pub=publication %}
    {% endfor %}
  </div>
</section>

<section class="home-section">
  <div class="section-heading"><h2>Journal / Workshop Papers</h2></div>
  <div class="pub-list">
    {% for publication in journals %}
    {% include pub.html pub=publication %}
    {% endfor %}
  </div>
</section>

<section class="home-section">
  <div class="section-heading"><h2>Preprints</h2></div>
  <div class="pub-list">
    {% for publication in preprints %}
    {% include pub.html pub=publication %}
    {% endfor %}
  </div>
</section>
