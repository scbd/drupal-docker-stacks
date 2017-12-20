
# SCBD Drupal Docker Stacks


## Introduction

Drupal docker stacks was inspired by [Docker4Drupal](https://github.com/wodby/docker4drupal).  It is a template for a drupal development workflow using docker stacks to represent the local, dev, staging and production  drupal environments.

Drupal docker stacks provides and utilizes tools in order to synchronize environments facilitating the development workflow.

## Requirements

* Docker CE 17.04.0+ supporting compose file format 3.2+, get it [here](https://docs.docker.com/engine/installation/)
* Docker-sync in order to mount a mac drive to docker, get it [here](http://docker-sync.io/) or ```gem install docker-sync ```
* Access to private repo https://github.com/scbd/drupal-config
* git config (set up with your account which has access ot the private repo)
* Required SCBD secrets in order to run drupal
  1. SRCKEY - key to decrypt encrypted docker image
  2. db-init
  3. S3ID
  4. S3PASS
* Supplementary SCBD secrets
  1. AURORA_USER - your user for the cloud sql
  2. AURORA_PASS - your pass for the cloud sql
  3. DRUPAL_ADMIN_USER
  4. DRUPAL_ADMIN_PASS
  
> Request private access and secrets from it@cbd.int. Also our cloud based sql is ip restricted, you will need to provide your static ip for local development.

## Quick Start - drupal local initialization
Place your secrets in your home directory $HOME/.secrets/
```bash
bash -c "$(curl -fsSL https://tinyurl.com/y8zkw2h6)" 
```

## Quick Commands From /local/drupal/ once initialized
To start drupal after stopped
```bash
sh start.sh
```
To start drupal from running in the back ground
```bash
sh stop.sh
```
To export config changes for git commit
```bash
sh export.sh
```
To require a drupal module or theme
```bash
 sh require.sh drupal/module
 ```
 To completely remove all drupal and data from your system
 ```bash
  bash -c "$(curl -fsSL https://tinyurl.com/yb9bgnmb)"
 ```
 
## Documentation
Full documentation is available at [http://drupal-docker-stacks.readthedocs.io](http://drupal-docker-stacks.readthedocs.io/en/latest/)

## Stacks
http://drupal.localhost/

https://drupal.cbddev.xyz/

https://drupal.staging.cbd.int/

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

* [docksal](http://docksal.readthedocs.io/en/master/)
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

## TODO

- memcache
- varnish
- solr

This project is licensed under the MIT open source license.
