# @summary this class disables freevxfs
#
# 1.1.1.2 Ensure mounting of freevxfs filesystems is disabled (Scored)
# --------------------------------------------------------------------

# Description:
# The freevxfs filesystem type is a free version of the Veritas type filesystem. This is the
# primary filesystem type for HP-UX operating systems.

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
#   include cis_linux_2_0_0::disable_freevxfs_1_1_1_2
class cis_linux_2_0_0::disable_freevxfs_1_1_1_2 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::disable_freevxfs_1_1_1_2::apply_cis_control', Boolean)
) {
  if $apply_cis_control {
    kmod::install { 'freevxfs': command => '/bin/true' }
    kmod::load    { 'freevxfs': ensure  => absent       }
  }
}
