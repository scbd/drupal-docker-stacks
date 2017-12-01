docker secret rm AURORA_PASS
docker secret rm AURORA_USER
docker secret rm settings.php
docker secret rm SRCKEY

docker secret create --label env=dev SRCKEY $HOME/.secrets/SRCKEY
docker secret create --label env=dev  AURORA_USER $HOME/.secrets/AURORA_USER
docker secret create --label env=dev  AURORA_PASS $HOME/.secrets/AURORA_PASS
docker secret create --label env=dev  settings.php $HOME/.secrets/dev.settings.php
