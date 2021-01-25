# @summary 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
#
# 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
# ---------------------------------------------------------------
# ---------------------------------------------------------------

# Description:
# Periodic checking of the filesystem integrity is needed to detect changes to the filesystem.

# Rationale:
# Periodic file checking allows the system administrator to determine on a regular basis if
# critical files have been changed in an unauthorized fashion.

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
#   include cis_linux_2_0_0::aide_integrity_check_1_3_2
class cis_linux_2_0_0::aide_integrity_check_1_3_2 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::aide_integrity_check_1_3_2::apply_cis_control')
) {
  if $apply_cis_control {
    cron { 'aide':
      minute   => '0',
      hour     => '5',
      monthday => '*',
      month    => '*',
      weekday  => '*',     
      user     => 'root',
      command  => '/usr/sbin/aide --check',
    }
  }
}
