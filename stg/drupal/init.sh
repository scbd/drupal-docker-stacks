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

docker network create --driver overlay --subnet 10.0.12.0/24 --opt encrypted=true drupal
docker stack deploy -c drupal.yml DRUPAL
