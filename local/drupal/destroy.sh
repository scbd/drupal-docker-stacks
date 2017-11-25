while true; do
    read -p "Are you sure you want to remove your drupal related stacks? (Y or N)
     " yn
    case $yn in
        [Yy]* ) docker-sync stop; docker stack rm DRUPAL; docker system prune; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
