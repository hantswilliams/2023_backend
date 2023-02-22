# Use the official Traefik image as the base image
FROM traefik:v2.4

# Copy the Traefik configuration file into the container
COPY traefik.yaml /etc/traefik/traefik.yaml

# Expose the ports for the Traefik dashboard and API
EXPOSE 8080 8081
