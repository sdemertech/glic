## 2DO
## Dependency. Requires hadoop hive pig spark tez to be already installed (HTAMH-129)
## POC: Development Environment: use fqdn or hostname for now. This will probably be replaced by role, puppetRole or tagEnv "emr-support-edgenode" on the edgenode
## Conditional login on exec to be added (unless, onlyif etc)

class glic::edgenode::s3cfgs inherits glic::edgenode::eparams  {

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

 file { 'edgenodecfgs':
  ensure   => present,
  content => template('glic/edgenodecfgs.erb'),
  path  => "$glic::edgenode::eparams::cfgscriptpath/$glic::edgenode::eparams::cfgscript",
  owner => "$glic::edgenode::eparams::user",
  mode => "0700",
 }

 exec { 'pulls3cfgs':
  command  => "/usr/bin/sudo  $glic::edgenode::eparams::cfgscriptpath/$glic::edgenode::eparams::cfgscript > /tmp/s3cfgpull.log",
  cwd      => "$glic::edgenode::eparams::cfgscriptpath",
  user     => "$glic::edgenode::eparams::user",
 }

}

