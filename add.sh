#!/bin/sh
# Adds a release to the repo: downloads the APK from the app's GitHub
# Release, rebuilds and signs the index, and commits. Push to publish.
# Usage: ./add.sh spenap/unmuffle v1.9.0
# Needs: `gh` logged in, the Android SDK, fdroidserver 2.4.3 with
# androguard 4.1.3 in ~/.cache/fdroidserver, and the repo key and its
# password in ~/.config/fdroid-repo (keystore.p12, pass).
set -eu
repo=${1:?Usage: $0 owner/app vX.Y.Z}
tag=${2:?Usage: $0 owner/app vX.Y.Z}
cd "$(dirname "$0")"

export ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}"
export PATH="$HOME/.cache/fdroidserver/bin:$PATH"
FDROID_KEY_PASS="$(cat "$HOME/.config/fdroid-repo/pass")"
export FDROID_KEY_PASS

gh release download "$tag" -R "$repo" -p '*.apk' -D repo
fdroid update
git add -A
git commit -q -m "$(basename "$repo") $tag"
echo "Added $repo $tag; push to publish."
