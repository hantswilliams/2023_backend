
Build command:
```
docker build -t traefik . 
```

Run command:
```
docker run -d -p 80:80 -p 443:443 -v /var/run/docker.sock:/var/run/docker.sock -v /path/to/traefik.toml:/etc/traefik/traefik.toml traefik
``` 


Before doing this stuff, 
still need to setup DNS stuff though - should optimize this later 

Yes, to use HTTPS with Traefik and Let's Encrypt, you will need to make sure that the DNS records for the domain names you want to use are properly configured. Specifically, you will need to create DNS records pointing to the public IP address of the server running Traefik.

The DNS records should include both an A record and a CAA record. The A record should point to the IP address of your server, and the CAA record should specify that Let's Encrypt is allowed to issue certificates for your domain.

For example, suppose you want to use the domain example.com with Traefik. You would need to create the following DNS records:

A record: example.com points to the IP address of your server.
CAA record: example.com allows Let's Encrypt to issue certificates for your domain.
You can find more information about configuring DNS records for Let's Encrypt in their documentation: https://letsencrypt.org/docs/challenge-types/#dns-01-challenge.


A record: 
@ - 34.29.211.127 (e.g., the proxy/traefik server) - 600s 

CAA record: 
Name: (leave blank for root domain)
Domain: hantswilliams.com
Type: CAA
Value: 0 issue "letsencrypt.org"