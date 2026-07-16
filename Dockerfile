FROM ruby:4.0.6-bookworm
ARG TARGETPLATFORM

# build essentials
COPY scripts/install-essentials /tmp/install-essentials
RUN /tmp/install-essentials

# Node.js
ARG NODE_VERSION=24
ENV PATH=/usr/local/node/bin:$PATH
COPY scripts/install-node /tmp/install-node
RUN NODE_VERSION=$NODE_VERSION /tmp/install-node && node --version

# Yarn
ENV COREPACK_HOME=/usr/local/share/corepack
COPY scripts/install-yarn /tmp/install-yarn
RUN /tmp/install-yarn && yarn --version

# wkhtmltopdf
COPY scripts/install-wkhtmltopdf /tmp/install-wkhtmltopdf
RUN /tmp/install-wkhtmltopdf && wkhtmltopdf --version

# FFmpeg
COPY scripts/install-ffmpeg /tmp/install-ffmpeg
RUN /tmp/install-ffmpeg && ffmpeg -version && ffprobe -version

# Install bundler 2 & RubyGems
RUN gem install bundler
RUN gem update --system

# Remove copied helper scripts and temporary files
RUN rm -rf /tmp/* /var/tmp/*

# Set locale to UTF-8
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
