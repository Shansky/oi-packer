#!/bin/bash
ARCH=`uname -p`
QUARTER=$(date +%YQ)$(($(date +%m)/4))
echo "Installing pkgsrc bootstrap-$QUARTER-$ARCH"
curl -s http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-$QUARTER-$ARCH.tar.gz \
    | gzcat | (cd /; sudo tar -xpf -)
if grep -q "export PATH=\"/opt/local/sbin:/opt/local/bin:\$PATH\"" /etc/profile
then
  echo "path set"
else
  echo "export PATH=\"/opt/local/sbin:/opt/local/bin:\$PATH\"" >> /etc/profile
  echo "export PATH=\"/opt/local/sbin:/opt/local/bin:\$PATH\"" >> /root/.profile
  echo "export PATH=\"/opt/local/sbin:/opt/local/bin:\$PATH\"" >> /export/.profile
  source /etc/profile
fi
echo "pkgin update repositories"
/opt/local/bin/pkgin update
