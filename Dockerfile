ARG CADDY_VERSION=2

# 固定在原生架构上运行 builder，通过 GOOS/GOARCH 交叉编译，避免 QEMU 模拟
FROM --platform=$BUILDPLATFORM caddy:${CADDY_VERSION}-builder AS builder

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

RUN set -eux; \
    export GOOS="$TARGETOS" GOARCH="$TARGETARCH"; \
    [ -z "$TARGETVARIANT" ] || export GOARM="${TARGETVARIANT#v}"; \
    xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
