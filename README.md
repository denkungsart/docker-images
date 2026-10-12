This Docker image is used in development and testing environments. It aims at mirroring our production setup as close as possible. The image is based on the slim Debian Trixie variant of the official Ruby image (see https://github.com/docker-library/ruby/), plus the build toolchain and headers that gems with native extensions need.

## How to build this image

* Images are built and published to GHCR via GitHub Actions.
* Docker tag names are derived from the branch name.
* To build the image locally, use the supplied `build` script.

## Included dependencies

### Node.js

By default Node.js 24 will be installed via node-build (system-wide, not user-specific). Note that `npm` may be present but Yarn is the primary package manager.

### Yarn 2

Yarn 4 (Berry) is installed via [Corepack](https://yarnpkg.com/getting-started/install) and pinned for reproducibility.

### FFmpeg

The latest official ffmpeg package for Debian is installed <https://packages.debian.org/trixie/ffmpeg>

### Chrome

On amd64, the current Google Chrome stable release is installed together with the matching chromedriver from [Chrome for Testing](https://github.com/GoogleChromeLabs/chrome-for-testing). Google does not publish Linux arm64 builds, so arm64 images get Debian's `chromium` and `chromium-driver` packages instead, with `google-chrome` linked to `chromium`.

Chrome is not pinned: rebuilding the image picks up the latest stable release.
