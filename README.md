# Climb Duel – distribution folder

A static, dependency-free web page. Upload the folder contents to any web host. No build step, no tracking, no third-party requests (fonts are self-hosted).

## 1. Set your domain (do this first)
Canonical URL, Open Graph, JSON-LD, `robots.txt` and `sitemap.xml` contain the placeholder `https://example.com`.

    ./set-domain.sh https://your-domain.tld

If the site lives in a sub-folder (for example `/tools/climb-duel/`), also edit the `canonical`, `og:url`, `og:image`, `twitter:image` and sitemap `loc` values by hand, and change `start_url`, `scope` and `id` in `site.webmanifest`. In `404.html` the links are root-relative (`/`).

## 2. Files
| File | Purpose |
| --- | --- |
| `index.html` | The whole app: HTML, CSS and JavaScript, plus SEO tags and JSON-LD (WebApplication and FAQPage) |
| `favicon.ico`, `favicon.svg`, `apple-touch-icon.png`, `icons/` | Favicon set and PWA icons (including a maskable icon) |
| `og-image.png` | 1200 × 630 preview for link sharing |
| `site.webmanifest` | Install-to-home-screen metadata |
| `robots.txt` | Allows all crawlers and points to the sitemap |
| `sitemap.xml` | One URL; update `lastmod` when you change the page |
| `404.html` | Not-found page (`noindex`) |
| `fonts/` | Self-hosted WOFF2 fonts (Unbounded, Schibsted Grotesk, JetBrains Mono, SIL Open Font License) |
| `_headers`, `.htaccess` | Cache and security headers for Netlify / Cloudflare Pages and Apache. Delete the one you do not need |

## 3. After publishing
1. Open the page and check that the fonts, icons and the replay load.
2. Submit `https://your-domain.tld/sitemap.xml` in Google Search Console and Bing Webmaster Tools, and request indexing of the home page.
3. Test the structured data with Google's Rich Results Test and the sharing preview with the LinkedIn Post Inspector or Facebook Sharing Debugger.
4. Serve over HTTPS and redirect `www` to the bare domain (or the other way round) so there is only one canonical host.

## Notes
- The calculator uses the steady-state climbing power equation in still air. See the "How it is calculated" section on the page.
- Fonts are licensed under the SIL Open Font License 1.1.
