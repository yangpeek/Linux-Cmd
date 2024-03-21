1.Get into the namespace
- k9s -n core-config-server --context yayang-prd.iad.co.mediamath.com

2. k8s container to browser:
- kubectl port-forward iad-router-0 8081
- (localhost:8081)

3. k8s get information:
- kubectl get pods
- kubectl get services
- kubectl describe po ${pods}
