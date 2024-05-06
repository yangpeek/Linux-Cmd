1.Get into the namespace
- k9s -n core-config-server --context yayang-prd.iad.co.mediamath.com

2. k8s get information:
- kubectl get pods
- kubectl get services
- kubectl describe po ${pods}
- kubectl get cm bidder -oyaml # cm -> ConfigMap
- kubectl port-forward iad-bidder-0 8081 (localhost:8081)
- kubectl logs -f iad-router-0 -c bidflux
- kubectl scale sts iad-udbshield --replicas=1
- kubectl get po -w ( watch dog )
- kubectl edit sts iad-udbshield-0
  - args: ["3600"]
  - command: ["/bin/sleep"]

```
curl -X POST -H 'Accept: */*' -H 'Accept-Encoding: gzip, deflate' -H 'Connection: keep-alive' -H 'Content-Length: 820' -H 'Content-Type: application/json' -H 'User-Agent: python-requests/2.24.0' -H 'x-mm-prodmon-tags: test_id=116;strategy_id=13817511;task_id=41' -H 'x-mm-skip-bff: 1' -H 'x-openrtb-version: 2.5' -d '{"id": "b2f7933b-0cf9-4092-b3e0-1025b9ddf191", "cur": "USD", "at": 1, "imp": [{"id": "727edaca-f83c-41b9-a88b-11d8ebbe8b01", "bidfloor": 0.1, "bidfloorcur": "USD", "banner": {"w": 300, "h": 250}}], "site": {"id": "621949166", "domain": "prodmon.mediamath.com", "page": "http://prodmon.mediamath.com?task_id=41&test_id=116&test_type=Development", "publisher": {"id": "160447572"}}, "user": {"buyeruid": "d6a6f55b-754d-4012-8824-ef4bfec188d2"}, "device": {"ip": "24.2.117.33", "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 [FBAN/FBIOS;FBDV/iPhone11,2;FBMD/iPhone;FBSN/iOS;FBSV/12.2;FBSS/3;FBCR/AT&T;FBID/phone;FBLC/en_US;FBOP/5]", "geo": {"country": "US", "region": "NY", "city": "Manhattan", "zip": "10007", "type": 2}}, "ext": {"ssp": "ss-prodmon"}}' http://bidding-test.cloud.mathtag.com:9180/bid/gor
```

3. k8s deployment:
- BF:
  ```
  helm upgrade --install router deployments/charts/router  --cleanup-on-fail --values deployments/charts/router/values.yaml --set image.tag=2.28.3-b4036
  ```

4. Asset db:
   ```
   curl "https://asset.mediamath.com/ajax/hostname/os_version?pop=sjc&hostname=biddex&format=text&max_age=1"
   ```

5. eks operation:
-  eksctl scale nodegroup --cluster=my-cluster-name --name=my-nodegroup-name --nodes=3
-  eksctl get nodegroup --cluster=mediamath-perftest --profile=cloudbidder
-  eksctl scale nodegroup bidderpriv-c5n-9xlarge --cluster=mediamath-perftest --nodes=0 --profile=cloudbidder
-  2x vads, 2x bidderpriv, 1x bidderpub

6. helm operation
- deploy: `helm upgrade --install udbshield ./deployments/charts/udbshield/ --values ./deployments/charts/udbshield/values.yaml --set image.tag="5.0.4-b321"`
- statefulset operation
```
kubectl get sts
kubectl describe sts iad-udbshield
```

7. k8s development methodology:
- develop helm charts with configs.
- set up node db
- publish docker image for service.
- deploy to test environment for checking.
- update services be cloud running, like log and ping endpoint.
- develop test cases
