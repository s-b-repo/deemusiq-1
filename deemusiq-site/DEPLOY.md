# Deploying DeeMusiq Site to GitHub Pages

## Quick deploy (under 5 minutes)

### 1. Create a GitHub repository

Go to **github.com → New repository** and pick a name:

| Repo name | Live URL |
|-----------|----------|
| `yourusername.github.io` | `https://yourusername.github.io` |
| anything else (e.g. `deemusiq`) | `https://yourusername.github.io/deemusiq` |

Use a public repository — GitHub Pages requires it on free plans.

---

### 2. Push the site

```bash
# From the project root (one level above deemusiq-site/)
cd deemusiq-site

git init
git add .
git commit -m "Deploy DeeMusiq site"
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

> If the repo already has commits, replace the last line with:
> `git push -u origin main --force`

---

### 3. Enable GitHub Pages

1. Open your repo on GitHub.
2. Go to **Settings → Pages**.
3. Under **Build and deployment**, set:
   - Source: **Deploy from a branch**
   - Branch: **main** · Folder: **/ (root)**
4. Click **Save**.

Wait about 1–2 minutes, then open the URL shown at the top of the Pages settings screen.

---

## Custom domain (optional)

### A. Point your DNS to GitHub

In your domain registrar's DNS panel, add these records:

```
Type    Host    Value
A       @       185.199.108.153
A       @       185.199.109.153
A       @       185.199.110.153
A       @       185.199.111.153
CNAME   www     YOUR_USERNAME.github.io
```

### B. Configure the domain in GitHub

Settings → Pages → **Custom domain** → type `www.deemusiq.co.za` → **Save**.  
GitHub automatically provisions a free TLS certificate (up to 24 h for DNS to propagate).

### C. Commit a CNAME file

Create `deemusiq-site/CNAME` (no extension) containing your domain on a single line:

```
www.deemusiq.co.za
```

Commit and push it so the custom domain persists across future deployments.

---

## Post-deploy checklist

- [ ] **`og:image` URL** — Open `index.html` and change the `og:image` value from the relative path to a full absolute URL:
  ```html
  <meta property="og:image" content="https://www.deemusiq.co.za/assets/img/apple-touch-icon.png" />
  ```
  Relative URLs are silently ignored by social crawlers (Facebook, WhatsApp, Telegram).

- [ ] **`og:url` meta** — Add below the existing OG tags:
  ```html
  <meta property="og:url" content="https://www.deemusiq.co.za" />
  ```

- [ ] **Social links** — In `index.html`, find the `contact__socials` block and replace the `href="#"` placeholders with real profile URLs (Facebook, Instagram, TikTok, X).

- [ ] **Test on mobile** — Open the live URL on a phone. Check: hamburger menu opens/closes, sticky nav scrolls correctly, and the contact form opens in the mail app.

- [ ] **Test social share preview** — Paste the URL into:
  - [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/)
  - [Twitter Card Validator](https://cards-dev.twitter.com/validator)
  Verify the title, description, and image appear correctly.

---

## Wiring up the APK download link

Once a CI build publishes a GitHub Release (push a tag like `v1.0.0`), the Android download button goes live by editing one constant in `js/main.js`:

```javascript
var DOWNLOADS = {
  android: "https://github.com/YOUR_USERNAME/YOUR_REPO/releases/latest/download/DeeMusiq.apk",
  windows: "",  // fill in when the Windows build is ready
  linux:   "",  // fill in when the Linux build is ready
  macos:   ""   // fill in when the macOS build is ready
};
```

Commit and push — no other changes needed.

---

## Auto-deploy on every push (optional)

Create `.github/workflows/pages.yml` **in the site repo** (the repo that only holds `deemusiq-site/` files):

```yaml
name: Deploy to GitHub Pages
on:
  push:
    branches: [main]
permissions:
  pages: write
  id-token: write
jobs:
  deploy:
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deploy.outputs.page_url }}
    steps:
      - uses: actions/checkout@v4
      - uses: actions/configure-pages@v5
      - uses: actions/upload-pages-artifact@v3
        with:
          path: "."
      - id: deploy
        uses: actions/deploy-pages@v4
```

Then change Settings → Pages → Source to **GitHub Actions**.  
Every `git push` to `main` will re-deploy the site automatically.

---

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| 404 after enabling Pages | Wait 1–2 min; double-check branch and folder settings |
| CSS / images not loading | Paths in `index.html` are already relative — don't move files or change the folder structure |
| Custom domain reverts after each push | Commit the `CNAME` file into the repo root |
| TLS certificate stays pending | DNS propagation can take up to 48 h; the padlock appears once GitHub validates it |
| OG image missing in link previews | Must be a full `https://` URL — update `og:image` in `index.html` after deployment |
| Contact form opens wrong email app | The form converts to a `mailto:` link; behaviour depends on the user's OS default mail app — expected |
