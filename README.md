This Docker image is used in development and testing environments. It aims at mirroring our production setup as close as possible. The image is based on Debian Bookworm (see https://github.com/docker-library/ruby/).

## How to build this image

* Images are built and published to GHCR via GitHub Actions.
* Docker tag names are derived from the branch name.
* To build the image locally, use the supplied `build` script.

## Included dependencies

### Node.js

By default Node.js 24 will be installed as per the [official guidelines](https://nodejs.org/en/download). Note that `npm` may be present but Yarn is the primary package manager.

### Yarn 2

Yarn 4 (Berry) is installed via [Corepack](https://yarnpkg.com/getting-started/install) and pinned for reproducibility.

### wkhtmltopdf

The latest stable version of wkhtmltopdf is installed from https://github.com/wkhtmltopdf/packaging/releases

### FFmpeg

The latest official ffmpeg package for Debian is installed <https://packages.debian.org/bookworm/ffmpeg>
