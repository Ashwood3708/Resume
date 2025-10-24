Kafka

Kafka is a distributed event streaming platform that lets you read, write, store, and process events (also called records or messages in the documentation) across many machines https://kafka.apache.org/quickstart


install cmd
——————————
brew install kafka


Brew services Kafka:
——————————
brew services start zookeeper
brew services start kafka
kafka-topics --list --zookeeper localhost:2181
kafka-topics --list --bootstrap-server localhost:9092
kafka-consumer-groups --bootstrap-server localhost:9092 --reset-offsets --to-earliest --all-topics   --execute --group <id>
kafka-topics --describe --bootstrap-server localhost:9092 --topic <name>
kafka-topics --create --bootstrap-server localhost:9092 --topic <name>
kafka-console-producer --bootstrap-server localhost:9092 --topic <name>
kafka-console-consumer --bootstrap-server localhost:9092  --property print.key=true --from-beginning --topic <name>
kafka-topics --delete --bootstrap-server localhost:9092 --topic <name>


bootstrap-servers:
——————————
- kafka-tte-app.prod.target.com:9093
- kafka-tte-atp.prod.target.com:9093
- kafka-tte-fulfillment.prod.target.com:9093
- kafka-tte-axon.prod.target.com:9093

Breakdown:
- kafka-console-consumer
- kafka-console-producer
- --bootstrap-server kafka-tte-app.dev.target.com:9093
- --consumer.config /Users/Z0041LR/certs/fpc/dev/fpc-dev.properties
- --property print.key=true
- --from-beginning
- --max-messages 1
- --property "parse.key=true" --property "key.separator=$"
- --partition 0
- --topic fpc-location-forecast


————————————————————————————————————————

FPC-Stage ex:
——————————
kafka-console-consumer --bootstrap-server kafka-tte-app.dev.target.com:9093  --consumer.config /Users/Z0041LR/certs/fpc/dev/fpc-dev.properties    --property print.key=true --topic ppc-location-forecast

kafka-console-producer --bootstrap-server kafka-tte-app.dev.target.com:9093 --producer.config /Users/Z0041LR/certs/fpc/dev/fpc-dev.properties    --property "parse.key=true" --topic fpc-location-backlog-metrics

FPC-Prod ex:
——————————
kafka-console-consumer --bootstrap-server kafka-tte-app.prod.target.com:9093 --consumer.config /Users/Z0041LR/certs/fpc/prod/fpc-prod.properties    --property print.key=true --topic

kafka-console-producer --bootstrap-server kafka-tte-app.prod.target.com:9093 --producer.config /Users/Z0041LR/certs/fpc/prod/fpc-prod.properties    --topic fpc-location-backlog-metrics

————————————————————————————————————————

Axon-stage ex:
————————
kafka-console-consumer --bootstrap-server kafka-tte-axon.dev.target.com:9093  --consumer.config /Users/Z0041LR/certs/axon/dev/axon-dev.properties  --property print.key=true --topic

kafka-console-producer --bootstrap-server kafka-tte-axon.dev.target.com:9093 --producer.config /Users/Z0041LR/certs/axon/dev/axon-dev.properties  --property "parse.key=true" --property "key.separator=$"  --topic axon-test


Axon-prod ex:
————————
kafka-console-consumer --bootstrap-server kafka-tte-axon.prod.target.com:9093  --consumer.config  /Users/Z0041LR/certs/axon/prod/axon-prod.properties   --property print.key=true --topic

kafka-console-producer --bootstrap-server kafka-tte-axon.prod.target.com:9093 --producer.config /Users/Z0041LR/certs/axon/prod/axon-prod.properties  --property "parse.key=true" --property "key.separator=$" --topic axon-test

————————————————————————————————————————

Set Serialization:
——————-
Kafka:
key:
serializer: org.apache.kafka.common.serialization.StringSerializer
deserializer: org.apache.kafka.common.serialization.StringDeserializer
value:
serializer: org.apache.kafka.common.serialization.StringSerializer
deserializer: org.apache.kafka.common.serialization.StringDeserializer


Grep
——————-
grep -e '2021-11-30' -e 'fulfillment_type_id":3' -e 'release_line_status_code_id":5'


Minify
——————— 910${"location_id":910,"backlog_date":"2021-05-21","backlog_hour":11,"virtual_backlog":500,"pick_backlog":240,"pack_backlog":60,"carrier_capacity":500,"staffing_capacity":100,"store_category":1,"unit_per_release":20,"unit_per_package":19,"slot_capacity":200,"updated_ts":"2020-10-07 13:31:59"}



Request new topics
————————————
1. Go to Kafka-topics repo
2. Pull from forked master
3. Copy and rename a file to new topic name:   Topic.json
4. Change old topic name to new name within new file
5. Push and fill out pull request 
 kafka-tte-axon.dev.target.com:9092

