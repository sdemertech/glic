class glic::edgenode::s3cfgs inherits glic::edgenode::eparams  {

 ## POC: Development Environment: use fqdn or hostname for now
 ## A section for production has to be added as needed
 case $::fqdn {
    'test', 'linuxagent.example.com' : {
	$s3bucket = "$glic::edgenode::eparams::s3bucketdev"
	$s3backupprefix = "$glic::edgenode::eparams::s3backupprefix"
     }
 }

 file { 'edgenodecfgspath':
  path  => "$glic::edgenode::eparams::cfgscriptpath",
  ensure => directory,
 }

 file { 'edgenodecfgs':
  content => template('glic/edgenodecfgs.erb'),
  path  => "$glic::edgenode::eparams::cfgscriptpath/$glic::edgenode::eparams::cfgscript",
  owner => 'root',
  mode => "0755",
 }

}

