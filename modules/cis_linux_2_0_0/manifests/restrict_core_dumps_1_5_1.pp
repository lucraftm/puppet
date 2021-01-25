# @summary 1.5.1 Ensure core dumps are restricted (Scored)
#
# # 1.5.1 Ensure core dumps are restricted
# --------------------------------------
# --------------------------------------

# Description:
# A core dump is the memory of an executable program. It is generally used to determine
# why a program aborted. It can also be used to glean confidential information from a core
# file. The system provides the ability to set a soft limit for core dumps, but this can be
# overridden by the user.

# Rationale:
# Setting a hard limit on core dumps prevents users from overriding the soft variable. If core
# dumps are required, consider setting limits for user groups (see limits.conf(5) ). In
# addition, setting the fs.suid_dumpable variable to 0 will prevent setuid programs from
# dumping core.

# CIS Controls:
# - Version 6
#   - 13 Data Protection
#     Data Protection
# - Version 7
#   - 5.1 Establish Secure Configurations
#     Maintain documented, standard security configuration standards for all authorized
#     operating systems and software.
#
# @example
#   include cis_linux_2_0_0::restrict_core_dumps_1_5_1
class cis_linux_2_0_0::restrict_core_dumps_1_5_1 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::restrict_core_dumps_1_5_1::apply_cis_control')
) {
  if $apply_cis_control {
    file { '/etc/security/limits.d':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }
    file { '/etc/sysctl.d':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }
    file { '/etc/security/limits.d/hard_core.conf':
      ensure  => present,
      source  => 'puppet:///modules/cis_linux_2_0_0/hard_core.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => File['/etc/security/limits.d'],
    }
    file { '/etc/sysctl.d/fs-suid_dumpable.conf':
      ensure  => present,
      source  => 'puppet:///modules/cis_linux_2_0_0/fs-suid_dumpable.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => File['/etc/sysctl.d'],
    }
    exec { 'Activate fs.suid_dumpable=0':
      command  => 'sysctl -w fs.suid_dumpable=0',
      path     => '/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin',
      unless   => 'if [[ `sysctl fs.suid_dumpable | cut -d = -f 2` != " 0"  ]] ; then exit 1; else exit 0; fi',
      provider => 'shell',
    }
  }
}
