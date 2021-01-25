# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cis_linux_2_0_0::ensure_sysctl_dir_exists
class cis_linux_2_0_0::ensure_sysctl_dir_exists {
  file { '/etc/sysctl.d':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
  }
  file { '/etc/sysctl.d/99-sysctl.conf':
    ensure => link,
    target => '/etc/sysctl.conf', 
  }
}
