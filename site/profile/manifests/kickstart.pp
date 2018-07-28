class profile::kickstart {

# Ensure tftp server is installed
  package { 'tftp-server':       ensure => 'installed', }
  package { 'syslinux-tftpboot': ensure => 'installed', }

  file { '/var/lib/tftpboot/pxelinux.cfg':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
# pxe default menu
  file { '/var/lib/tftpboot/pxelinux.cfg/default':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///files/pxeboot/default',
    require => File['/var/lib/tftpboot/pxelinux.cfg'],
    # notify =>  Service['tftp'],
    # Server Error: Invalid relationship: File[/var/lib/tftpboot/pxelinux.cfg/default] { notify => Service[tftp.service] }, because Service[tftp.service] doesn't seem to be in the catalog
  }

# ignition
  file { '/var/www/html/vhosts/kickstart/pxe-config.ign':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///files/kickstart/pxe-config.ign',
    notify =>  Service['httpd'],
  }

  # kickstart
  file { '/var/www/html/vhosts/kickstart/centos-server.ks':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///files/kickstart/centos-server.ks',
    notify =>  Service['httpd'],
  }
}
