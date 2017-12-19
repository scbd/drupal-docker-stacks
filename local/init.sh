
echo "${WHITE}"
while true; do
    read -p "Please enter the absolute path to your projects directory:
     such as: $HOME/Documents/projects
     " projectPath
     cd $projectPath;
     break;
done

git clone -b dev https://github.com/scbd/drupal-config.git
git clone https://github.com/scbd/drupal-code-base.git
git clone https://github.com/scbd/drupal-docker-stacks.git
# cd drupal-docker-stacks/local/drupal
# sh init.sh
