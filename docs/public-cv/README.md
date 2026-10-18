# Public website CV

`PNNL-DS-October-Public.tex` is the website edition of the October 2026 CV.
It compiles with the accompanying `resume.cls`. The same public source is saved
in the original Overleaf project, alongside the unchanged application edition
`PNNL-DS-October.tex`.

Use the public file as the main document when exporting a website PDF. The
application edition remains the project's default main document for job
applications. Never upload that private edition to this repository.

Publish the public PDF to both paths:

- `assets/files/Siddhartha_Das_CV_Public.pdf` (canonical download)
- `assets/files/Siddhartha_Das_CV.pdf` (compatibility for existing links)

Before publishing, build the site, then run the privacy preflight with Python
and PyMuPDF installed:

```sh
bundle exec jekyll build --strict_front_matter
python3 docs/public-cv/check_privacy.py
```

The check examines extracted PDF text, metadata, telephone links, embedded
attachments, both CV copies, and rendered HTML. It reports candidates without
printing their values. Visually inspect the final PDF too.
