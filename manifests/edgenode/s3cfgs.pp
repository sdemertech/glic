class glic::edgenode::s3cfgs inherits glic::edgenode::eparams  {

 ## POC: Development Environment: use fqdn or hostname for now. This definately has to be brought up to the environment standards
 ## A section for production has to be added as needed
 case $::fqdn {
    'ip-10-0-1-216.us-west-2.compute.internal', 'linuxagent.example.com' : {
	$s3bucket = "$glic::edgenode::eparams::s3bucketdev"
	$s3backupprefix = "$glic::edgenode::eparams::s3backupprefix"
     }
 }

 file { 'edgenodecfgspath':
  path  => "$glic::edgenode::eparams::cfgscriptpath",
  ensure => directory,
 }

 ## This is temporary until we discuss the details on how to run this, the user,sudoers file etc.
 ## It is recomended to be monitored for changes and generate an alert.
 file { 'edgenodecfgs':
  content => template('glic/edgenodecfgs.erb'),
  path  => "$glic::edgenode::eparams::cfgscriptpath/$glic::edgenode::eparams::cfgscript",
  owner => 'root',
  mode => "0700",
 }

}

