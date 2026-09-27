#!/usr/bin/env bash
# Apply one re-theme option to the working tree so you can see it with
# `npx astro dev`. Undo with:  git checkout -- . && git clean -fd public/fonts
# usage: theme-options/apply.sh drawing|signage|manual|panel
set -euo pipefail
cd "$(dirname "$0")/.."
O="theme-options/$1"
[ -d "$O" ] || { echo "no option named $1"; exit 1; }
OLD='https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700\&family=Space+Grotesk:wght@500;700\&display=swap'
NEW=$(sed 's/&/\\&/g' "$O/fonts.url")
# The layout rules (TOC rail, side-by-side images, sidebar nesting) are shared;
# the option's look is appended after them so it wins.
cat theme-options/_layout.css "$O/theme.css" > src/styles/theme.css
cp "$O/site.css" src/styles/site.css
for f in astro.config.mjs src/pages/index.astro src/pages/contact.astro src/pages/ask.astro; do
	sed -i "s|$OLD|$NEW|" "$f"
done
# Standalone pages read their fonts from the option's --font-body / --font-display.
for f in src/pages/index.astro src/pages/contact.astro src/pages/ask.astro; do
	sed -i "s|font-family: 'Inter', system-ui, sans-serif;|font-family: var(--font-body);|; s|font-family: 'Space Grotesk', sans-serif;|font-family: var(--font-display);|" "$f"
done
[ -d "$O/public" ] && cp -r "$O/public/." public/
echo "Applied $1. Run: npx astro dev"
