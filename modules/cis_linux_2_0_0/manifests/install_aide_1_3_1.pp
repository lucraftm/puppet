# @summary 1.3.1 Ensure AIDE is installed (Scored)
#
# 1.3.1 Ensure AIDE is installed (Scored)
# ---------------------------------------
# ---------------------------------------

# Description:
# AIDE takes a snapshot of filesystem state including modification times, permissions, and
# file hashes which can then be used to compare against the current state of the filesystem to
# detect modifications to the system.

# Rationale:
# By monitoring the filesystem state compromised files can be detected to prevent or limit
# the exposure of accidental or malicious misconfigurations or modified binaries.

# CIS Controls:
# - Version 6
#   - 3.5 Use File Integrity Tools For Critical System Files
#     Use file integrity checking tools to ensure that critical system files (including sensitive
#     system and application executables, libraries, and configurations) have not been altered.
#     The reporting system should: have the ability to account for routine and expected changes;
#     highlight and alert on unusual or unexpected alterations; show the history of configuration
#     changes over time and identify who made the change (including the original logged-in
#     account in the event of a user ID switch, such as with the su or sudo command). These
#     integrity checks should identify suspicious system alterations such as: owner and
#     permissions changes to files or directories; the use of alternate data streams which could
#     be used to hide malicious activities; and the introduction of extra files into key system
#     areas (which could indicate malicious payloads left by attackers or additional files
#     inappropriately added during batch distribution processes).
# - Version 7
#   - 14.9 Enforce Detail Logging for Access or Changes to Sensitive Data
#     Enforce detailed audit logging for access to sensitive data or changes to sensitive data
#     (utilizing tools such as File Integrity Monitoring or Security Information and Event
#     Monitoring).
#
# @example
#   include cis_linux_2_0_0::install_aide_1_3_1
class cis_linux_2_0_0::install_aide_1_3_1 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::install_aide_1_3_1::apply_cis_control', Boolean)
) {
  if $apply_cis_control {
    package { 'aide':
      ensure => present,
      notify => Exec['aide init'],
    }
    exec { 'aide init':
      command     => 'aide --init',
      path        => '/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin',
      refreshonly => true,
    }
    file { '/var/lib/aide/aide.db.gz':
      source  => '/var/lib/aide/aide.db.new.gz',
      require => Exec['aide init'],
    }
  }
}
