#!/usr/bin/bash


for node in $(ironic node-list  | grep ceph | awk '{print $2}')
do
  openstack baremetal node manage $node
  openstack baremetal node clean $node --clean-steps '[{"interface": "deploy", "step": "erase_devices_metadata"}]'
  #openstack baremetal node provide $node
done
