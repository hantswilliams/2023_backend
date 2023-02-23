# 2023 Starter Kit 


## Backend 
- Inspo: https://github.com/mattddowney/compose-postgrest/blob/master/docker-compose.yml 
- PSQL (db), Prisma (migrations), postgrest (API service)
- Should also think about a simple node server for doing other API calls to DB - e.g., there is the prisma client there, but the issue is the prisma client does not help with autogenerating API endpoint documentation like postgrest does 
- Traefik for managing reverse proxy/routing 
    - please check out my other github repo: https://github.com/hantswilliams/traefik-reverseproxy-loadbalancer 
    - this should then be installed on some other machine, dedicated load balancer, and using in front of this (quick and simple SSL and routing!!)


- Setup - BACKEND - : 
    - Run the docker-compose file in postgres
    - Then update the prisma.schema to your liking 
    - Exec the initial migraitons with prisma // recommend just using `npx prisma db push` - no need for migrations files yet 
    - Then restart the docker-compose, found that the postgrest sometimes needs to restart
    - Should then be able to go to:
        - localhost:3000 to see the OpenAPI self-documentation hosted at the API root path
        - localhost:8080 and see the autogenerated swagger interface / nice  
            - when doing additional `db push` in the future, you might need to restart the individual docker image for the API endpoint, which can be achieved by doing getting the container name, and then doing: `docker kill -s SIGUSR1` or in docker-compose `docker-compose kill -s SIGUSR1 <service>` 
            - the interesting and annoying piece here, is that the new columns will appear at the BOTTOM of the documentation / section 
            - they do appear, but not in the right order 

    - the auto API schema generation/making calls is interesting, will take some time to get used to: 
        - making big calls are simple, e.g., if you have a Users table: 
            - `http://localhost:3000/Users`
        - then if you want to just find a specific user with the name: 
            - `http://localhost:3000/Users?email=eq.hants@optionsmd.com` 
        - for just getting specific columns: 
            - `http://localhost:3000/Users?select=id,email` 
        - search for a email that contains hants: 
            - `http://localhost:3000/Users?email=like.*hants*` - uses * instead of % for pattern matching due to URL encoding 
        - all of the different operators and located in the TABLES AND VIEWS section of https://postgrest.org/en/stable/api.html 
