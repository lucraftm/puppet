# @summary this class disables hfs
#
# 1.1.1.4 Ensure mounting of hfs filesystems is disabled (Scored)
# ---------------------------------------------------------------

# Description:
# The hfs filesystem type is a hierarchical filesystem that allows you to mount Mac OS
# filesystems.

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
#   include cis_linux_2_0_0::disable_hfs_1_1_1_4
class cis_linux_2_0_0::disable_hfs_1_1_1_4 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::disable_hfs_1_1_1_4::apply_cis_control', Boolean)
) {
  if $apply_cis_control {
    kmod::install { 'hfs': command => '/bin/true' }
    kmod::load    { 'hfs': ensure  => absent       }
  }
}
