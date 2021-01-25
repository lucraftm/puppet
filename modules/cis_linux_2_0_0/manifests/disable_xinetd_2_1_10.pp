# @summary 2.1.10 Ensure xinetd is not enabled (Scored)
#
# Description:
# The eXtended InterNET Daemon ( xinetd ) is an open source super daemon that replaced
# the original inetd daemon. The xinetd daemon listens for well known services and
# dispatches the appropriate daemon to properly respond to service requests.
#
# Rationale:
# If there are no xinetd services required, it is recommended that the daemon be disabled.
#
# CIS Controls:
# - Version 6
#   - 9.1 Limit Open Ports, Protocols, and Services
#     Ensure that only ports, protocols, and services with validated business needs are running
#     on each system.
# - Version 7
#   - 9.2 Ensure Only Approved Ports, Protocols and Services Are Running
#     Ensure that only network ports, protocols, and services listening on a system with
#     validated business needs, are running on each system.
#
# @example
#   include cis_linux_2_0_0::disable_xinetd_2_1_10
class cis_linux_2_0_0::disable_xinetd_2_1_10 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::disable_xinetd_2_1_10::apply_cis_control')
) {
  if $apply_cis_control {
    service { 'xinetd':
      ensure => stopped,
      enable => false,
    }
  }
}
