
# Label namespaces to inject side car
osm namespace add bookstore bookbuyer bookthief bookwarehouse


# deploy apps.
kubectl apply -f https://raw.githubusercontent.com/openservicemesh/osm-docs/release-v1.0/manifests/apps/bookbuyer.yaml
kubectl apply -f https://raw.githubusercontent.com/openservicemesh/osm-docs/release-v1.0/manifests/apps/bookthief.yaml
kubectl apply -f https://raw.githubusercontent.com/openservicemesh/osm-docs/release-v1.0/manifests/apps/bookstore.yaml
kubectl apply -f https://raw.githubusercontent.com/openservicemesh/osm-docs/release-v1.0/manifests/apps/bookwarehouse.yaml
kubectl apply -f https://raw.githubusercontent.com/openservicemesh/osm-docs/release-v1.0/manifests/apps/mysql.yaml


