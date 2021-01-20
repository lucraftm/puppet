# @summary this class disables udf
#
# 1.1.1.4 Ensure mounting of udf filesystems is disabled (Scored)
# ---------------------------------------------------------------

# Description:
# The udf filesystem type is the universal disk format used to implement ISO/IEC 13346 and
# ECMA-167 specifications. This is an open vendor filesystem type for data storage on a
# broad range of media. This filesystem type is necessary to support writing DVDs and newer
# optical disc formats.

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
#   include cis_linux_2_0_0::disable_udf_1_1_1_7
class cis_linux_2_0_0::disable_udf_1_1_1_7 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::disable_udf_1_1_1_7::apply_cis_control', Boolean)
) {
  if $apply_cis_control {
    kmod::install { 'udf': command => '/bin/true' }
    kmod::load    { 'udf': ensure  => absent       }
  }
}
