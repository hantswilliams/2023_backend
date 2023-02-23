# About 

- this is a working version of using TRAEFIK as a reverse proxy/load balancer on Machine A - and then having a number of other different services (say Flask applications on Machine B, C, D) being routed via Traefik 

- in order for this to work, need to have the Traefik's IP address mapped to the main/root domain - a record - within your DNS managmenet service (e.g., godaddy, aws, etc...)

- for each additional subdomain, all you need to do is create a new A-record, and then have the IP address for that subdomain point to the Traefik IP address, and it will handle the rest 

- what i still need to test here, is if you can use a wild card for the subdomain in the DNS / e.g., wildcard for A-record and point everything that way automatically to the Traefik service, that way you don't need to write a bunch of separate A-records, and its also better from a security perspective as well 