Kafka Topic Describe ———————————————
kafka-consumer-groups  --describe --bootstrap-server kafka-tte-axon.dev.target.com:9092 --group <>


Reset-to-earliest:
————————
FPC-Prod:
kafka-consumer-groups --bootstrap-server kafka-tte-app.prod.target.com:9093 --reset-offsets --to-earliest --all-topics   --execute --command-config /Users/Z0041LR/certs/fpc/prod/fpc-prod.properties    --group <>

FPC-Dev:
kafka-consumer-groups --bootstrap-server kafka-tte-app.dev.target.com:9093 --reset-offsets --to-earliest --all-topics   --execute --command-config   /Users/Z0041LR/certs/fpc/dev/fpc-dev.properties    --group axoneligibilitycrosser-dev

Axon-Prod:
kafka-consumer-groups --bootstrap-server kafka-tte-axon.prod.target.com:9093 --reset-offsets --to-earliest --all-topics   --execute --command-config  /Users/Z0041LR/certs/axon/prod/axon-prod.properties --group <>

Axon-Dev:
kafka-consumer-groups --bootstrap-server kafka-tte-axon.dev.target.com:9093 --reset-offsets --to-earliest --all-topics   --execute --command-config   /Users/Z0041LR/certs/axon/dev/axon-dev.properties --group <>


Reset-to-offset:
———————— FPC-ex:
kafka-consumer-groups --bootstrap-server kafka-tte-app.dev.target.com:9093 --command-config /Users/Z0041LR/certs/fpc/dev/fpc-dev.properties    --reset-offsets --to-offset 2000000 --topic testTopic:22 --execute  --group <>

kafka-consumer-groups --bootstrap-server kafka-tte-app.prod.target.com:9093 --command-config /Users/Z0041LR/certs/fpc/prod/fpc-prod.properties    --reset-offsets --to-offset 2000000 --topic testTopic:22 --execute  --group <>

Axon-ex: kafka-consumer-groups --bootstrap-server kafka-tte-axon.dev.target.com:9093  --execute --command-config   /Users/Z0041LR/certs/axon/dev/axon-dev.properties  --reset-offsets --to-offset 4700000 --topic <> --group <>

kafka-consumer-groups --bootstrap-server kafka-tte-axon.prod.target.com:9093  --execute --command-config   /Users/Z0041LR/certs/axon/prod/axon-prod.properties  --reset-offsets --to-offset 4700000 --topic <> --group <>





kcat settings:
——————————————
-b localhost:9092                                                                          <broker>
-t axon-out                                                                                     <topic>
-o beginning                                                                                   <option to consume from start of topic>
-f 'partition:%p||offset:%o||key:%k||message:%s\n'                   <format for response>
-F /Users/Z0041LR/certs/axon/dev/kcat-axon-dev.properties  <properties>

Optional:
-c 3                                                                                                  <max 3 messages consumed>
-o 1234                                                                                            <starting offset>
-o s@3456                                                                                      <starting epoch timestamp>

kcat properties file —————————————
security.protocol=ssl
ssl.ca.location=/Users/Z0041LR/certs/tgt-ca-bundle.crt
ssl.keystore.location=/Users/Z0041LR/certs/axon/prod/axon-prod-keystore-2024-08-20.pem
ssl.keystore.password=<keystore_password>
ssl.key.password=<keystore_password>
ssl.endpoint.identification.algorithm=none
enable.ssl.certificate.verification=false

JKS to PEM:
—————————————
keytool
-importkeystore
-srckeystore /Users/Z0041LR/certs/axon/prod/axon-prod-keystore-2024-08-20.jks
-destkeystore /Users/Z0041LR/certs/axon/prod/axon-prod-keystore-2024-08-20.pem
-deststoretype PKCS12
Enter the <keystore_password> when prompted (3 times)



### ex
——————
Looking for a sfm shipment given the timestamp converted to epoch time
We use jq here to start the file with [ and then every next message starts with a ‘,’adding a close ] to the end allows it to be a list of json
——————
kcat -C -b kafka-tte-fulfillment.prod.target.com:9093 -t sfm-order-updates-v2 -o s@1732644000000 -J -F /Users/Z0041LR/certs/axon/prod/kcat-axon-prod.properties -p 26  | grep 2345654 | jq -c '.payload |= try fromjson catch .' | awk 'BEGIN {print "["} {if (NR>1) print ","} {print $0}' > temp3.txt


kcat -C -b kafka-ttc-app.prod.target.com:9093 -t space-capacity-outbound-v1 -o s@$(date -j -f "%Y-%m-%d %H:%M:%S" "$(date "+%Y-%m-%d") 00:00:00" +"%s")000 -J -F /Users/Z0041LR/certs/axon/prod/kcat-axon-prod.properties  | jq -c '.payload |= try fromjson catch .' | awk 'BEGIN {print "["} {if (NR>1) print ","} {print $0}' > temp3.txt















——end—here—————