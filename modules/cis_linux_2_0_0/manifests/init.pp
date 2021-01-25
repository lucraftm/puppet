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
  include cis_linux_2_0_0::install_aide_1_3_1
  include cis_linux_2_0_0::aide_integrity_check_1_3_2
  include cis_linux_2_0_0::restrict_core_dumps_1_5_1
  include cis_linux_2_0_0::enable_aslr_1_5_3
  include cis_linux_2_0_0::disable_prelink_1_5_4
  include cis_linux_2_0_0::ensure_selinux_installed_1_6_1_1
  include cis_linux_2_0_0::motd_config_1_7_1_1
  include cis_linux_2_0_0::login_banner_config_1_7_1_2
  include cis_linux_2_0_0::remote_login_banner_config_1_7_1_3
  include cis_linux_2_0_0::disable_xinetd_2_1_10
}
