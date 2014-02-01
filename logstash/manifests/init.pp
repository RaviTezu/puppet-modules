# Class: logstash
#
# This module manages logstash
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class logstash(
  $redis_host = 'redis.hostname.com'
  $redis_port = '6379'
) {

  include logstash::agent

}
