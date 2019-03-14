#!/usr/bin/env bash

source /var/container_data/.env

sudo docker pull jenkins/jenkins:${JENKINS_VERSION}

sudo docker pull sonatype/nexus3:${NEXUS_VERSION}

sudo docker pull sonarqube:${SONAR_VERSION}

sudo docker pull gitlab/gitlab-ce:${GITLAB_VERSION}