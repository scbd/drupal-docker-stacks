# SCBD Drupal Docker Stacks

## Introduction

Drupal docker stacks was inspired by [Docker4Drupal](https://github.com/wodby/docker4drupal).  It is a template for a drupal development workflow using docker stacks to represent the local, dev, staging and production  drupal environments.

Drupal docker stacks provides and utilizes tools in order to synchronize environments facilitating the development workflow.

## Requirements

* Docker CE 17.04.0+ supporting compose file format 3.2+, get it [here](https://docs.docker.com/engine/installation/)
* SCBD secrets
  1. AURORA_USER - your user for the cloud sql
  2. AURORA_PASS - your pass for the cloud sql
  3. SRCKEY - key to decrypt encrypted docker image

> Request your secrets from it@cbd.int.
