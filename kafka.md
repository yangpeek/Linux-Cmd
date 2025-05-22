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
  kcat -b kafka.iad.changes.mediamath.com:9092 -t iad.opto.dba.pacing.1 -o 110055285 -p 0 -c1 -f '%k %s %T\n' -s key=bbbbbs -s value=avro -r https://api-internal-iad.mediamath.com/changes/schema_registry/
  kcat -b kafka.ord.changes.mediamath.com:9092 -o -1 -t ord.bidder.impression.1 -s value=avro -r https://api-internal-ord.mediamath.com/changes/schema_registry/ -f '{"offset": %o, "partition": %p, "payload": %s}\n' 

  jq '{offset: .offset, partition: .partition, strategy_id: .payload.strategy_id.long, connected_id: .payload.connected_id.string, source_exchange_id: .payload.source_exchange_id.int, bidder_id: .payload.bidder_id.int, bid_timestamp: .payload.bid_timestamp.string, serve_bidder_id: .payload.serve_bidder_id.int, pi: (.payload.brain_pe_internal_data.string | fromjson) | .pi, pic_adj: (.payload.brain_pe_internal_data.string | fromjson) | .pic_adj }'
  ```
- consume for changes:
  ```
  kcat  -b kafka.iad.changes.mediamath.com:9092 -t iad.changes.snapshot.audience-segments.1  -r https://api-internal-iad.mediamath.com/changes/schema_registry/ -p4 -o begenning  -svalue=avro -skey=avro -e -f '%p %o %T %k %s\n'
  ```

3. Create kafka topic:
   ```
   1. Broker: kafka.x.x.x.com:9092
   2. Replication-factor 1
   3. Partitions 3
   4. Topic name: x.x.x.1
   5. Compact: No
   6. Size: 1G disk ( 15qps * 60s * 1MB ) 
   7. Retention: 1 min
   8. segment.bytes=134217728 ( 1G / 8 )
   
   bin/kafka-topics.sh --create --topic x.x.x.1 --partitions 3 --replication-factor 1 --config segment.bytes=134217728 -config retention.ms=60000 --config retention.bytes=1073741824 --bootstrap-server kafka.x.x.x.com:9092
   ```
4. Alter Topic Config:
   ```
   ./kafka-configs.sh --bootstrap-server x:9092  --entity-type topics --entity-name x --alter --add-config 'min.insync.replicas=1'
   ```
