FROM ubuntu:rolling

# ------------------- #
# Docker image labels #
# ------------------- #
LABEL description="Docker image for latex build" \
 vendor="Marcel Andree" \
 maintainer="marcel@andree.cloud"

# ------------------- #
# Install latex tools #
# ------------------- #
RUN apt-get update \
  && apt-get -q -y install \
    texlive-full \
    xindy \
    openjdk-8-jre \
    cm-super \
    git \
    librsvg2-bin \
    graphviz \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /opt/latex-builder

# -------------------- #
# Install build script #
# -------------------- #
ADD latex-build.sh /opt/latex-builder
RUN ln -s /opt/latex-builder/latex-build.sh /usr/local/bin/latex-build