#!/usr/bin/env bash

sudo /bin/su -c "cat /etc/fstab"

echo "setting up /var/lib/docker volume..."

sudo mkfs -t xfs -L docker /dev/${DOCKER_EBS_NAME}
sudo mkdir /var/lib/docker
sudo mount /dev/${DOCKER_EBS_NAME} /var/lib/docker
sudo /bin/su -c "echo 'LABEL=docker  /var/lib/docker  xfs  defaults,nofail  0  2' >> /etc/fstab"


echo "setting up /var/container_data volume..."

sudo mkfs -t xfs -L data /dev/${CONTAINER_DATA_EBS_NAME}
sudo mkdir /var/container_data
sudo mount /dev/${CONTAINER_DATA_EBS_NAME} /var/container_data
sudo /bin/su -c "echo 'LABEL=data  /var/container_data  xfs  defaults,nofail  0  2' >> /etc/fstab"


echo "setting up /var/log volume..."

sudo mkfs -t xfs -L logs /dev/${LOG_EBS_NAME}
sudo mount /dev/${LOG_EBS_NAME} /var/log
sudo /bin/su -c "echo 'LABEL=logs  /var/log  xfs  defaults,nofail  0  2' >> /etc/fstab"

sudo /bin/su -c "cat /etc/fstab"

sudo mkdir /var/container_data/jenkins
sudo chown 1000:1000 /var/container_data/jenkins