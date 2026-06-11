# DeeMusiq — Website

> *It's a drop day.* Africa's home-grown music platform — stream & download, artists own their work.

A fast, single-page, fully static website (no build step). Drop it on **GitHub Pages**, Netlify, or any web host.

---

## What's inside

```
deemusiq-site/
├── index.html              # the whole page
├── css/styles.css          # all styling (dark / honeycomb / orange theme)
├── js/main.js              # nav, scroll reveals, contact form, download buttons
├── assets/img/             # logo, favicons + your own artwork
├── .nojekyll               # tells GitHub Pages to serve the css/ & js/ folders as-is
└── README.md               # this file
```

---

## 🚀 Deploy to GitHub Pages (free)

You don't need any coding for this. Two ways:

### A) Drag-and-drop (easiest)
1. Go to <https://github.com> and sign in (create a free account if needed).
2. Click **New repository** → name it `deemusiq` → set it **Public** → **Create repository**.
3. On the repo page click **uploading an existing file**.
4. Drag **everything inside this `deemusiq-site` folder** (the `index.html`, the `css`, `js`, `assets` folders and `.nojekyll`) into the upload box → **Commit changes**.
5. Go to **Settings → Pages**.
6. Under *Build and deployment* → *Source* choose **Deploy from a branch**, branch **main**, folder **/(root)** → **Save**.
7. Wait ~1 minute. Your site is live at:
   **`https://<your-username>.github.io/deemusiq/`**

### B) Command line (if you use git)
```bash
cd "deemusiq-site"
git init
git add .
git commit -m "DeeMusiq website"
git branch -M main
# create the repo on github.com first, then:
git remote add origin https://github.com/<your-username>/deemusiq.git
git push -u origin main
# then enable Pages under Settings → Pages (branch: main, folder: /root)
```

---

## ✏️ Things to update (search & replace)

| What | Where | Current value |
|------|-------|---------------|
| Contact email | `index.html` (mailto link) **and** `js/main.js` (`CONTACT_EMAIL`) | `deemusiq@protonmail.com` ✅ from client docs |
| Phone / WhatsApp | `index.html` → search `+27 73 725 3454` | `+27 73 725 3454` ✅ from client docs |
| Social links | `index.html` → `contact__socials` (the `href="#"`) | `#` — add your real handles |
| Download links | `js/main.js` → the `DOWNLOADS` object | empty (routes to contact) |

### Wiring up the app downloads
When the **DeeMusiq app** (your rebranded Spotube build) is published as a GitHub
Release, paste the file URLs into `js/main.js`:

```js
var DOWNLOADS = {
  android: "https://github.com/<you>/deemusiq/releases/latest/download/DeeMusiq.apk",
  windows: "https://github.com/<you>/deemusiq/releases/latest/download/DeeMusiq-setup.exe",
  linux:   "https://github.com/<you>/deemusiq/releases/latest/download/DeeMusiq.AppImage",
  macos:   "https://github.com/<you>/deemusiq/releases/latest/download/DeeMusiq.dmg"
};
```
Any button left as `""` automatically sends visitors to the contact form to
request early access — so the page is never broken while you wait for a build.

---

## 📬 Want a real contact form (no email app popup)?

The form currently opens the visitor's email app (works everywhere, no signup).
For a hosted form that lands in your inbox:

1. Create a free form at <https://formspree.io> → copy your form ID.
2. In `index.html`, change the `<form>` tag to:
   ```html
   <form class="contact__form" id="contactForm" action="https://formspree.io/f/XXXX" method="POST">
   ```
3. In `js/main.js`, delete the `contact form → mailto` block (so the browser submits normally).

---

## 🌐 Custom domain (e.g. deemusiq.co.za)
1. Buy the domain (e.g. from a South African registrar).
2. In the repo: **Settings → Pages → Custom domain** → enter `deemusiq.co.za` → Save.
3. At your domain registrar, add the DNS records GitHub shows you (4 × A records + a CNAME).
4. Tick **Enforce HTTPS** once it's verified.

---

## Credits & licensing
- Brand, artwork and content © DeeMusiq / The Dembe Group.
- The companion **DeeMusiq app** is a rebrand of [Spotube](https://github.com/KRTirtho/spotube),
  open-source under the **BSD-4-Clause** license. Keep Spotube's `LICENSE` and copyright
  notices in the app distribution (see the app folder's README).
