docker volume create traefik-data
docker network create --driver overlay --subnet 10.0.14.0/24 --opt encrypted=true proxy
docker stack deploy -c proxy.yml PROXY
