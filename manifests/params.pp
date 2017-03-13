# == Class: eximsimple::params
#
# === Parameters
#
# [smarthost]
#   The host to send all mail via. Can be any valid format that Exim accepts.
#   e.g. smtp.example.com/MX
#
# [domain]
#   The domain to add to the shortname.
#   e.g example.com
#
# [local_interfaces]
#   The interface to listen on.
#   e.g. 127.0.0.1
#
# [root]
#   The address to send mails for to root to.
#   e.g. root-mailbox@example.com
#

class eximsimple::params {
    $smarthost = 'smtp.example.com/mx'
    $domain = 'example.com'
    $local_interfaces = '127.0.0.1' 
    $accept_hosts = 'localhost'
    $root = 'root@example.com'
    $host_in_subject = false

    case $::osfamily {
      'RedHat': {
        $package_name = 'exim'
        $service_name = 'exim'
      }
      'Debian': {
        $package_name = 'exim4-daemon-light'
        $service_name = 'exim4'
      }
      default: {
        fail('Unknown $osfamily. This module only supports RedHat and Debian based systems.')
      }
    }
}
