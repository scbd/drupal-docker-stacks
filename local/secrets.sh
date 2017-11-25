docker secret rm SRCKEY
docker secret rm config-dev
docker secret rm AURORA_PASSWORD
docker secret rm AURORA_USER

docker secret create --label env=staging AURORA_USER $HOME/.secrets/AURORA_USER
docker secret create --label env=staging AURORA_PASSWORD $HOME/.secrets/AURORA_PASSWORD
docker secret create --label env=staging SRCKEY $HOME/.secrets/SRCKEY
docker secret create --label env=staging config-dev $HOME/.secrets/config-dev.json
