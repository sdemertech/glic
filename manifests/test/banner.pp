class glic::test::banner inherits glic::test::params {

  if $glic::test::params::manage_motd {
   notify {"** MOTD: $motd ": }
  }

}

