# Re-theme options (preview only — not for merging)

Four candidate themes for the site, rendered side by side in the comparison
page shared in the session. Each is CSS only: a Starlight `theme.css`, the
standalone-page `site.css`, and a Google Fonts URL.

| Folder | Option | Idea |
|---|---|---|
| `drawing/` | A — Drawing Sheet | Sibling of aidanstew.art: paper, ink, osifont + B612, orange as markup color |
| `signage/` | B — Shop Signage | ANSI Z535 sign language: black plate header, signal-word callout bands, Barlow |
| `manual/` | C — Field Manual | Printed service manual: Source Serif 4, numbered sections, Aggie maroon |
| `panel/` | D — Control Panel | Graphite equipment panel: IBM Plex Sans + Mono, orange indicator lamp |

To try one locally:

```bash
theme-options/apply.sh drawing   # or signage / manual / panel
npx astro dev
git checkout -- . && git clean -fd public/fonts   # undo
```

`_layout.css` is the layout half of the current `theme.css` (TOC rail, sidebar
nesting, side-by-side images), unchanged; each option only replaces the look.
Once an option is chosen, it gets applied properly in its own PR and this
folder is deleted.
