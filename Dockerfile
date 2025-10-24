ARG CADDY_VERSION=2
ARG CROWDSEC_BOUNCER_REF=main
FROM caddy:${CADDY_VERSION}-builder-alpine AS builder

RUN xcaddy build --with github.com/hslatman/caddy-crowdsec-bouncer/http@${CROWDSEC_BOUNCER_REF}

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
