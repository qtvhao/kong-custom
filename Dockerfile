# Use official Kong Gateway OSS image
FROM kong:3.6

# Copy your declarative config into the container
COPY kong/declarative/kong.yml /etc/kong/kong.yml

# Set environment variables to tell Kong to use declarative (DB-less) mode
ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/etc/kong/kong.yml
ENV KONG_PROXY_LISTEN=0.0.0.0:8000, 0.0.0.0:8443 ssl
ENV KONG_ADMIN_LISTEN=0.0.0.0:8001

# Expose ports (HTTP:8000, HTTPS:8443, Admin API:8001)
EXPOSE 8000 8443 8001

# Start Kong
CMD ["kong", "docker-start"]
