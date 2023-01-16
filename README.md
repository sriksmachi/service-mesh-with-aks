# Applications of Service Mesh in Azure Kubernetes Service (AKS)

PreRequisites
- Az CLI
- Kubectl
- OSM CLI 
  - Windows Installation (https://github.com/openservicemesh/osm/#get-the-osm-cli)
  - WSL / Linux
  ```
  curl -sL "https://github.com/openservicemesh/osm/releases/download/$OSM_VERSION/osm-$OSM_VERSION-linux-amd64.tar.gz" | sudo tar -vxzf -
  sudo mv ./linux-amd64/osm /usr/local/bin/osm
  osm version
  ```

## Apply Traffic Policies

Check if Permissive Traffic Policy Mode is ON. 

  ```
  kubectl get meshconfig osm-mesh-config -n kube-system -o jsonpath='{.spec.traffic.enablePermissiveTrafficPolicyMode}{"\n"}'
  # Output:
  # false: permissive traffic policy mode is disabled, SMI policy mode is enabled
  # true: permissive traffic policy mode is enabled, SMI policy mode is disabled
  ```

Turn OFF permissive traffic policy
```
kubectl patch meshconfig osm-mesh-config -n kube-system -p '{"spec":{"traffic":{"enablePermissiveTrafficPolicyMode":false}}}'  --type=merge
```

Apply Traffic Control policy to allow BookBuyer -> BookStore only
```
kubectl apply -f https://raw.githubusercontent.com/openservicemesh/osm-docs/release-v1.2/manifests/access/traffic-access-v1.yaml
```

# Apply Traffic Split

Deploy v2 of bookstore.

```
kubectl apply -f https://raw.githubusercontent.com/openservicemesh/osm-docs/release-v1.2/manifests/apps/bookstore-v2.yaml

./scripts/port-forward-bookstore-ui-v2.sh

By default traffic is sent to both v1 and v2
```

Redirect all traffic to v1 only 
```
kubectl apply -f https://raw.githubusercontent.com/openservicemesh/osm-docs/release-v1.2/manifests/split/traffic-split-v1.yaml
```

Split the traffic 50-50
```
kubectl apply -f https://raw.githubusercontent.com/openservicemesh/osm-docs/release-v1.2/manifests/split/traffic-split-50-50.yaml

```










