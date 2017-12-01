docker volume create portainer-data
docker network create --driver overlay --subnet 10.0.15.0/24 --opt encrypted=true portainer
docker stack deploy -c manage.yml MANAGE
