# @summary 1.6.1.1 Ensure SELinux or AppArmor are installed (Scored)
#
# Description:
# SELinux and AppArmor provide Mandatory Access Controls.
# 
# Rationale:
# Without a Mandatory Access Control system installed only the default Discretionary Access
# Control system will be available.
# 
# CIS Controls:
# - Version 6
#   - 14.4 Protect Information With Access Control Lists
#     All information stored on systems shall be protected with file system, network share,
#     claims, application, or database specific access control lists. These controls will enforce the
#     principle that only authorized individuals should have access to the information based on
#     their need to access the information as a part of their responsibilities.
# - Version 7
#   - 14.6 Protect Information through Access Control Lists
#     Protect all information stored on systems with file system, network share, claims,
#     application, or database specific access control lists. These controls will enforce the
#     principle that only authorized individuals should have access to the information based on
#     their need to access the information as a part of their responsibilities.
#
# @example
#   include cis_linux_2_0_0::ensure_selinux_installed_1_6_1_1
class cis_linux_2_0_0::ensure_selinux_installed_1_6_1_1 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::ensure_selinux_installed_1_6_1_1::apply_cis_control')
) {

  if $apply_cis_control {
    ensure_packages(
      libselinux, {
        ensure => installed,
      }
    )
  }
}
