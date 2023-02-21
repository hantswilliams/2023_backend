
Build command:
```
docker build -t traefik . 
```

Run command:
```
docker run -d -p 80:80 -p 443:443 -v /var/run/docker.sock:/var/run/docker.sock -v /path/to/traefik.toml:/etc/traefik/traefik.toml traefik
``` 