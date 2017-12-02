
# SCBD Drupal Docker Stacks


## Introduction

Drupal docker stacks was inspired by [Docker4Drupal](https://github.com/wodby/docker4drupal).  It is a template for a drupal development workflow using docker stacks to represent the local, dev, staging and production  drupal environments.

Drupal docker stacks provides and utilizes tools in order to synchronize environments facilitating the development workflow.

## Requirements

* Docker CE 17.04.0+ supporting compose file format 3.2+, get it [here](https://docs.docker.com/engine/installation/)
* Docker-sync in order to mount a mac drive to docker, get it [here](http://docker-sync.io/) or ```gem install docker-sync ```
* Access to private repo https://github.com/scbd/drupal-config
* SCBD secrets
  1. AURORA_USER - your user for the cloud sql
  2. AURORA_PASS - your pass for the cloud sql
  3. SRCKEY - key to decrypt encrypted docker image

> Request private access and secrets from it@cbd.int

## Quick Start
Place your secrets in your home directory $HOME/.secrets/SECRET_NAME
```bash
git clone https://github.com/scbd/drupal-docker-stacks.git
cd drupal-docker-stacks/local/drupal
sh init.sh
```

## Quick Commands
```bash
sh start.sh
```
```bash
sh stop.sh
```
```bash
sh stop.sh
```

## Documentation
Full documentation is available at [http://drupal-docker-stacks.readthedocs.io](http://drupal-docker-stacks.readthedocs.io/en/latest/)

## Stacks

### The Drupal Docker Stack:

| Stack      | yml                |
| ---------- | ------------------ |
| local      | [drupal.yml](https://github.com/scbd/drupal-docker-stacks/blob/master/local/drupal/drupal.yml)         |
| dev        | [drupal.yml](https://github.com/scbd/drupal-docker-stacks/blob/master/dev/drupal/drupal.yml)           |
| stg        | [drupal.yml](https://github.com/scbd/drupal-docker-stacks/blob/master/stg/drupal/drupal.yml)           |
| prod       | [drupal.yml](https://github.com/scbd/drupal-docker-stacks/blob/master/prod/drupal/drupal.yml)          |

### The Dependency Stack:
Drupal Docker Stacks has one dependency which is a reverse proxy.  Our implementation is employs [traefik](https://traefik.io/). Please share your custom reverse proxy implementations.

| Stack      | yml                |
| ---------- | ------------------ |
| local      | [proxy.yml](https://github.com/scbd/drupal-docker-stacks/blob/master/local/proxy/proxy.yml)         |
| dev        | [proxy.yml](https://github.com/scbd/drupal-docker-stacks/blob/master/dev/proxy/proxy.yml)         |
| stg        | [proxy.yml](https://github.com/scbd/drupal-docker-stacks/blob/master/stg/proxy/proxy.yml)         |


### The Helper Stack:
The helper stack [portainer](https://portainer.io/) a tool to help you manage your docker stacks via a UI.

| Stack      | yml                |
| ---------- | ------------------ |
| local      | [manage.yml](https://github.com/scbd/drupal-docker-stacks/blob/master/local/manage/manage.yml)         |
| dev        | [manage.yml](https://github.com/scbd/drupal-docker-stacks/blob/master/dev/manage/manage.yml)           |
| stg        | [manage.yml](https://github.com/scbd/drupal-docker-stacks/blob/master/stg/manage/manage.yml)           |


## License

This project is licensed under the MIT open source license.
