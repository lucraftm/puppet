# @summary this class disables squashfs
#
# 1.1.1.4 Ensure mounting of squashfs filesystems is disabled (Scored)
# ---------------------------------------------------------------

# Description:
# The squashfs filesystem type is a compressed read-only Linux filesystem embedded in
# small footprint systems (similar to cramfs ). A squashfs image can be used without having
# to first decompress the image.

# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the
# system. If this filesystem type is not needed, disable it.

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
#   include cis_linux_2_0_0::disable_squashfs_1_1_1_6
class cis_linux_2_0_0::disable_squashfs_1_1_1_6 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::disable_squashfs_1_1_1_6::apply_cis_control', Boolean)
) {
  if $apply_cis_control {
    kmod::install { 'squashfs': command => '/bin/true' }
    kmod::load    { 'squashfs': ensure  => absent       }
  }
}
