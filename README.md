
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

> Request private access and secrets from it@cbd.int. Also our cloud based sql is ip restricted, you will need to provide your static ip for local development.

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

## Reference

### Drupal developer resources
* [drupal-8-website-composer-template](https://another.ink/journal/drupal-8-website-composer-template)
* [managing-drupal-8-configuration-with-git](https://another.ink/journal/managing-drupal-8-configuration-with-git)
* [drupal-8-configuration-management-solving-configuration-conundrum](https://chromatichq.com/blog/drupal-8-configuration-management-solving-configuration-conundrum)
* [drush - why don't you use drupal for your site](https://drushcommands.com)
* [composer](https://getcomposer.org/doc/)
* [drupal 8 docs](https://www.drupal.org/docs/8)
* [s3-bucket-configuration-with-drupal-8](http://www.tothenew.com/blog/s3-bucket-configuration-with-drupal-8/)
* [moving-configuration-d8](https://www.curveagency.com/blog/moving-configuration-d8)
* [drupal-s3](https://pantheon.io/docs/drupal-s3/)
* [easy-amazon-s3-drupal-s3fs](http://www.symphonythemes.com/drupal-blog/easy-amazon-s3-drupal-s3fs)
* [configuration-management](https://www.drupal.org/docs/8/configuration-management/managing-your-sites-configuration)
* [vagrant-vs-docker](https://medium.com/@Mahmoud_Zalt/vagrant-vs-docker-679c9ce4231b)
* [drupal-8-ci-cd-with-docker-circleci-example-part-29](https://blog.wodby.com/drupal-8-ci-cd-with-docker-circleci-example-part-2-b04ff32713b9)
* [https://www.drupal.org/node/803746](https://www.drupal.org/node/803746)
* [Docker-DrupalHeart](https://www.drupalheart.com/sites/default/files/drupalheart-presentations/Docker-DrupalHeart%20Camp%20Zagreb%202017.pdf)
* [using-docker-multi-devmulti-platform-development](https://www.drupalasheville.com/2017/session/using-docker-multi-devmulti-platform-development)

* [drupal lerning curve](https://www.webpagefx.com/blog/web-design/drupal-learning-curve/)
* [boycott docker](https://www.google.ca/url?sa=t&rct=j&q=&esrc=s&source=web&cd=7&cad=rja&uact=8&ved=0ahUKEwjxtKaF-OvXAhWF14MKHRibB48QFghQMAY&url=https%3A%2F%2Fcontainerjournal.com%2F2016%2F12%2F19%2Fpeople-want-boycott-docker%2F&usg=AOvVaw0gTOBDR5wcSUmtAmnnn2vw)

### State of Drupal:
* [Node vs PHP](https://www.infoworld.com/article/3166109/application-development/php-vs-nodejs-an-epic-battle-for-developer-mind-share.html)
* [Drupal we need to talk](http://davehall.com.au/blog/dave/2017/04/19/drupal-we-need-talk)
* [CMS 2017](https://cms2cms.com/blog/trending-in-cms-where-to-move-in-2017-provocative-analysis)
* [State of Drupal](https://www.drupal.org/forum/general/general-discussion/2017-07-21/state-of-drupal)

### Trends:
* [drupal](https://trends.google.com/trends/explore?date=all&q=drupal)
* [nodejs](https://trends.google.com/trends/explore?date=all&q=nodejs)
* [Vue](https://trends.google.com/trends/explore?date=today%205-y&q=vuejs)
* [php](https://trends.google.com/trends/explore?date=all&q=%2Fm%2F060kv)
* [docker](https://trends.google.com/trends/explore?date=all&q=docker)
* [vagrant](https://trends.google.com/trends/explore?date=all&q=vagrant)

## License

This project is licensed under the MIT open source license.
