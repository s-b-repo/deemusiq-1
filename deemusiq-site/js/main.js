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
    android: "https://github.com/deemusiq/deemusiq/releases/latest/download/DeeMusiq.apk",
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
    if (!p) return;
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
        var contactEl = document.getElementById("contact");
        if (contactEl) contactEl.scrollIntoView({ behavior: "smooth" });
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
      var els = form.elements;
      var nameField = els.namedItem("name");
      var emailField = els.namedItem("email");
      var topicField = els.namedItem("topic");
      var messageField = els.namedItem("message");
      if (!nameField || !emailField || !topicField || !messageField) return;
      var nameVal = (nameField.value || "").trim();
      var emailVal = (emailField.value || "").trim();
      var topicVal = topicField.value || "";
      var messageVal = (messageField.value || "").trim();
      var subject = "[DeeMusiq] " + topicVal + " — " + nameVal;
      var body =
        "Name: " + nameVal + "\n" +
        "Email: " + emailVal + "\n" +
        "I am a: " + topicVal + "\n\n" +
        messageVal + "\n";
      window.location.href =
        "mailto:" + CONTACT_EMAIL +
        "?subject=" + encodeURIComponent(subject) +
        "&body=" + encodeURIComponent(body);
    });
  }
})();
