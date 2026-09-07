This Docker image is used in development and testing environments. It aims at mirroring our production setup as close as possible. The image is based on Debian Trixie (see https://github.com/docker-library/ruby/).

## How to build this image

* Images are built and published to GHCR via GitHub Actions.
* Docker tag names are derived from the branch name.
* To build the image locally, use the supplied `build` script.

## Included dependencies

### Node.js

By default Node.js 24 will be installed via node-build (system-wide, not user-specific). Note that `npm` may be present but Yarn is the primary package manager.

### Yarn 2

Yarn 4 (Berry) is installed via [Corepack](https://yarnpkg.com/getting-started/install) and pinned for reproducibility.

### WeasyPrint

The official WeasyPrint package for Debian is installed <https://packages.debian.org/trixie/weasyprint>

### FFmpeg

The latest official ffmpeg package for Debian is installed <https://packages.debian.org/trixie/ffmpeg>
