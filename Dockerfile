# ==============================================================================
# First stage build (compile V8)
# ==============================================================================

FROM debian:bullseye-slim as builder

ARG V8_VERSION=latest

RUN apt-get update && apt-get upgrade -yqq

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install bison \
                    cdbs \
                    curl \
                    flex \
                    g++ \
                    git \
                    python \
                    vim \
                    pkg-config -yqq

RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

ENV PATH="/depot_tools:${PATH}"

RUN fetch v8 && \
    cd /v8 && \
    git checkout ${V8_VERSION} && \
    ./tools/dev/v8gen.py x64.release -- v8_use_external_startup_data=false && \
    ninja -C out.gn/x64.release && \
    strip out.gn/x64.release/d8

# ==============================================================================
# Second stage build
# ==============================================================================

FROM debian:bullseye-slim

ARG V8_VERSION=latest
ENV V8_VERSION=$V8_VERSION

LABEL v8.version=$V8_VERSION \
      maintainer="andre.burgaud@gmail.com"

RUN apt-get update && apt-get upgrade -yqq && \
    DEBIAN_FRONTEND=noninteractive apt-get install curl rlwrap vim -yqq && \
    apt-get clean

WORKDIR /v8

COPY --from=builder /v8/out.gn/x64.release/d8 ./

COPY vimrc /root/.vimrc

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh && \
    mkdir /examples && \
    ln -s /v8/d8 /usr/local/bin/d8

ENTRYPOINT ["/entrypoint.sh"]
