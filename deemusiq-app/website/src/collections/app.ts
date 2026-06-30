import type { IconType } from "react-icons";
import {
  FaAndroid,
  FaApple,
  FaDebian,
  FaFedora,
  FaOpensuse,
  FaUbuntu,
  FaWindows,
  FaRedhat,
  FaLinux,
} from "react-icons/fa6";
import { LuHouse, LuNewspaper, LuDownload, LuBook } from "react-icons/lu";

export const routes: Record<string, [string, IconType | null]> = {
  "/": ["Home", LuHouse],
  "/blog": ["Blog", LuNewspaper],
  "/docs": ["Docs", LuBook],
  "/downloads": ["Downloads", LuDownload],
  "/about": ["About", null],
};

const releasesUrl =
  "https://github.com/deemusiq/deemusiq/releases/latest/download";

export const downloadLinks: Record<string, [string, IconType[]]> = {
  "Android Apk": [`${releasesUrl}/DeeMusiq.apk`, [FaAndroid]],
  "Windows Executable": [
    `${releasesUrl}/DeeMusiq-windows-x86_64-setup.exe`,
    [FaWindows],
  ],
  "macOS Dmg": [`${releasesUrl}/DeeMusiq-macos-universal.dmg`, [FaApple]],
  "Ubuntu, Debian": [
    `${releasesUrl}/DeeMusiq-linux-x86_64.deb`,
    [FaUbuntu, FaDebian],
  ],
  "Fedora, Redhat, Opensuse": [
    `${releasesUrl}/DeeMusiq-linux-x86_64.rpm`,
    [FaFedora, FaRedhat, FaOpensuse],
  ],
  "iPhone Ipa": [`${releasesUrl}/DeeMusiq-iOS.ipa`, [FaApple]],
};

export const extendedDownloadLinks: Record<
  string,
  [string, IconType[], string]
> = {
  Android: [`${releasesUrl}/DeeMusiq.apk`, [FaAndroid], "apk"],
  Windows: [
    `${releasesUrl}/DeeMusiq-windows-x86_64-setup.exe`,
    [FaWindows],
    "exe",
  ],
  macOS: [`${releasesUrl}/DeeMusiq-macos-universal.dmg`, [FaApple], "dmg"],
  "Ubuntu, Debian (x64)": [
    `${releasesUrl}/DeeMusiq-linux-x86_64.deb`,
    [FaUbuntu, FaDebian],
    "deb",
  ],
  "Ubuntu, Debian (arm64)": [
    `${releasesUrl}/DeeMusiq-linux-aarch64.deb`,
    [FaUbuntu, FaDebian],
    "deb",
  ],
  "Fedora, Redhat, Opensuse": [
    `${releasesUrl}/DeeMusiq-linux-x86_64.rpm`,
    [FaFedora, FaRedhat, FaOpensuse],
    "rpm",
  ],
  "Linux AppImage (x64)": [
    `${releasesUrl}/DeeMusiq-linux-x86_64.AppImage`,
    [FaLinux],
    "AppImage",
  ],
  "Linux AppImage (arm64)": [
    `${releasesUrl}/DeeMusiq-linux-aarch64.AppImage`,
    [FaLinux],
    "AppImage",
  ],
  iPhone: [`${releasesUrl}/DeeMusiq-iOS.ipa`, [FaApple], "ipa"],
};

const nightlyReleaseUrl =
  "https://github.com/deemusiq/deemusiq/releases/download/nightly";

export const extendedNightlyDownloadLinks: Record<
  string,
  [string, IconType[], string]
> = {
  Android: [`${nightlyReleaseUrl}/DeeMusiq.apk`, [FaAndroid], "apk"],
  Windows: [
    `${nightlyReleaseUrl}/DeeMusiq-windows-x86_64-setup.exe`,
    [FaWindows],
    "exe",
  ],
  macOS: [`${nightlyReleaseUrl}/DeeMusiq-macos-universal.dmg`, [FaApple], "dmg"],
  "Ubuntu, Debian (x64)": [
    `${nightlyReleaseUrl}/DeeMusiq-linux-x86_64.deb`,
    [FaUbuntu, FaDebian],
    "deb",
  ],
  "Ubuntu, Debian (arm64)": [
    `${nightlyReleaseUrl}/DeeMusiq-linux-aarch64.deb`,
    [FaUbuntu, FaDebian],
    "deb",
  ],
  "Fedora, Redhat, Opensuse": [
    `${nightlyReleaseUrl}/DeeMusiq-linux-x86_64.rpm`,
    [FaFedora, FaRedhat, FaOpensuse],
    "rpm",
  ],
  "Linux AppImage (x64)": [
    `${nightlyReleaseUrl}/DeeMusiq-linux-x86_64.AppImage`,
    [FaLinux],
    "AppImage",
  ],
  "Linux AppImage (arm64)": [
    `${nightlyReleaseUrl}/DeeMusiq-linux-aarch64.AppImage`,
    [FaLinux],
    "AppImage",
  ],
  iPhone: [`${nightlyReleaseUrl}/DeeMusiq-iOS.ipa`, [FaApple], "ipa"],
};

// Ad slots — replace with DeeMusiq's own AdSense/ad-network IDs when
// monetisation partners are onboarded. Currently inactive placeholders.
export const ADS_SLOTS = Object.freeze({
  rootPageDisplay: 0,
  blogPageInFeed: 0,
  downloadPageDisplay: 0,
  packagePageArticle: 0,
  blogArticlePageArticle: 0,
});
