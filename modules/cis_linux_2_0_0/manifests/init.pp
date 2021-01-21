# @summary This class applies CIS Independant Linux Benchmark 2.0.0
#
# This class is intended to implement the secure standards set out in 
# CIS Benchmark 2.0.0
#
# @example
#   include cis_linux_2_0_0
class cis_linux_2_0_0 {
  include cis_linux_2_0_0::disable_cramfs_1_1_1_1
  include cis_linux_2_0_0::disable_freevxfs_1_1_1_2
  include cis_linux_2_0_0::disable_jffs2_1_1_1_3
  include cis_linux_2_0_0::disable_hfs_1_1_1_4
  include cis_linux_2_0_0::disable_hfsplus_1_1_1_5
  include cis_linux_2_0_0::disable_squashfs_1_1_1_6
  include cis_linux_2_0_0::disable_udf_1_1_1_7
  include cis_linux_2_0_0::disable_automounting_1_1_22
  include cis_linux_2_0_0::disable_usb_storage_1_1_23
}
