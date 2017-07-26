class glic::test::conditionals  {


 case $::operatingsystem {
    'OracleLinux', 'Ubuntu', 'CentOS', 'Fedora', 'Amazon' : {
	notify {"** Ubuntu OS detected .": }
    }
 }





}

