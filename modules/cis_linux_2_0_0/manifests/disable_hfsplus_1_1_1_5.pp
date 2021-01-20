# @summary this class disables hfsplus
#
# 1.1.1.4 Ensure mounting of hfsplus filesystems is disabled (Scored)
# ---------------------------------------------------------------

# Description:
# The hfsplus filesystem type is a hierarchical filesystem designed to replace hfs that allows
# you to mount Mac OS filesystems.

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
#   include cis_linux_2_0_0::disable_hfsplus_1_1_1_5
class cis_linux_2_0_0::disable_hfsplus_1_1_1_5 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::disable_hfsplus_1_1_1_5::apply_cis_control', Boolean)
) {
  if $apply_cis_control {
    kmod::install { 'hfsplus': command => '/bin/true' }
    kmod::load    { 'hfsplus': ensure  => absent       }
  }
}
