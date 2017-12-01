# set host names
# create aliases
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
OUTLOG=$(.init.log.$(openssl rand -base64 6))

echo "${WHITE}"
while true; do
    read -p "Would you like to reload your docker secrets? (Y or N)
     such as: AURORA_USER, AURORA_PASSWORD, config-dev, SRCKEY
     " yn
    case $yn in
        [Yy]* ) $(tput sgr0); sh ../secrets.sh; break;;
        [Nn]* ) $(tput sgr0); break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo "${WHITE}"
while true; do
    read -p "Would you like to bring up dependandent stacks PROXY && MANAGE? (Y or N)
     " yn
    case $yn in
        [Yy]* ) $(tput sgr0); pushd ../proxy > $OUTLOG; sh init.sh; popd > $OUTLOG; pushd ../manage > $OUTLOG; sh init.sh; popd > $OUTLOG; break > $OUTLOG;;
        [Nn]* ) $(tput sgr0); break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo
echo $('pwd')
docker volume create db-data
docker volume create db-init-data
docker volume create docker-sync-drupal
docker volume create docker-sync-drupal-config
docker network create --driver overlay --subnet 10.0.12.0/24 --opt encrypted=true drupal
nohup docker-sync start &
docker stack deploy -c drupal.yml DRUPAL
