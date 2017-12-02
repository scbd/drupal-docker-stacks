docker secret rm AURORA_PASS
docker secret rm AURORA_USER
docker secret rm settings.php
docker secret rm SRCKEY

docker secret create --label env=dev SRCKEY $HOME/shared/.secrets/SRCKEY
docker secret create --label env=dev  AURORA_USER $HOME/shared/.secrets/AURORA_USER_STG
docker secret create --label env=dev  AURORA_PASS $HOME/shared/.secrets/AURORA_PASS_STG
docker secret create --label env=dev  settings.php $HOME/shared/.secrets/stg.settings.php
