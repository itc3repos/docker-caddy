FROM alpine:3.6
LABEL caddy_version="v0.10.4" architecture="amd64"

ARG caddy_version=v0.10.4
ARG plugins=http.cors,http.git,http.realip,http.ipfilter,tls.dns.googlecloud,tls.dns.route53

RUN apk add --no-cache openssh-client git tar curl

RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/linux/amd64?plugins=${plugins}" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
 && chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version

COPY Caddyfile /srv/config/Caddyfile
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /srv
WORKDIR /srv
ENTRYPOINT ["/entrypoint.sh", "-conf", "/srv/config/Caddyfile"]
