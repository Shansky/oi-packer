#!/bin/sh

echo "pkgin: update repositories"
/opt/local/bin/pkgin update
echo "pkgin: install ruby-2.1.1"
/opt/local/bin/pkgin -y install ruby-2.1.1
echo "gem: install puppet"
/opt/local/bin/gem install puppet --no-ri --no-rdoc