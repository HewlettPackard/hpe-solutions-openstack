#!/bin/bash

set -o verbose
source stackrc
pushd /home/stack

 openstack overcloud deploy \
  --templates \
  -e /home/stack/templates/00-global-config.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
  -e /home/stack/templates/network-environment.yaml \
  -e /home/stack/templates/30-overcloud_images.yaml \
  -e /home/stack/templates/50-storage-environment.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/services-docker/octavia.yaml \
  -e /home/stack/templates/logging-environment.yaml \
  -e /home/stack/templates/monitoring-environment.yaml \
  -e /home/stack/templates/collectd-environment.yaml 
  
echo DONE

