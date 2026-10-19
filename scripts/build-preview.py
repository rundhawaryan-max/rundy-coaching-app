#!/usr/bin/env python3
"""Build a phone-testable copy of both apps pointed at a TEST Supabase project.

    python3 scripts/build-preview.py <supabase url> <anon key> [out dir]

Writes out/ (default dist-preview/) with index.html, client.html, the font, the icons, the manifest and the
service worker, with SB_URL/SB_KEY swapped and every absolute /path made relative, so the folder works from a
sub-path such as GitHub Pages (https://<owner>.github.io/<repo>/client.html?t=<token>). Nothing in the repo
changes; push the folder to the `preview` branch and enable Pages on it.
"""
import re, shutil, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
if len(sys.argv) < 3: sys.exit(__doc__)
url, key = sys.argv[1].rstrip('/'), sys.argv[2]
out = Path(sys.argv[3]) if len(sys.argv) > 3 else ROOT / 'dist-preview'
if out.exists(): shutil.rmtree(out)
out.mkdir(parents=True)

def swap(html):
    html, n1 = re.subn(r"const SB_URL='[^']*';", f"const SB_URL='{url}';", html)
    html, n2 = re.subn(r"const SB_KEY='[^']*';", f"const SB_KEY='{key}';", html)
    assert (n1, n2) == (1, 1), 'SB_URL/SB_KEY not found exactly once'
    for folder in ('fonts', 'icons'):
        html = html.replace(f"/{folder}/", f"{folder}/")
    return html.replace('href="/manifest.webmanifest"', 'href="manifest.webmanifest"').replace("register('/sw.js')", "register('sw.js')")

for page in ('index.html', 'client.html'):
    (out / page).write_text(swap((ROOT / page).read_text()))
(out / 'manifest.webmanifest').write_text((ROOT / 'manifest.webmanifest').read_text().replace('"/icons/', '"icons/').replace('"scope": "/"', '"scope": "./"'))
shutil.copy(ROOT / 'sw.js', out / 'sw.js')
for folder in ('fonts', 'icons'):
    shutil.copytree(ROOT / folder, out / folder)
(out / '.nojekyll').write_text('')   # GitHub Pages: serve as-is
print('built', out, 'pointing at', url)
