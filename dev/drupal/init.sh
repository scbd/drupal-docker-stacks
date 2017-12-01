# set host names
# create aliases

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
        [Yy]* ) sh ../proxy/init.sh; sh ../manage/init.sh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

docker volume create db-data
docker volume create db-init-data
docker network create --driver overlay --subnet 10.0.12.0/24 --opt encrypted=true drupal
nohup docker-sync start &
docker stack deploy -c drupal.yml DRUPAL
