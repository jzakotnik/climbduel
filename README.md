# Climb Duel

**Who wins the climb: the light rider or the strong rider?** Climb Duel is a small web app that compares two cyclists on the same climb and shows who reaches the top first, using a physical power model.

Enter distance and average grade, then each rider's body weight, bike weight and speed. The app works out the power each rider produces and the resulting climbing time, and animates a race to the top so you can see the gap.

Live: <https://openlibry.de/derjure/cycleduel/>

## Features
- Two riders with editable weight, bike weight and speed
- Three ways to describe a rider: **flat pace** (speed on the flat), **watts**, or **climb speed**
- Adjustable CdA, rolling resistance, drivetrain efficiency and air density
- Animated replay of the climb
- Static, dependency-free single page: no build step, no tracking, no third-party requests (fonts are self-hosted)
- Installable as a PWA, with SEO and sharing metadata

## How it works
The calculator uses the steady-state climbing power equation in still air: power at the pedals, reduced by drivetrain efficiency, equals the sum of gravity, rolling resistance and air drag, each times speed. Results are estimates for comparing two riders, not exact predictions. The page has a "How it is calculated" section with details.

## Run locally
No installation needed. Open `index.html` in a browser, or serve the folder:

    python3 -m http.server 8000

then visit <http://localhost:8000>.

## Install on your own web server
1. Set your domain (updates canonical URL, Open Graph, JSON-LD, `robots.txt`, `sitemap.xml`):

        ./set-domain.sh https://your-domain.tld

   If the site lives in a sub-folder, also edit `canonical`, `og:url`, `og:image`, `twitter:image` and the sitemap `loc` by hand, and `start_url`, `scope` and `id` in `site.webmanifest`. Links in `404.html` are root-relative (`/`).
2. Upload the folder contents to the web root, e.g.

        scp -r -i ~/.ssh/your_key index.html 404.html impressum.html fonts icons *.png *.ico *.svg *.txt *.xml *.webmanifest _headers user@host:/var/www/html/climbduel/

3. Serve over HTTPS and use one canonical host (`www` or bare domain). Submit `sitemap.xml` to Google Search Console and Bing Webmaster Tools.

## Automatic deployment (GitHub Actions)
`.github/workflows/deploy.yml` deploys with `scp` over SSH (no `rsync` needed on the server) on every push to `main`, or manually via *Actions → Deploy → Run workflow*.

One-time setup:
1. Create a dedicated deploy key: `ssh-keygen -t ed25519 -f deploy_key -C climbduel-deploy -N ""`. Append `deploy_key.pub` to `~/.ssh/authorized_keys` on the server.
2. In the GitHub repo under *Settings → Secrets and variables → Actions*, add the **secrets**:
   - `SSH_PRIVATE_KEY`: contents of `deploy_key`
   - `SSH_KNOWN_HOSTS`: output of `ssh-keyscan -t ed25519 openlibry.de`
3. Optional **variables** (defaults in parentheses): `DEPLOY_USER` (`jure`), `DEPLOY_HOST` (`openlibry.de`), `DEPLOY_PATH` (`/var/www/html/derjure/cycleduel`).

Files are copied and overwritten; files deleted from the repository are not removed from the server.

## Files
| File | Purpose |
| --- | --- |
| `index.html` | The whole app: HTML, CSS, JavaScript, SEO tags, JSON-LD |
| `impressum.html` | Legal notice, links to the author's GitHub profile |
| `404.html` | Not-found page (`noindex`) |
| `favicon.*`, `apple-touch-icon.png`, `icons/` | Favicon set and PWA icons |
| `og-image.png` | 1200 × 630 link preview |
| `site.webmanifest` | Install-to-home-screen metadata |
| `robots.txt`, `sitemap.xml` | Crawler hints |
| `fonts/` | Self-hosted WOFF2 fonts (Unbounded, Schibsted Grotesk, JetBrains Mono; SIL OFL 1.1) |
| `_headers` | Cache/security headers for Netlify / Cloudflare Pages |
| `set-domain.sh` | Replaces the placeholder domain |

## License
Code: MIT, see `LICENSE`. Fonts: SIL Open Font License 1.1.

Author: [Jure Zakotnik](https://github.com/jzakotnik)
