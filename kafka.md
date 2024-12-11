1. Kafka on CMD
- consumer: `./kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic test --from-beginning`
- producer: `./kafka-console-producer.sh --bootstrap-server kafka:9092 --topic test`
- list topics: `kafka-topics --bootstrap-server localhost:9092 --list`

3. Kafka On k8s:
- [kafka-source](https://github.com/knative/docs/tree/1613b37e3599591eced322f5fb3b2129720bf3ae/docs/eventing/sources/kafka-source)
- [kakfa example](https://github.com/strimzi/strimzi-kafka-operator/tree/main/examples/kafka)
- [kafka example lvl](https://github.com/vszal/kubernetes-engine-samples/tree/c6f85f550a5d93a31f8c0831958165cb72646bb8/streaming/kafka-strimzi/manifests)
- Spin up kcat on k8s:
  ```
  kubectl run kcat --rm -it --image=edenhill/kcat:1.7.1 --restart=Never --command /bin/sh
  ```
- consumer for bidder.caerus on k8s:
  ```
  kcat -C  -b dca-bidder-kafka-bootstrap:9092 -t dca.bidder.caerus.1 -m 10 -f '%k %s\n' -s key=s -s value=avro -r http://dca-bidder-schema-registry:8081
  ```
