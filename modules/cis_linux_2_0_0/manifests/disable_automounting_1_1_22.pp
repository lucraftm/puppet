# @summary Disable Automounting (Scored)
#
# 1.1.22 Disable Automounting (Scored)
# ------------------------------------
# ------------------------------------

# Description:
# autofs allows automatic mounting of devices, typically including CD/DVDs and USB drives.

# Rationale:
# With automounting enabled anyone with physical access could attach a USB drive or disc
# and have its contents available in system even if they lacked permissions to mount it
# themselves.

# CIS Controls:
# - Version 6
#   - 8.3 Limit Use Of External Devices (i.e. USB)
#     Limit use of external devices to those with an approved, documented business need.
#     Monitor for use and attempted use of external devices. Configure laptops, workstations,
#     and servers so that they will not auto-run content from removable media, like USB tokens
#     (i.e., “thumb drives”), USB hard drives, CDs/DVDs, FireWire devices, external serial
#     advanced technology attachment devices, and mounted network shares. Configure systems
#     so that they automatically conduct an anti-malware scan of removable media when
#     inserted.
# - Version 7
#   - 8.4 Configure Anti-Malware Scanning of Removable Devices
#     Configure devices so that they automatically conduct an anti-malware scan of removable
#     media when inserted or connected.
#   - 8.5 Configure Devices Not To Auto-run Content
#     Configure devices to not auto-run content from removable media.
#
# @example
#   include cis_linux_2_0_0::disable_automounting_1_1_22
class cis_linux_2_0_0::disable_automounting_1_1_22 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::disable_automounting_1_1_22::apply_cis_control', Boolean)
) {
  if $apply_cis_control {
    service { 'autofs':
      ensure => stopped,
      enable => false,
    }  
  }
}
