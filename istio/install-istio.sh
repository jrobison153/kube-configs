# Install istio and tiller on a brand new cluster
kubectl apply -f $ISTIO_HOME/install/kubernetes/helm/helm-service-account.yaml
helm init --service-account tiller
helm install $ISTIO_HOME/install/kubernetes/helm/istio \
	--name istio \
	--namespace istio-system \
	--set tracing.enabled=true \
	--set ingress.enabled=true \
	--set ingress.service.type=NodePort \
	--set gateways.istio-ingressgateway.type=NodePort \
	--set gateways.istio-egressgateway.type=NodePort \
	--set tracing.ingress.enabled=true \
	--set tracing.jaeger.ingress.enabled=true \
	--set grafana.enabled=true \
	--set servicegraph.enabled=true

