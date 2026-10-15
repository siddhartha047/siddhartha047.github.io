---
title: Get in touch
eyebrow: Contact & professional profiles
lead: For research collaborations, professional inquiries, and conversations about graph learning and AI systems.
description: Contact Siddhartha Shankar Das at Pacific Northwest National Laboratory, and find his Google Scholar, GitHub, LinkedIn, and PNNL profiles.
---
<div class="contact-layout"><section class="contact-primary"><p class="eyebrow">Email</p><h2><a href="mailto:{{ site.data.profile.email }}">{{ site.data.profile.email }} ↗</a></h2><p>{{ site.data.profile.role }}<br>{{ site.data.profile.affiliation }}</p><p>Language Intelligence group<br>Data Science & Machine Intelligence</p><a class="text-link" href="{{ site.data.profile.cv_local | relative_url }}" target="_blank" rel="noopener">Curriculum vitae ↗</a></section><section class="profile-directory"><h2>Find me online</h2>{% for link in site.data.profile.links %}<a href="{{ link.url }}" target="_blank" rel="noopener"><span>{{ link.label }}</span><span aria-hidden="true">↗</span></a>{% endfor %}</section></div>
