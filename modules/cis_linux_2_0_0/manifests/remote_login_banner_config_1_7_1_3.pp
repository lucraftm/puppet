# @summary 1.7.1.3 Ensure remote login warning banner is configured properly (Scored)
#
# Description:
# The contents of the /etc/issue.net file are displayed to users prior to login for remote
# connections from configured services.
# Unix-based systems have typically displayed information about the OS release and patch
# level upon logging in to the system. This information can be useful to developers who are
# developing software for a particular OS platform. If mingetty(8) supports the following
# options, they display operating system information: \m - machine architecture \r -
# operating system release \s - operating system name \v - operating system version
#
# Rationale:
# Warning messages inform users who are attempting to login to the system of their legal
# status regarding the system and must include the name of the organization that owns the
# system and any monitoring policies that are in place. Displaying OS and patch level
# information in login banners also has the side effect of providing detailed system
# information to attackers attempting to target specific exploits of a system. Authorized users
# can easily get this information by running the " uname -a " command once they have logged
# in.
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
#   include cis_linux_2_0_0::remote_login_banner_config_1_7_1_3
class cis_linux_2_0_0::remote_login_banner_config_1_7_1_3 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::remote_login_banner_config_1_7_1_3::apply_cis_control')
) {

  if $apply_cis_control {
    file { '/etc/issue.net':
      ensure => present,
      source  => 'puppet:///modules/cis_linux_2_0_0/issue.net',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
  }

}
