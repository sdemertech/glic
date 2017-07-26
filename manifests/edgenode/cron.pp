class glic::edgenode::cron inherits glic::edgenode::params {


 cron { 'logrotate':
  command => "/usr/sbin/logrotate > /dev/null 2>&1",
  user    => "$glic::edgenode::params::cronuser",
  hour    => 9,
  minute  => 0,
 }

}

