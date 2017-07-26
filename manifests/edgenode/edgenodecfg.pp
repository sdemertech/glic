class glic::edgenode::edgenodecfg inherits glic::edgenode::params  {

 ## POC: Development Environment: use fqdn or hostname for now
 ## A section for production has to be added as needed
 case $::fqdn {
    'test', 'linuxagent.example.com' : {
	$s3bucket = "$glic::edgenode::params::s3bucketdev"
	$s3backupdir = "$glic::edgenode::params::s3backupdir"
     }
 }

 file { 'edgenodecfgsdir':
  path  => "$glic::edgenode::params::cfgscriptdir",
  ensure => directory,
 }

 file { 'edgenodecfgs':
  content => template('glic/edgenodecfgs.erb'),
  path  => "$glic::edgenode::params::cfgscriptdir/$glic::edgenode::params::cfgscript",
  owner => 'root',
  mode => "0755",
 }

}

