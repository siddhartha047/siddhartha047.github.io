# Siddhartha Shankar Das Academic Website

This repository contains the Jekyll source for the GitHub Pages user site:

`https://siddhartha047.github.io/`

## 1. Create the GitHub repository manually

Create the repository first at:

`https://github.com/new`

Use these settings:

1. Repository name: `siddhartha047.github.io`
2. Visibility: `Public`
3. Do not add a `README`
4. Do not add a `.gitignore`
5. Do not add a license

## 2. Connect this local folder to GitHub

This workspace already contains the customized site files. To connect it to the GitHub repository:

```bash
git init
git branch -M main
git remote add origin https://github.com/siddhartha047/siddhartha047.github.io.git
```

If `origin` already exists, update it instead:

```bash
git remote set-url origin https://github.com/siddhartha047/siddhartha047.github.io.git
```

## 3. Preview the site locally

```bash
bundle install
bundle exec jekyll serve
```

Then open:

`http://127.0.0.1:4000/`

## 4. Publish to GitHub Pages

```bash
git add .
git commit -m "Initial academic website"
git push -u origin main
```

In GitHub:

1. Open `https://github.com/siddhartha047/siddhartha047.github.io`
2. Go to `Settings` -> `Pages`
3. Set `Source` to `Deploy from a branch`
4. Select branch `main`
5. Select folder `/(root)`

The public site will then be available at:

`https://siddhartha047.github.io/`

## 5. Maintain the content

Most editable content lives in `_data/`:

- `_data/profile.yml`
- `_data/news.yml`
- `_data/publications.yml`
- `_data/research.yml`
- `_data/projects.yml`
- `_data/mentoring.yml`

To switch the CV from Google Drive to a local PDF later, add:

`assets/files/Siddhartha_Das_CV.pdf`

The site is already configured to use that local PDF automatically when it exists.
