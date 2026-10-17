#!/usr/bin/env sh
# Usage: ./set-domain.sh https://your-domain.tld   (no trailing slash)
# Replaces the placeholder domain in canonical, Open Graph, JSON-LD, robots and sitemap.
set -e
[ -n "$1" ] || { echo "Usage: $0 https://your-domain.tld"; exit 1; }
NEW=$(printf '%s' "$1" | sed 's:/*$::')
for f in index.html robots.txt sitemap.xml; do
  sed -i.bak "s#https://example.com#$NEW#g" "$f" && rm -f "$f.bak"
done
echo "Domain set to $NEW"
