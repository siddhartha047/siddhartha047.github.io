---
title: CV
lead: Current CV access and the reserved local PDF path for future updates.
description: CV page for Siddhartha Shankar Das.
---
{% assign local_cv = site.static_files | where: "path", site.data.profile.cv_local | first %}
{% if local_cv %}
  {% assign cv_href = site.data.profile.cv_local | relative_url %}
{% else %}
  {% assign cv_href = site.data.profile.cv_external %}
{% endif %}

<section class="prose-block">
  <p>The current CV is available through the link below.</p>
  <div class="button-row">
    <a class="button button-primary" href="{{ cv_href }}" target="_blank" rel="noopener">Open CV</a>
  </div>
  <p class="muted-copy">A local file path is already reserved at <code>assets/files/Siddhartha_Das_CV.pdf</code>. Once that PDF is added, this page and the homepage CV button will use the local file automatically.</p>
</section>
