node default { 
  notify {"Default!!!": }
}

node 'linuxagent.example.com' {

  include glic::edgenode


  ##Testing
  #include cis::test::banner
  #include cis::test::conditionals

}

