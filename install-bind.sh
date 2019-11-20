#!/bin/bash

# Install Bind and copy the prebaked configuration file
sudo yum install -y bind
sudo cp ~/named.conf /etc/named.conf
sudo chown named /etc/named.conf
sudo chgrp named /etc/named.conf
# Enable named service to autostart on boot. No need to start the service on this script, the build VM will be deleted
sudo /bin/systemctl enable named
# Open Firewall ports. Avoid using firewall-cmd reload : known issue https://docs.cloud.oracle.com/iaas/Content/knownissues.htm
sudo firewall-cmd --permanent --add-port=53/tcp
sudo firewall-cmd --permanent --add-port=53/udp