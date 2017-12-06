MODULE=$1
docker exec -ti DRUPAL_php.1.$(docker service ps -f 'name=DRUPAL_php.1' DRUPAL_php -q) composer require $MODULE
sleep 5s

docker exec -ti DRUPAL_php.1.$(docker service ps -f 'name=DRUPAL_php.1' DRUPAL_php -q) composer clear-cache
