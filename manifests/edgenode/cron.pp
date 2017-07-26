class glic::edgenode::cron inherits glic::edgenode::eparams {


 cron { 's3configcron':
  command => " $glic::edgenode::eparams::cfgscriptpath/$glic::edgenode::eparams::cfgscript > /dev/null 2>&1",
  user    => "$glic::edgenode::eparams::cronuser",
  hour    => 9,
  minute  => 0,
 }

}

