# @summary this class disables jffs2
#
# 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)
# -----------------------------------------------------------------
#
# Description:
# The jffs2 (journaling flash filesystem 2) filesystem type is a log-structured filesystem used
# in flash memory devices.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the
# system. If this filesystem type is not needed, disable it.
#
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
#   include cis_linux_2_0_0::disable_jffs2_1_1_1_3
class cis_linux_2_0_0::disable_jffs2_1_1_1_3 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::disable_jffs2_1_1_1_3::apply_cis_control', Boolean)
) {
  if $apply_cis_control {
    kmod::install { 'jffs2': command => '/bin/true' }
    kmod::load    { 'jffs2': ensure  => absent       }
  }
}
