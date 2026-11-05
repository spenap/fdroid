# spenap F-Droid repository

Apps by Simon Pena, for F-Droid and compatible clients (Droid-ify, Neo
Store). The APKs are the same ones published in each app's GitHub
Releases, signed with the same key, so installs from either source update
each other.

## Add it
In your client: Repositories › Add, then paste

```
https://spenap.github.io/fdroid/repo?fingerprint=355879A3A98E7AD3A474DBA9D66E3B6306A4489B5EC128079CF644BC39AC7B7A
```

or open https://spenap.github.io/fdroid/repo on the phone and scan the QR
code. The fingerprint is the key that signs this repository's index.

## Apps
- [Unmuffle](https://github.com/spenap/unmuffle): read your voice
  messages, transcribed on your phone.

Each app's releases can be rebuilt from source and compared; see its
README.

## Maintaining
`./add.sh spenap/unmuffle v1.9.0` downloads a release's APK, rebuilds and
signs the index, and commits; push to publish. App descriptions live in
`metadata/`. The signing key is kept off the repo.
