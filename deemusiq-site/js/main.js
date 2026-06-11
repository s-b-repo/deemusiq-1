/* ============================================================
   DeeMusiq site behaviour
   ============================================================ */
(function () {
  "use strict";

  /* ----------------------------------------------------------
     DOWNLOAD CONFIG  ← edit these when the DeeMusiq app builds
     are published as a GitHub Release. Leave a value empty ('')
     and that button will route users to the contact form to
     request early access.
     ---------------------------------------------------------- */
  var DOWNLOADS = {
    android: "", // e.g. "https://github.com/<you>/deemusiq/releases/latest/download/DeeMusiq.apk"
    windows: "", // e.g. ".../DeeMusiq-setup.exe"
    linux:   "", // e.g. ".../DeeMusiq.AppImage"
    macos:   ""  // e.g. ".../DeeMusiq.dmg"
  };
  var CONTACT_EMAIL = "deemusiq@protonmail.com";

  /* ---------- current year ---------- */
  var yr = document.getElementById("yr");
  if (yr) yr.textContent = new Date().getFullYear();

  /* ---------- nav: scrolled state + mobile menu ---------- */
  var nav = document.querySelector(".nav");
  var onScroll = function () {
    if (nav) nav.classList.toggle("scrolled", window.scrollY > 12);
  };
  onScroll();
  window.addEventListener("scroll", onScroll, { passive: true });

  var burger = document.querySelector(".nav__burger");
  var mobile = document.getElementById("mobileMenu");
  if (burger && mobile) {
    burger.addEventListener("click", function () {
      var open = nav.classList.toggle("open");
      burger.setAttribute("aria-expanded", open ? "true" : "false");
      mobile.hidden = !open;
    });
    mobile.querySelectorAll("a").forEach(function (a) {
      a.addEventListener("click", function () {
        nav.classList.remove("open");
        burger.setAttribute("aria-expanded", "false");
        mobile.hidden = true;
      });
    });
  }

  /* ---------- scroll reveal ---------- */
  var reveals = document.querySelectorAll(".reveal");
  if ("IntersectionObserver" in window && reveals.length) {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (e) {
        if (e.isIntersecting) {
          e.target.classList.add("in");
          io.unobserve(e.target);
        }
      });
    }, { threshold: 0.12, rootMargin: "0px 0px -8% 0px" });
    reveals.forEach(function (el) { io.observe(el); });
  } else {
    reveals.forEach(function (el) { el.classList.add("in"); });
  }

  /* ---------- count-up stats ---------- */
  var counters = document.querySelectorAll(".stat b[data-count]");
  if ("IntersectionObserver" in window && counters.length) {
    var co = new IntersectionObserver(function (entries) {
      entries.forEach(function (e) {
        if (!e.isIntersecting) return;
        co.unobserve(e.target);
        var el = e.target, target = parseInt(el.dataset.count, 10), start = null;
        var step = function (ts) {
          if (!start) start = ts;
          var p = Math.min((ts - start) / 1000, 1);
          el.textContent = Math.floor(p * target).toString();
          if (p < 1) requestAnimationFrame(step); else el.textContent = target.toString();
        };
        requestAnimationFrame(step);
      });
    }, { threshold: 0.5 });
    counters.forEach(function (el) { co.observe(el); });
  }

  /* ---------- download buttons ---------- */
  document.querySelectorAll(".dl[data-platform]").forEach(function (a) {
    var p = a.getAttribute("data-platform");
    var url = DOWNLOADS[p];
    if (url) {
      a.setAttribute("href", url);
      a.setAttribute("rel", "noopener");
    } else {
      a.addEventListener("click", function (ev) {
        ev.preventDefault();
        var note = document.getElementById("dlNote");
        if (note) {
          note.style.color = "var(--orange-2)";
          note.scrollIntoView({ behavior: "smooth", block: "center" });
          setTimeout(function () { note.style.color = ""; }, 4000);
        }
        var topic = document.getElementById("cf-topic");
        var msg = document.getElementById("cf-msg");
        if (topic) topic.value = "Listener / customer";
        if (msg) msg.value = "I'd like early access to the DeeMusiq app for " + p + ".";
        document.getElementById("contact").scrollIntoView({ behavior: "smooth" });
      });
    }
  });

  /* ---------- OS hint: highlight the matching download button ---------- */
  var ua = navigator.userAgent;
  var osHint = /android/i.test(ua)            ? "android"
             : /windows/i.test(ua)            ? "windows"
             : /macintosh|mac os x/i.test(ua) ? "macos"
             : /linux/i.test(ua)              ? "linux"
             : null;
  if (osHint) {
    var dlBtn = document.querySelector('.dl[data-platform="' + osHint + '"]');
    if (dlBtn) dlBtn.classList.add("dl--active");
  }

  /* ---------- contact form → mailto ---------- */
  var form = document.getElementById("contactForm");
  if (form) {
    form.addEventListener("submit", function (ev) {
      ev.preventDefault();
      if (!form.reportValidity()) return;
      // Use the form controls collection — `form.name` would resolve to the
      // form's own `name` attribute, not the <input name="name"> field.
      var els = form.elements;
      var name = (els.namedItem("name").value || "").trim();
      var email = (els.namedItem("email").value || "").trim();
      var topic = els.namedItem("topic").value;
      var message = (els.namedItem("message").value || "").trim();
      var subject = "[DeeMusiq] " + topic + " — " + name;
      var body =
        "Name: " + name + "\n" +
        "Email: " + email + "\n" +
        "I am a: " + topic + "\n\n" +
        message + "\n";
      window.location.href =
        "mailto:" + CONTACT_EMAIL +
        "?subject=" + encodeURIComponent(subject) +
        "&body=" + encodeURIComponent(body);
    });
  }
})();
