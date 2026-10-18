#!/usr/bin/env python3
"""Preflight the public CV and rendered website. Requires PyMuPDF."""

from html.parser import HTMLParser
from pathlib import Path
import re
import sys

import fitz


ROOT = Path(__file__).resolve().parents[2]
PHONE = re.compile(
    r"(?<![\w/])(?:\+?1[ .-]?)?\(?\d{3}\)?[ .-]?\d{3}[ .-]?\d{4}(?!\w)"
    r"|\+?880[ .-]?1\d{3}[ .-]?\d{6}|\b01\d{3}[ .-]?\d{6}\b"
)
POSTAL = re.compile(
    r"\b\d{1,5}\s+(?:[A-Z][\w.-]*\s+){0,5}"
    r"(?:Street|Avenue|Road|Drive|Lane|Boulevard|Terrace|Court|Parkway|"
    r"St\.|Ave\.|Rd\.|Dr\.)\b",
    re.I,
)


class VisibleText(HTMLParser):
    def __init__(self):
        super().__init__()
        self.skip = 0
        self.text = []
        self.telephone_links = 0

    def handle_starttag(self, tag, attrs):
        if tag in {"script", "style"}:
            self.skip += 1
        if tag == "a" and dict(attrs).get("href", "").lower().startswith("tel:"):
            self.telephone_links += 1

    def handle_endtag(self, tag):
        if tag in {"script", "style"}:
            self.skip = max(0, self.skip - 1)

    def handle_data(self, data):
        if not self.skip:
            self.text.append(data)


def main():
    failures = []
    canonical = ROOT / "assets/files/Siddhartha_Das_CV_Public.pdf"
    compatibility = ROOT / "assets/files/Siddhartha_Das_CV.pdf"
    if canonical.read_bytes() != compatibility.read_bytes():
        failures.append("The canonical and compatibility CVs differ")
    for path in (canonical, compatibility):
        with fitz.open(path) as pdf:
            text = "\n".join(page.get_text() for page in pdf)
            metadata = " ".join(str(value) for value in pdf.metadata.values())
            links = [link.get("uri", "") for page in pdf for link in page.get_links()]
            if PHONE.search(text + " " + metadata) or any(link.startswith("tel:") for link in links):
                failures.append(f"{path.name}: telephone information found")
            if POSTAL.search(text):
                failures.append(f"{path.name}: postal address candidate found")
            if pdf.embfile_count():
                failures.append(f"{path.name}: embedded file requires inspection")

    pages = list((ROOT / "_site").rglob("*.html"))
    for path in pages:
        parser = VisibleText()
        parser.feed(path.read_text())
        text = " ".join(parser.text)
        if PHONE.search(text) or POSTAL.search(text) or parser.telephone_links:
            failures.append(f"{path.relative_to(ROOT)}: personal contact candidate found")
    if failures:
        print("Privacy preflight failed (values intentionally withheld):")
        print("\n".join(f"- {failure}" for failure in failures))
        return 1
    print(f"Privacy preflight passed: both CV URLs and {len(pages)} rendered HTML pages.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
