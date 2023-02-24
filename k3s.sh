DB:  export K3S_DATASTORE_ENDPOINT='mysql://test:password@tcp(192.168.3.68:3306/k3sdb'

cat /var/lib/rancher/k3s/server/token

Single node:

curl -sfL https://get.k3s.io | sh -s - server \
  --token=SECRET \
  --disable=servicelb \
  --datastore-endpoint="mysql://root:ROOT@tcp(192.168.3.68:3306)/db"

HA node:
first node:
===========

curl -sfL https://get.k3s.io | sh -s - server \
  --token=SECRET \
  --write-kubeconfig-mode=644 \
  --disable=servicelb \
  --datastore-endpoint="mysql://root:ROOT@tcp(192.168.3.68:3306)/k3sdb"

second node:
===========
curl -sfL https://get.k3s.io | sh -s - server \
  --token=SECRET \
  --write-kubeconfig-mode=644 \
  --datastore-endpoint="mysql://root:ROOT@tcp(192.168.3.68:3306)/k3sdb"