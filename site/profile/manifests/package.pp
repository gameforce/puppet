# /etc/puppetlabs/code/environments/production/site/profile/manifests/package.pp
class profile::package {
  package { 'epel-release': ensure => 'installed', }
  package { 'htop': ensure => 'installed', }
  package { 'nfs-utils': ensure => 'installed', }
  package { 'nmap': ensure => 'installed', }
  package { 'screen': ensure => 'installed', }
  package { 'vim-enhanced': ensure => 'installed', }
  package { 'zsh': ensure => 'installed', }
}
