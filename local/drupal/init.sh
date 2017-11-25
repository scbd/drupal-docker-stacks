while true; do
    read -p "Would you like to reload your docker secrets? (Y or N)
     such as: AURORA_USER, AURORA_PASSWORD, config-dev, SRCKEY
     " yn
    case $yn in
        [Yy]* ) sh ../secrets.sh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Would you like to bring up dependandent stacks PROXY && MANAGE? (Y or N)
     " yn
    case $yn in
        [Yy]* ) sh ../proxy/init.sh; sh ../proxy/init.sh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

docker volume create drupal-data
docker volume create db-data
docker volume create db-init-data
docker volume create docker-sync
docker network create --driver overlay --subnet 10.0.12.0/24 --opt encrypted=true drupal
nohup docker-sync start &
docker stack deploy -c drupal.yml DRUPAL
