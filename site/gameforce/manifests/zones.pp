class gameforce::zones {

include bind

bind::server::file { 'gameforce.net':
  source => 'puppet:///site/modules/gameforce/dns/static.gameforce.net',
  }

bind::server::file { '11.168.192.in-addr.arpa':
  source => 'puppet:///site/modules/gameforce/dns/11.168.192.in-addr.arpa',
  }

#bind::server::file { [ 'static.gameforce.net', 'static.11.168.192.in-addr.arpa' ]:
#  source_base => 'puppet:///modules/gameforce/dns/',
#  }

}
