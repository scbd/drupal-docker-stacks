while true; do
    read -p "Are you sure you want to remove your proxy stack? (Y or N)
     " yn
    case $yn in
        [Yy]* ) docker stack rm PROXY; docker system prune; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
