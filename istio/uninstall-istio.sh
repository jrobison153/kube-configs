helm delete --purge istio &&
kubectl -n istio-system delete job --all &&
kubectl delete -f $ISTIO_HOME/install/kubernetes/helm/istio/templates/crds.yaml -n istio-system

