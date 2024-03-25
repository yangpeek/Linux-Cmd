1.Get into the namespace
- k9s -n core-config-server --context yayang-prd.iad.co.mediamath.com

2. k8s container to browser:
- kubectl port-forward iad-router-0 8081
- (localhost:8081)

3. k8s get information:
- kubectl get pods
- kubectl get services
- kubectl describe po ${pods}
- kubectl get cm bidder -oyaml # cm -> ConfigMap

4. k8s deployment:
- BF:
  ```
  helm upgrade --install router deployments/charts/router  --cleanup-on-fail --values deployments/charts/router/values.yaml --set image.tag=2.28.3-b4036
  ```

5. Asset db:
   ```
   curl "https://asset.mediamath.com/ajax/hostname/os_version?pop=sjc&hostname=biddex&format=text&max_age=1"
   ```
