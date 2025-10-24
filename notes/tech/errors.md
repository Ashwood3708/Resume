Error List




Found errors and solutions
——————————————————

Unknown Host:
- It can’t find kafka host/address
- So restart zookeeper and kafka
-

Timeout exception caught trying to initialize transactions.
The broker is either slow or in bad state
- Taking too long to connect to kafka broker
- Add to config under streams
-       session.timeout.ms: 60000
-       max.poll.interval.ms: 120000
-

javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path
- IntelliJ is looking for cacert in java security folder
- Copy  ca-cert file from java 17 to new java file
- /Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/lib/security
