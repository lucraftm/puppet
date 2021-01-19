# @summary This class diables cramfs
#
# 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
# ------------------------------------------------------------------

# Description:
# The cramfs filesystem type is a compressed read-only Linux filesystem embedded in small
# footprint systems. A cramfs image can be used without having to first decompress the
# image.

# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the
# server. If this filesystem type is not needed, disable it.

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
#   include cis_linux_2_0_0::disable_cramfs_1_1_1_1
class cis_linux_2_0_0::disable_cramfs_1_1_1_1 {

  # Ensure /etc/modprobe.d directory exists
  file { '/etc/modprobe.d':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
   
  file { '/etc/modprobe.d/cramfs.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/cis_linux_2_0_0/disable_cramfs_1_1_1_1.cramfs.conf',


# Added in case, for whatever reason, /etc/profile.d does not exist
  file { '/etc/profile.d':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  # Create the profile script from epp template
  file { '/etc/profile.d/900-PS1.sh':
    ensure  => present,
    content => epp('ps1_prompt/900-PS1.sh.epp'),
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  } 

}
