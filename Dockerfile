FROM sebp/elk:553

# RUN setcap cap_net_bin_service=+epi /usr/lib/jvm/java-8-openjdk-amd64/bin/java
RUN setcap cap_net_bind_service=+epi /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# add logstash configuration files to docker image
#
# control input into logstash different ports for standard syslog vs. KMS syslog messages
ADD etc/logstash/conf.d /etc/logstash/conf.d

# add elastic and logstash config files
# elastic files
ADD opt/elasticsearch/config /opt/elasticsearch/config
#
# logstash files
ADD opt/logstash/config /opt/logstash/config

# add KMS patterns
ADD tmp/patterns/ciscokms /tmp/patterns/ciscokms

