# @summary 1.1.23 Disable USB Storage (Scored)
#
# 1.1.23 Disable USB Storage (Scored)
# -----------------------------------
# -----------------------------------

# Description:
# USB storage provides a means to transfer and store files insuring persistence and
# availability of the files independent of network connection status. Its popularity and utility
# has led to USB-based malware being a simple and common means for network infiltration
# and a first step to establishing a persistent threat within a networked environment.

# Rationale:
# Restricting USB access on the system will decrease the physical attack surface for a device
# and diminish the possible vectors to introduce malware.

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
#   include cis_linux_2_0_0::disable_usb_storage_1_1_23
class cis_linux_2_0_0::disable_usb_storage_1_1_23 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::disable_usb_storage_1_1_23::apply_cis_control', Boolean)
) {
  if $apply_cis_control {
    kmod::install { 'usb-storage': command => '/bin/true' }
    kmod::load    { 'usb-storage': ensure  => absent       }
  }
}
