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
class cis_linux_2_0_0::disable_cramfs_1_1_1_1 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::disable_cramfs_1_1_1_1::apply_cis_control', Boolean)
) {
  if $apply_cis_control {
    kmod::install { 'cramfs': command => '/bin/true' }
    kmod::load    { 'cramfs': ensure  => absent       }
  }
}
