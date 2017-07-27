class glic::edgenode::cron inherits glic::edgenode::eparams {

 ## This is temporary until we discuss the details on how to run this, the user,sudoers file etc.
 cron { 's3configcron':
  command => "sudo  $glic::edgenode::eparams::cfgscriptpath/$glic::edgenode::eparams::cfgscript > /dev/null 2>&1",
  user    => "$glic::edgenode::eparams::cronuser",
  hour    => 9,
  minute  => 0,
 }

}

