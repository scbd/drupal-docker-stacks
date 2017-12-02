## Requirements

* Docker CE 17.04.0+ supporting compose file format 3.2+, get it [here](https://docs.docker.com/engine/installation/)
* Docker-sync in order to mount a mac drive to docker, get it [here](http://docker-sync.io/) or ```gem install docker-sync ```
* Access to private repo https://github.com/scbd/drupal-config
* SCBD secrets
  1. AURORA_USER - your user for the cloud sql
  2. AURORA_PASS - your pass for the cloud sql
  3. SRCKEY - key to decrypt encrypted docker image

> Request private access and secrets from it@cbd.int
