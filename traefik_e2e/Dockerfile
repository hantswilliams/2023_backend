FROM traefik:v2.9

COPY traefik.yaml /etc/traefik/traefik.yaml

RUN mkdir -p /etc/traefik/acme \
  && touch /etc/traefik/acme/acme.json \
  && chmod 600 /etc/traefik/acme/acme.json

EXPOSE 80 443 8080