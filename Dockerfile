ARG TAG=16-alpine
FROM node:$TAG

## Expose 8888 for the web server and 35729 for the LiveReload service
EXPOSE 8888/tcp 35729/tcp

WORKDIR /app

# Add aliases for a better .zsh shell
ADD files-to-include/.zshrc /root/.zshrc

# Install dependencies
RUN set -eux; \
    # add Canvas Sketch: https://github.com/mattdesl/canvas-sketch/
    npm install canvas-sketch-cli -g \
    && \
    # add FFMPEG, https://ffmpeg.org/download.html, per Canvas Sketch docs
    # https://github.com/mattdesl/canvas-sketch/blob/master/docs/exporting-artwork.md#ffmpeg-streaming
    npm install @ffmpeg-installer/ffmpeg --global \
    && \
    # Packages to install
    apk add --no-cache \
    && \
    apk add curl \
    && \
    apk add git \
    && \
    # Add .zsh shell
    apk add zsh \
    && \
    # Clean out directories that don't need to be part of the image
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Since this is a command line app, by default, we want to run the bash shell
CMD ["/bin/zsh"]
