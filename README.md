# Siddhartha Shankar Das — academic website

Source for [siddhartha047.github.io](https://siddhartha047.github.io/), built with Jekyll and GitHub Pages. Content was updated against the October 2026 CV and primary publication sources on October 15, 2026.

## Preview

```sh
bundle install
bundle exec jekyll serve
```

Open the local address printed by Jekyll. To check a production build:

```sh
bundle exec jekyll build --strict_front_matter
```

## Maintain

Content lives in `_data/`: `profile.yml`, `publications.yml`, `projects.yml`, `research.yml`, `experience.yml`, `education.yml`, `news.yml`, `mentoring.yml`, `awards.yml`, and `service.yml`.

- Keep published papers, accepted papers, preprints, reports, and dissertations accurately labeled.
- Add only verified public code links. Related implementations should be labeled as related code.
- Publication figures include a caption and paper link; record source and PDF page in `assets/images/pubs/sources.json`.
- Publish only the public Overleaf edition (`PNNL-DS-October-Public.tex`), which omits personal phone and postal contact details. Keep the application CV private.
- Replace `assets/files/Siddhartha_Das_CV_Public.pdf` and its compatibility copy `assets/files/Siddhartha_Das_CV.pdf` together. Update the dates in `profile.yml` and `cv.md`.
- Public LaTeX sources and the privacy preflight are in `docs/public-cv/`. Run the preflight before publishing a replacement CV.
- Keep `assets/files/publications.bib` consistent with the per-paper BibTeX in `publications.yml`.
- Publication search and category filters are progressively enhanced by `assets/js/site.js`; the complete archive remains available without JavaScript.

Primary sources and publication-title differences are documented in [docs/content-sources.md](docs/content-sources.md). The Google Site is a native Google Sites mirror and needs a corresponding content update when these records change.

## Publish

The `main` branch is the source for GitHub Pages. Build and review changes, commit them, and push `main`. Check the resulting Pages deployment before considering an update complete.
