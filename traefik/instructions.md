
# Instructions 

This file configures Traefik to use a file provider that reads configuration files from /etc/traefik/config. 

It also defines two routers, api-v1 and api-v2, each with a different hostname and service name. 

The service definition for api-v1 specifies a load balancer with a single server at IP address 23.534.12.32, while the service definition for api-v2 specifies a load balancer with a single server at IP address 52.12.423.12. 

Note that you'll need to have DNS entries pointing to the appropriate hostnames for api-v1 and api-v2.

## Notes 
- should have chatGPT regenerate this to auto-configure HTTPS / and route all non-secure traffic appropraitely 
